
                </div><!-- /.main-content -->
                {if !$inShoppingCart && $secondarySidebar->hasChildren()}
                    <div class="col-md-3 pull-md-left sidebar sidebar-secondary">
                        {include file="$template/includes/sidebar.tpl" sidebar=$secondarySidebar}
                    </div>
                {/if}
            <div class="clearfix"></div>
        </div>
    </div>
</section>

<section id="footer">
    <form action="https://whmcsmoduleshop.us10.list-manage.com/subscribe/post?u=4542bd171e0fd3e8484161edd&amp;id=04e784b11b" method="post" id="mc-embedded-subscribe-form" name="mc-embedded-subscribe-form" target="_blank">
        <div class="container">
            <div class="row">
                <div class="col-sm-4 about">
                    <h4>About Us</h4>
                    <p>
                        WHMCS Module Shop specialise in developing modules which enhance the ability for WHMCS to be used as a "website" and not just a billing/automation platform.<br/>
                        We have some highly successful modules which add features such as SEO, Page generation, Social interaction and much more.
                    </p>
                    <div class="socials">
                        <a href="https://www.facebook.com/whmcsmoduleshop" target="_blank" class="facebook" data-toggle="tooltip" title="Follow Us on Facebook">
                            <span class="fab fa-facebook-f"></span>
                        </a>
                        <a href="https://twitter.com/@whmcsmoduleshop" target="_blank" class="twitter" data-toggle="tooltip" title="Follow Us on Twitter">
                            <span class="fab fa-twitter"></span>
                        </a>
                        <a href="https://www.youtube.com/channel/UC-wXRjQaeSDwg68nEcLU3Nw" target="_blank" class="youtube" data-toggle="tooltip" title="Follow Us on YouTube">
                            <span class="fab fa-youtube"></span>
                        </a>
                    </div>
                    <p>UK Registered Company <strong>#7077994</strong>.</p>
                    <p>VAT Number <strong>GB 985 4678 52</strong>.</p>
                    <p>Copyright © {$date_year} <a href="{$systemsslurl}">{$companyname}</a>. All Rights Reserved.</p>
                </div>
                <div class="col-sm-8">
                    <div class="row">
                        <div class="col-sm-6">
                            <h4>Newsletter</h4>
                            <p>Want to stay up to date with all our latest news, including module releases, promotions, and all things WHMCS?</p>
                            <div class="form-group">
                                <label class="sr-only" for="name-list">First Name</label>
                                <input type="text" name="FNAME" id="name-list" class="form-control" placeholder="Enter your First Name" style="background-image: url(&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAfBJREFUWAntVk1OwkAUZkoDKza4Utm61iP0AqyIDXahN2BjwiHYGU+gizap4QDuegWN7lyCbMSlCQjU7yO0TOlAi6GwgJc0fT/fzPfmzet0crmD7HsFBAvQbrcrw+Gw5fu+AfOYvgylJ4TwCoVCs1ardYTruqfj8fgV5OUMSVVT93VdP9dAzpVvm5wJHZFbg2LQ2pEYOlZ/oiDvwNcsFoseY4PBwMCrhaeCJyKWZU37KOJcYdi27QdhcuuBIb073BvTNL8ln4NeeR6NRi/wxZKQcGurQs5oNhqLshzVTMBewW/LMU3TTNlO0ieTiStjYhUIyi6DAp0xbEdgTt+LE0aCKQw24U4llsCs4ZRJrYopB6RwqnpA1YQ5NGFZ1YQ41Z5S8IQQdP5laEBRJcD4Vj5DEsW2gE6s6g3d/YP/g+BDnT7GNi2qCjTwGd6riBzHaaCEd3Js01vwCPIbmWBRx1nwAN/1ov+/drgFWIlfKpVukyYihtgkXNp4mABK+1GtVr+SBhJDbBIubVw+Cd/TDgKO2DPiN3YUo6y/nDCNEIsqTKH1en2tcwA9FKEItyDi3aIh8Gl1sRrVnSDzNFDJT1bAy5xpOYGn5fP5JuL95ZjMIn1ya7j5dPGfv0A5eAnpZUY3n5jXcoec5J67D9q+VuAPM47D3XaSeL4AAAAASUVORK5CYII=&quot;); background-repeat: no-repeat; background-attachment: scroll; background-size: 16px 18px; background-position: 98% 50%; cursor: auto;">
                            </div>
                            <div class="form-group">
                                <label class="sr-only" for="name-list">Last Name</label>
                                <input type="text" name="LNAME" id="name-list" class="form-control" placeholder="Enter your Last Name">
                            </div>
                            <div class="form-group">
                                <label class="sr-only" for="email-list">Email</label>
                                <input type="text" name="EMAIL" id="email-list" class="form-control" placeholder="Enter your Email Address">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <h4>Marketing Permissions</h4>
                            <p><small>WHMCS Module Shop will use the information you provide on this form to be in touch with you and to provide updates and marketing. Please let us know all the ways you would like to hear from us:</small></p>
                            <div class="content__gdpr">
                                <fieldset class="checkbox">
                                    <label class="subfield" for="gdpr_3397">
                                        <input type="checkbox" id="gdpr_3397" name="gdpr[3397]" value="Y" class="av-checkbox gdpr"> Email
                                    </label>
                                </fieldset>
                                <fieldset class="checkbox">
                                    <label class="subfield" for="gdpr_3401">
                                        <input type="checkbox" id="gdpr_3401" name="gdpr[3401]" value="Y" class="av-checkbox gdpr"> Direct Mail
                                    </label>
                                </fieldset>
                                <fieldset class="checkbox">
                                    <label class="subfield" for="gdpr_3405">
                                        <input type="checkbox" id="gdpr_3405" name="gdpr[3405]" value="Y" class="av-checkbox gdpr"> Customized online advertising
                                    </label>
                                </fieldset>
                            </div>
                            <input type="submit" name="subscribe" id="mc-embedded-subscribe" class="btn btn-primary" value="Subscribe">
                            <div style="position: absolute; left: -5000px;" aria-hidden="true"><input type="text" name="b_4542bd171e0fd3e8484161edd_04e784b11b" tabindex="-1" value=""></div>
                        </div>
                    </div>
                    <p><small>We use Mailchimp as our marketing platform. By clicking above to subscribe, you acknowledge that your information will be transferred to Mailchimp for processing. <a href="https://mailchimp.com/legal/" target="_blank">Learn more about Mailchimp's privacy practices here.</a></small></p>
                </div>
            </div>
        </div>
    </form>
