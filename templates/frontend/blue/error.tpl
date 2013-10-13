<div id="content">
    <div class="left span-755">
        <div class="box">            
            <div class="btitle"><h2>{t c='global.ERROR'}</h2></div>
            <div class="error_message">{$message}</div>
        </div>
        {insert name=adv assign=adv group='index_bottom'}
        {if $adv}<br /><div class="ads">{$adv}</div><br />{/if}
    </div>
    <div class="right span-200">
        <div class="box">
            
            <div class="btitle"><h2>{t c='global.sponsors'}</h2></div>
            {insert name=adv assign=adv group='index_right'}
            {if $adv}<br /><div class="ads">{$adv}</div><br />{/if}
        </div>
    </div>
    <div class="clear"></div>
</div>