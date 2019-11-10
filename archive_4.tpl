<div class="cms-container cms-archive cms-type-{$type.id}" id="cms-type-{$type.id}">
    {foreach from=$items item=content}
        <article class="cms-content {if $content@iteration is even by 1}bg break-out {/if}banner" id="cms-content-{$content.id}">
            <div class="container">
                {if $content@iteration is even by 1}
                    <div class="col-sm-8">
                        <h1>{$content.title}</h1>
                        <h4>{include file="string:{$content.tag_line}"}</h4>
                        <div class="content">
                            {include file="string:{$content.meta.summary}"}
                            <p class="action"><a class="btn btn-lg btn-primary" href="{$systemurl}{$type.path}/{$content.path}" title="{$content.title}">View Module</a></p>
                        </div>
                    </div>
                    <div class="module-image col-sm-4 text-center hidden-xs">
                        <img src="{$content.meta.logo}"/>
                    </div>
                {else}
                    <div class="module-image col-sm-4 text-center hidden-xs">
                        <img src="{$content.meta.logo_inverted}"/>
                    </div>
                    <div class="col-sm-8">
                        <h1>{$content.title}</h1>
                        <h4>{include file="string:{$content.tag_line}"}</h4>
                        <div class="content">
                            {include file="string:{$content.meta.summary}"}
                            <p class="action"><a class="btn btn-lg btn-primary" href="{$systemurl}{$type.path}/{$content.path}" title="{$content.title}">View Module</a></p>
                        </div>
                    </div>
                {/if}
            </div>
        </article>
    {foreachelse}
        <p>{lang key="norecordsfound"}</p>
    {/foreach}
    {if $items && $total_pages > 1}
        <div class="clearfix">
            <ul class="pagination">
                <li {if $current_page == 1} class="disabled"{/if}><a href="{$systemurl}{$type.path}?page={$current_page - 1}"{if $current_page == 1} onclick="return false;"{/if}>&laquo;</a></li>
                {foreach from=$pages item=page}
                    <li{if $current_page == $page} class="active"{/if}><a href="{$systemurl}{$type.path}?page={$page}">{$page}</a></li>
                {/foreach}
                <li {if $current_page == $total_pages} class="disabled"{/if}><a href="{$systemurl}{$type.path}?page={$current_page + 1}"{if $current_page == $total_pages} onclick="return false;"{/if}>&raquo;</a></li>
            </ul>
        </div>
    {/if}
</div>
