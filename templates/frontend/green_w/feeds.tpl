<div id="content">
    <div class="left span-200">
        <div class="box">            
            <div class="btitle"><h2>{t c='global.SUBSCRIPTIONS'}:</h2></div>
            <ul class="submenu_links">
                <li>{if $username == 'all'}{t c='global.all'}{else}<a href="{$relative}/feeds">{t c='global.all'}</a>{/if}</li>
                {section name=i loop=$subscriptions}
                <li>
                {if $username == $subscriptions[i].username}
                {$subscriptions[i].username|escape:'html'}
                {else}
                <a href="{url base='feeds' strip='u' value=$subscriptions[i].username}">{$subscriptions[i].username|escape:'html'}</a></li>
                {/if}
                {/section}
            </ul>
            <div class="clear_left"></div>
        </div>
    </div>    
    <div class="right span-750">
        <div class="box">
            
            <div class="btitle"><h2>{t c='feeds.activity'}</h2></div>
            <div class="blinkp">
                 {if $table == 'all'}{t c='global.all'}{else}<a href="{url base='feeds' strip='t' value='all'}">{t c='global.all'}</a>{/if} <strong>&middot;</strong>
                 {if $table == 'albums'}{t c='global.albums'}{else}<a href="{url base='feeds' strip='t' value='albums'}">{t c='global.albums'}</a>{/if} <strong>&middot;</strong>
                 {if $table == 'blogs'}{t c='menu.blogs'}{else}<a href="{url base='feeds' strip='t' value='blogs'}">{t c='menu.blogs'}</a>{/if} <strong>&middot;</strong>
                 {if $table == 'games'}{t c='global.games'}{else}<a href="{url base='feeds' strip='t' value='games'}">{t c='global.games'}</a>{/if} <strong>&middot;</strong>
                 {if $table == 'videos'}{t c='global.videos'}{else}<a href="{url base='feeds' strip='t' value='videos'}">{t c='global.videos'}</a>{/if}
            </div>
            {if $feeds}                        
            {section name=i loop=$feeds}
            <div class="feed_row">
                {if $feeds[i].type == 'video'}
                <img src="{$relative_tpl}/images/film.png" />
                {elseif $feeds[i].type == 'album'}
                <img src="{$relative_tpl}/images/images.png" />
                {elseif $feeds[i].type == 'photo'}
                <img src="{$relative_tpl}/images/image.png" />
                {elseif $feeds[i].type == 'game'}
                <img src="{$relative_tpl}/images/joystick.png" />
                {elseif $feeds[i].type == 'blog'}
                <img src="{$relative_tpl}/images/page.png" />
                {/if}
                &nbsp;
                [{$feeds[i].time|date_format:"%m/%d/%y"}] &nbsp;<a href="{$relative}/user/{$feeds[i].data.username}">{$feeds[i].data.username}</a>&nbsp;
                {if $feeds[i].type == 'video'}
                {t c='feeds.has_uploaded'} &nbsp;<a href="{$relative}/video/{$feeds[i].data.VID}/{$feeds[i].data.title|clean}">{t c='feeds.new_video'}</a>.
                {elseif $feeds[i].type == 'album'}
                {t c='feeds.has_created'} &nbsp;<a href="{$relative}/album/{$feeds[i].data.AID}/{$feeds[i].data.name|clean}">{t c='feeds.new_album'}</a>.
                {elseif $feeds[i].type == 'game'}
                {t c='feeds.has_uploaded'} &nbsp;<a href="{$relative}/game/{$feeds[i].data.GID}/{$feeds[i].data.title|clean}">{t c='feeds.new_game'}</a>.
                {elseif $feeds[i].type == 'blog'}
                {t c='feeds.has_created'} &nbsp;<a href="{$relative}/blog/{$feeds[i].data.BID}/{$feeds[i].data.title|clean}">{t c='feeds.new_blog'}</a>.
                {/if}            
            </div>
            {/section}
            <div class="pagination"><ul>{$page_link}</ul></div><br />
            {else}
            <br /><div class="no_comments">{t c='feeds.none'}</div><br />
            {/if}
        </div>
    </div>
    <div class="clear"></div>
</div>
