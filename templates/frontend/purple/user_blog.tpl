<div id="content">
    <div class="left span-300">
        {include file='user_info.tpl'}
    </div>
    <div class="right span-650">
        <div class="box">            
            <div class="btitle"><h2>{$username|upper} {t c='user.BLOG'}</h2></div>
            <div class="blinkp">
                <div class="blinkcl">&nbsp;{t c='global.showing'} <span>{$start_num}</span> {t c='global.to'} <span>{$end_num}</span> {t c='global.of'} <span>{$blogs_total}</span> {t c='blog.blogs'}.</div>
                {if isset($smarty.session.uid) && $smarty.session.uid == $user.UID}
                <div class="blinkcr"><a href="{$relative}/blog/add">{t c='blog.create_new'}</a></div>
                {/if}
                <div class="clear"></div>
            </div>
            {section name=i loop=$blogs}
            <div class="blog_header">
                <h5><a href="{$relative}/blog/{$blogs[i].BID}/{$blogs[i].title|clean}">{$blogs[i].title|escape:'html'}</a></h5>
                {insert name=time_range assign=addtime time=$blogs[i].addtime}
                <span class="smallest grey">{t c='blog.views'}: {$blogs[i].total_views} <strong>&middot;</strong> {t c='global.added'}: {$addtime}</span>
            </div>
            <div class="blog_content">
                {$blogs[i].content|nl2br}
            </div>
            <div class="blog_links_user">
                <div class="blog_links_l">
                    <a href="{$relative}/blog/{$blogs[i].BID}/{$blogs[i].title|clean}">{$blogs[i].total_comments} {t c='global.comments'}</a> <strong>&middot;</strong>
                    <a href="{$relative}/blog/{$blogs[i].BID}/{$blogs[i].title|clean}">{t c='blog.post_comment'}</a>
                </div>
                {if isset($smarty.session.uid) && $smarty.session.uid == $user.UID}
                <div class="blog_links_r">
                    <a href="{$relative}/blog/edit/{$blogs[i].BID}/{$blogs[i].title|clean}">{t c='global.edit'}</a> <strong>&middot;</strong>
                    <a href="{$relative}/blog/delete/{$blogs[i].BID}/{$blogs[i].title|clean}">{t c='global.delete'}</a>
                </div>
                {/if}
                <div class="clear"></div>
            </div>            
            {/section}
        </div>
    </div>
    <div class="clear"></div>
</div>
