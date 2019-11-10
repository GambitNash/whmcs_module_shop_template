<div id="whmcs_module_shop_cart">
    <div class="text-center">
        <h3 id="headline">
            {if $productGroup.headline}
                {$productGroup.headline}
            {else}
                {$productGroup.name}
            {/if}
        </h3>
        {if $productGroup.tagline}
            <h4 class="tagline">{$productGroup.tagline}</h4>
        {/if}
        {if $errormessage}
            <div class="alert alert-danger">
                {$errormessage}
            </div>
        {/if}
    </div>
    <div class="products-wrapper">
        <div id="products">
            {foreach $products as $product}
                <div id="product{$product@iteration}"{if $product.isFeatured} class="featured"{/if}>
                    <div class="panel panel-default text-center">
                        <div class="panel-heading">
                            <h3 id="product{$product@iteration}-name" class="panel-title">{$product.name}</h3>
                        </div>
                        <div class="bg banner">
                            {if $product.tagLine}
                                <p id="product{$product@iteration}-tag-line">{$product.tagLine}</p>
                            {/if}
                            {if $product.isFeatured}
                                <div class="popular-plan">
                                    {$LANG.featuredProduct|upper}
                                </div>
                            {/if}
                            <div id="product{$product@iteration}-price" class="price">
                                <h3>
                                    {if $product.bid}
                                        {$LANG.bundledeal}
                                        {if $product.displayprice}
                                            <small>{$product.displayPriceSimple}</small>
                                        {/if}
                                    {elseif $product.paytype eq "free"}
                                        {$LANG.orderfree}
                                    {elseif $product.paytype eq "onetime"}
                                        {$product.pricing.onetime} {$LANG.orderpaymenttermonetime}
                                    {else}
                                        {if $product.pricing.hasconfigoptions}
                                            {$LANG.from}
                                        {/if}
                                        {$product.pricing.minprice.cycleText}
                                        {if $product.pricing.minprice.setupFee}
                                            <br>
                                            <small>{$product.pricing.minprice.setupFee->toPrefixed()} {$LANG.ordersetupfee}</small>
                                        {/if}
                                    {/if}
                                </h3>
                            </div>
                        </div>
                        {if $product.qty eq "0"}
                            <a href="#" class="btn btn-block btn-lg btn-primary order-buttonunavailable" id="product{$product@iteration}-unavailable">{$LANG.outofstock}</a>
                        {else}
                            <a href="{$smarty.server.PHP_SELF}?a=add&amp;{if $product.bid}bid={$product.bid}{else}pid={$product.pid}{/if}" class="btn btn-block btn-lg btn-primary order-button" id="product{$product@iteration}-order-button">
                                {$LANG.ordernowbutton}
                            </a>
                        {/if}
                        <ul class="list-group">
                            {foreach $product.features as $feature => $value}
                                <li id="product{$product@iteration}-feature{$value@iteration}" class="list-group-item">
                                    {$value} {$feature}
                                </li>
                                {foreachelse}
                                <li id="product{$product@iteration}-description" class="list-group-item">
                                    {$product.description}
                                </li>
                            {/foreach}
                        </ul>
                    </div>
                    <div class="clearfix"></div>
                </div>
            {/foreach}
        </div>
    </div>
    {if count($productGroup.features) > 0}
        <div class="includes-features">
            <div class="row clearfix">
                <div class="col-md-12">
                    <h3 class="text-center">{$LANG.orderForm.includedWithPlans}</h3>
                    <div class="row">
                        {foreach $productGroup.features as $features}
                            <div class="col-sm-3 text-center text-muted"><span class="fa fa-check"></span> {$features.feature}</div>
                        {/foreach}
                    </div>
                </div>
            </div>
        </div>
    {/if}
</div>
