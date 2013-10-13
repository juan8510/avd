<div id="content">
    <div class="left span-755">
        <h1>{$site_name|escape:'html'} Notice</h1>
        {section name=i loop=$notices}
        <div class="box">            
            <div class="btitle"><h2><a href="{$relative}/notice/{$notices[i].NID}/{$notices[i].title|clean}">{$notices[i].title|escape:'html'}</a></h2></div>
            <div class="notice_info">
                <div class="notice_info_left">
                    {insert name=time_range assign=addtime time=$notices[i].addtime}
                    {$addtime}
                </div>
                <div class="notice_info_right">
                    {t c='global.by'}: <a href="{$relative}/user/{$notices[i].username}">{$notices[i].username|escape:'html'}</a>
                </div>
                <div class="clear"></div>
            </div>
            <div class="notice_content">
                {$notices[i].content}
            </div>
            <div class="clear"></div>
            <div class="notice_footer">
                <a href="{$relative}/notice/{$notices[i].NID}/{$notices[i].title|clean}">{t c='notice.comments'} ({$notices[i].total_comments})</a> <strong>&middot;</strong>
                <a href="{$relative}/notice/{$notices[i].NID}/{$notices[i].title|clean}">{t c='notice.add_comment'}</a>
            </div>
        </div>
        {/section}
        <div class="pagination"><ul>{$page_link}</ul></div>
    </div>    
    <div class="right span-200">
        <h1>&nbsp;</h1>
        <div class="box">
            <div class="btitle"><h2>{t c='global.CATEGORIES'}</h2></div>
            <ul class="notice_categories">
                <li><a href="{$relative}/notices">{t c='global.all'}</a></li>
                {section name=i loop=$categories}
                <li><a href="{$relative}/notices?c={$categories[i].category_id}">{$categories[i].name|escape:'html'}</a></li>
                {/section}
            </ul>
            <div class="clear_left"></div>
        </div>
        <div class="box">
            <div class="btitle"><h2>{t c='notice.ARCHIVE'}</h2></div>
            <ul class="notice_categories">
                <li><a href="{$relative}/notices">{t c='global.all'}</a></li>
                {section name=i loop=$arhive}
                <li><a href="{$relative}/notices?t={$arhive[i]}">{$arhive[i]|date_format:"%B %Y"}</a></li>
                {/section}
            </ul>
            <div class="clear_left"></div>
        </div>
    </div>
    <div class="clear"></div>
</div>
