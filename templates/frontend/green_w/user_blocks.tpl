<div id="content">
    <div class="left span-755">
        <div class="box">        
        <div class="btitle"><h2>{t c='user.BLOCK_TITLE'}</h2></div>
            <br />
            <div class="block_username"><strong>{t c='global.username'}</strong></div>
            <div class="block_action"><strong>{t c='global.action'}</strong></div>
            <div class="clear"></div>
            {if $blocks}
            {section name=i loop=$blocks}
            <div class="block_username">{$blocks[i].username}</div>
            <div class="block_action" id="unblock_{$blocks[i].UID}"><a href="#unblock" id="unblock_username_{$blocks[i].UID}">{t c='user.unblock'}</a></div>
            <div class="clear"></div>
            {/section}
            {else}
            <div class="block_none">{t c='user.block_none'}</div>
            {/if}
        </div>
        <div class="box">
            <div class="btitle"><h2>{t c='global.SPONSORS'}</h2></div>
        </div>
    </div>
    <div class="right span-200">
        <div class="box">
            <div class="btitle"><h2>{t c='global.SPONSORS'}</h2></div>
        </div>
    </div>
    <div class="clear"></div>
</div>
