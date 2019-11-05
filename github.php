<?php
/**
 * Gambit Nash Endpoint for Github Webhook URLs
 *
 * @see https://help.github.com/articles/post-receive-hooks
 * @see https://gist.github.com/gka/4627519
 * @author Gregor Aisch / @gka
 * @author Daniel Wilson / @Danw33
 * @license MIT
 * @version 1.0.2
 */

/** NewRelic APM Support */
if (extension_loaded('newrelic')) {
	newrelic_set_appname('WHMCS Module Shop Development - NewRelic APM');
}

// script errors will be send to this email:
$error_mail = "webmaster@gambitnash.co.uk";

/**
 * Run the web hook actions
 *
 * @return bool true on success
 * @throws Exception when something is wrong
 */
function run_hook() {

	if ( function_exists( 'newrelic_record_custom_event' ) ) {
		@newrelic_record_custom_event(
			'GitHub Hook Fired',
			array(
				'file' => __FILE__,
				'host' => $_SERVER['HTTP_HOST'],
				'gn_timestamp' => microtime(),
			)
		);
	}

	// read config.json
	$config_filename = '.gn-gh-config.json';
	if (!file_exists($config_filename)) {
		throw new Exception("Can't find configuration file");
	}
	$config = json_decode(file_get_contents($config_filename), true);

	$postBody = $_POST['payload'];
	$payload = json_decode($postBody);

	$headers = '';
	if (isset($config['email'])) {
		$headers .= 'From: '.$config['email']['from']."\r\n";
		$headers .= 'CC: ' . $payload->pusher->email . "\r\n";
		$headers .= "MIME-Version: 1.0\r\n";
		$headers .= "Content-Type: text/html; charset=ISO-8859-1\r\n";
	}

	// check if the request appears to come from github server
	if ( ! (false === strpos($_SERVER['HTTP_USER_AGENT'], 'GitHub-Hookshot/')) ) {
		foreach ($config['endpoints'] as $endpoint) {
			// check if the push came from the right repository and branch
			if ($payload->repository->url == 'https://github.com/' . $endpoint['repo']
				&& $payload->ref == 'refs/heads/' . $endpoint['branch']) {

				// execute update script, and record its output
				ob_start();
				passthru($endpoint['run']);
				$output = ob_get_contents();
				ob_end_clean();

				// prepare and send the notification email
				if (isset($config['email'])) {
					// send mail to someone, and the github user who pushed the commit
					$body = '<p>The Github user <a href="https://github.com/'
						. $payload->pusher->name .'">@' . $payload->pusher->name . '</a>'
						. ' has pushed to ' . $payload->repository->url
						. ' and consequently, ' . $endpoint['action']
						. '.</p>';

					$body .= '<p>Here\'s a brief list of what has been changed:</p>';
					$body .= '<ul>';
					foreach ($payload->commits as $commit) {
						$body .= '<li>'.$commit->message.'<br />';
						$body .= '<small style="color:#999">added: <b>'.count($commit->added)
							.'</b> &nbsp; modified: <b>'.count($commit->modified)
							.'</b> &nbsp; removed: <b>'.count($commit->removed)
							.'</b> &nbsp; <a href="' . $commit->url
							. '">read more</a></small></li>';
					}
					$body .= '</ul>';
					$body .= '<p>What follows is the output of the script:</p><pre>';
					$body .= $output. '</pre>';
					$body .= '<p>Cheers, <br/>Gambit Nash Github Webhook Endpoint</p>';

					if ( function_exists( 'newrelic_record_custom_event' ) ) {
						@newrelic_record_custom_event(
							'GitHub Hook Completed',
							array(
								'repository' => $payload->repository->url,
								'pusher' => $payload->pusher->name,
								'file' => __FILE__,
								'host' => $_SERVER['HTTP_HOST'],
								'gn_timestamp' => microtime(),
							)
						);
					}

					mail($config['email']['to'], $endpoint['action'], $body, $headers);

				}

				// If the reset_opcache flag is set, clear the contents of the opcode cache
				if (isset($endpoint['reset_opcache']) && true === $endpoint['reset_opcache']) {
					opcache_reset();
				}

				// Everything went OK!
				return true;
			}
		}
	} else {
		throw new Exception("This does not appear to be a valid request from Github. Remote Address: '" . $_SERVER['REMOTE_ADDR'] . "'\n");
	}

	return false;
}

try {
	if (!isset($_POST['payload'])) {
		//echo "Works fine.";
		header($_SERVER["SERVER_PROTOCOL"]." 404 Not Found");
	} else {
		@ini_set( 'memory_limit', '1024M' );
		@ini_set( 'max_execution_time', 600 );
		run_hook();
	}
} catch ( Exception $e ) {
	$msg = $e->getMessage();
	mail($error_mail, $msg, ''.$e);

	if ( function_exists( 'newrelic_record_custom_event' ) ) {
		@newrelic_record_custom_event(
			'GitHub Hook Exception',
			array(
				'message' => $msg,
				'file' => __FILE__,
				'host' => $_SERVER['HTTP_HOST'],
				'gn_timestamp' => microtime(),
			)
		);
	}

	header($_SERVER["SERVER_PROTOCOL"]." 404 Not Found");
}