</section>

<div class="modal system-modal fade" id="modalAjax" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content panel-primary">
            <div class="modal-header panel-heading">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span>
                    <span class="sr-only">{$LANG.close}</span>
                </button>
                <h4 class="modal-title"></h4>
            </div>
            <div class="modal-body panel-body">
                {$LANG.loading}
            </div>
            <div class="modal-footer panel-footer">
                <div class="pull-left loader">
                    <i class="fas fa-circle-notch fa-spin"></i>
                    {$LANG.loading}
                </div>
                <button type="button" class="btn btn-default" data-dismiss="modal">
                    {$LANG.close}
                </button>
                <button type="button" class="btn btn-primary modal-submit">
                    {$LANG.submit}
                </button>
            </div>
        </div>
    </div>
</div>

{include file="$template/includes/generate-password.tpl"}

<a href="#" class="btn btn-default back-to-top"><i class="fas fa-chevron-up"></i></a>

{$footeroutput}

<!-- Mailchimp Popup -->
<script type="text/javascript" src="//downloads.mailchimp.com/js/signup-forms/popup/unique-methods/embed.js" data-dojo-config="usePlainJson: true, isDebug: false"></script>
<script type="text/javascript">
    {literal}
    window.dojoRequire(["mojo/signup-forms/Loader"], function(L) { L.start({"baseUrl":"mc.us10.list-manage.com","uuid":"4542bd171e0fd3e8484161edd","lid":"04e784b11b","uniqueMethods":true}) })
    {/literal}
</script>

</body>
</html>
