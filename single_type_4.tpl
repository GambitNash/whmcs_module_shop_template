<div class="cms-container cms-single cms-type-{$type.id}" id="cms-content-{$content.id}">
    <article class="cms-content">
        <div class="content">
            {include file="string:{$content.content}"}
        </div>
    </article>
    {if $facebookcomments}
        <br />
        <br />
    {literal}
        <div id="fb-root">
        </div>
        <script>(function(d, s, id) {
				var js, fjs = d.getElementsByTagName(s)[0];
				if (d.getElementById(id)) {return;}
				js = d.createElement(s); js.id = id;
				js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
				fjs.parentNode.insertBefore(js, fjs);
			}(document, 'script', 'facebook-jssdk'));</script>
    {/literal}
        <fb:comments href="{fqdnRoutePath('announcement-view', $id, $urlfriendlytitle)}" num_posts="5" width="100%"></fb:comments>
    {/if}
</div>
