<div id="content">
    <div class="left span-300">
        {include file='user_info.tpl'}        
        {if $friends}
        <div class="box">            
            <div class="btitle"><h2>{$username|upper} {t c='user.FRIENDS'}</h2></div>
            {section name=i loop=$friends}
            <div class="user-box">
                <a href="{$relative}/user/{$friends[i].username}"><img src="{$relative}/media/users/{if $friends[i].photo == ''}nopic-{$friends[i].gender}.gif{else}{$friends[i].photo}{/if}" alt="{$friends[i].username}'s avatar" /><br /><span class="font-12">{$friends[i].username|escape:'html'}</span></a><br />
            </div>                                                    
            {/section}
            <div class="clear_left"></div>
            <div class="blink">
                <a href="{$relative}/user/{$user.username}/friends">{t c='global.view_all'}</a>
            </div>                                                   
        </div>
        {/if}        
        {if $subscribers}
        <div class="box">
            <div class="btitle"><h2>{$username|upper} {t c='user.SUBSCRIBERS'}</h2></div>            
            {section name=i loop=$subscribers}
            <div class="user-box">
                <a href="{$relative}/user/{$subscribers[i].username}"><img src="{$relative}/media/users/{if $subscribers[i].photo == ''}nopic-{$subscribers[i].gender}.gif{else}{$subscribers[i].photo}{/if}" alt="{$subscribers[i].username}'s avatar" /><br /><span class="font-12">{$subscribers[i].username|escape:'html'}</span></a><br />
            </div>                                                    
            {/section}
            <div class="clear_left"></div>
            <div class="blink">
                <a href="{$relative}/user/{$user.username}/subscribers">{t c='global.view_all'}</a>
            </div>                                                   
        </div>
        {/if}        
        {if $subscriptions}
        <div class="box">
            <div class="btitle"><h2>{$username|upper} {t c='user.SUBSCRIPTIONS'}</h2></div>
            {section name=i loop=$subscriptions}
            <div class="user-box">
                <a href="{$relative}/user/{$subscriptions[i].username}"><img src="{$relative}/media/users/{if $subscriptions[i].photo == ''}nopic-{$subscriptions[i].gender}.gif{else}{$subscriptions[i].photo}{/if}" alt="{$subscriptions[i].username}'s avatar" /><br /><span class="font-12">{$subscriptions[i].username|escape:'html'}</span></a><br />
            </div>                                                    
            {/section}
            <div class="clear_left"></div>
            <div class="blink">
                <a href="{$relative}/user/{$user.username}/subscriptions">{t c='global.view_all'}</a>
            </div>                                                   
        </div>
        {/if}        
    </div>
    <div class="right span-650">
        {if $blog && $blog_module == '1'}
        <div class="box">
            <div class="btitle"><h2>{t c='user.BLOG'}</h2></div>
            <div class="blog_header">
                <h5><a href="{$relative}/blog/{$blog.BID}/{$blog.title|clean}">{$blog.title|escape:'html'}</a></h5>
                {insert name=time_range assign=addtime time=$blog.addtime}
                {t c='blog.views'}: {$blog.total_views} <strong>&middot;</strong> {t c='global.added'}: {$addtime}
            </div>
            <div class="blog_content">
                {$blog.content|nl2br}
            </div>
            <div class="blog_links_u">
                <div class="blog_links_l">
                    <a href="{$relative}/blog/{$blog.BID}/{$blog.title|clean}">{$blog.total_comments} {t c='global.comments'}</a> <strong>&middot;</strong>
                    <a href="{$relative}/blog/{$blog.BID}/{$blog.title|clean}">{t c='blog.post_comment'}</a>
                </div>
                <div class="blog_links_r">
                    <a href="{$relative}/user/{$username}/blog">{t c='global.see_all'}</a>
                    {if isset($smarty.session.uid) && $smarty.session.uid == $user.UID}
                    <strong>&middot;</strong>
                    <a href="{$relative}/blog/edit/{$blog.BID}/{$blog.title|clean}">{t c='global.edit'}</a> <strong>&middot;</strong>
                    <a href="{$relative}/blog/delete/{$blog.BID}">{t c='global.delete'}</a>
                    {/if}
                </div>
                <div class="clear"></div>
            </div>
        </div>
        {/if}
        {if $albums && $photo_module == '1'}
        <div class="box">            
            <div class="btitle">
                <div class="btitlel"><h2>{t c='user.PHOTO_ALBUMS'}</h2></div>
                <div class="btitler"><a href="{$relative}/user/{$user.username}/albums">{t c='global.view_all'}</a></div>
                <div class="clear"></div>
            </div>
            {section name=i loop=$albums}
            <div class="album_box">
                <a href="{$relative}/album/{$albums[i].AID}/{$albums[i].name|clean}"><img src="{$relative}/media/albums/{$albums[i].AID}.jpg" title="{$albums[i].name|escape:'html'}" alt="{$albums[i].name|escape:'html'}" width="120" /><br /><span class="font-11 font-bold">{$albums[i].name|truncate:21:' ...':true|escape:'html'}</span><br />{if $albums[i].type == 'private'}<img alt="" style="position: absolute; left: 0px; top: 0px; width: 120px; height: 140px;" src="{$relative_tpl}/images/{private type='album'}" />{/if}</a>
                <div class="album_info">
                    <div class="album_left">
                        {$albums[i].total_photos} {if $albums[i].total_photos > 1}{t c='album.photos'}{else}{t c='album.photo'}{/if}<br />
                    </div>
                    <div class="album_right">
                        {insert name=rating_small assign=album_rating rating=$albums[i].rate}
                        {$album_rating}
                    </div>
                    <div class="clear"></div>
                    {insert name=time_range assign=addtime time=$albums[i].addtime}
                    {t c='global.added'}: {$addtime}
                </div>
            </div>                                                   
            {/section}
            <div class="clear_left"></div>
        </div>
        {/if}
        {if $playlist}
        <div class="box">
            <div class="btitle">
                <div class="btitlel"><h2>{t c='user.PLAYLIST'}</h2></div>
                <div class="btitler"><a href="{$relative}/user/{$user.username}/playlist">{t c='global.view_all'}</a></div>
                <div class="clear"></div>
            </div>
            <div id="remove_playlist_message" class="posting" style="display:none"></div>
            {section name=i loop=$playlist}
            <div id="playlist_video_{$playlist[i].VID}" class="video_box_small">
                <a href="{$relative}/video/{$playlist[i].VID}/{$playlist[i].title|clean}"><img src="{$relative}/media/videos/tmb/{$playlist[i].VID}/{$playlist[i].thumb}.jpg" alt="{$playlist[i].title|escape:'html'}" width="140" id="playlistrotate_{$playlist[i].VID}_{$playerlist[i].thumbs}" /><br /><span class="font-12 font-bold">{$playlist[i].title|truncate:21:' ...':true|escape:'html'}</span><br />{if $playlist[i].type == 'private'}<img alt="" style="position: absolute; left: 0px; top: 0px; width: 140px; height: 105px;" src="{$relative_tpl}/images/{private type='video'}" />{/if}</a>
                <div class="vbox_small_left">
                    {insert name=duration assign=duration duration=$playlist[i].duration}
                    {$duration}
                </div>
                <div class="vbox_small_right">
                    {insert name=rating_small assign=video_rating rating=$playlist[i].rate}
                    {$video_rating}
                    <div class="clear_right"></div>
                    {$playlist[i].viewnumber} {if $playlist[i].viewnumber == '1'}{t c='global.view'}{else}{t c='global.views'}{/if}
                </div>
                <div class="clear"></div>
                {if isset($smarty.session.uid) && $smarty.session.uid == $user.UID}
                <div class="vbox_small_remove">
                    <a href="#remove_video" id="remove_video_from_playlist_{$playlist[i].VID}" class="remove">{t c='global.remove'}</a>
                </div>
                {/if}
            </div>
            {/section}
            <div class="clear_left"></div>
        </div>
        {/if}
        {if $videos_public}
        <div class="box">            
            <div class="btitle">
                <div class="btitlel"><h2>{t c='user.PUBLIC_VIDEOS'}</h2></div>
                <div class="btitler"><a href="{$relative}/user/{$user.username}/videos/public">{t c='global.view_all'}</a></div>
                <div class="clear"></div>
            </div>
            {section name=i loop=$videos_public}
            <div class="video_box_small">
                <a href="{$relative}/video/{$videos_public[i].VID}/{$videos_public[i].title|clean}"><img src="{$relative}/media/videos/tmb/{$videos_public[i].VID}/{$videos_public[i].thumb}.jpg" alt="{$videos_public[i].title|escape:'html'}" width="140" id="publicrotate_{$videos_public[i].VID}_{$videos_public[i].thumbs}" /><br /><span class="font-12 font-bold">{$videos_public[i].title|truncate:23:' ...':true|escape:'html'}</span><br />{if $videos_public[i].hd==1}<img alt="" style="position: absolute; right: 6px; top: 8px; border:none; width: 21px; height: 14px;" src="{$relative_tpl}/images/hd.png"/>{/if}</a>
                <div class="vbox_small_left">
                    {insert name=duration assign=duration duration=$videos_public[i].duration}
                    {$duration}
                </div>
                <div class="vbox_small_right">
                    {insert name=rating_small assign=video_rating rating=$videos_public[i].rate}
                    {$video_rating}
                    <div class="clear_right"></div>
                    {$videos_public[i].viewnumber} {if $videos_public[i].viewnumber == '1'}{t c='global.view'}{else}{t c='global.views'}{/if}
                </div>
                <div class="clear"></div>
                {if $edit_videos == '1' && isset($smarty.session.uid) && $smarty.session.uid == $user.UID}
                <div class="vbox_small_remove">
                    <a href="{$relative}/edit/{$videos_public[i].VID}" class="remove">{t c='global.edit'}</a>
                </div>
                {/if}
            </div>
            {/section}
            <div class="clear_left"></div>
        </div>
        {/if}
        {if $videos_private}
        <div class="box">            
            <div class="btitle">
                <div class="btitlel"><h2>{t c='user.PRIVATE VIDEOS'}</h2></div>
                <div class="btitler"><a href="{$relative}/user/{$user.username}/videos/private">{t c='global.view_all'}</a></div>
                <div class="clear"></div>
            </div>
            {section name=i loop=$videos_private}
            <div class="video_box_small">
                <a href="{$relative}/video/{$videos_private[i].VID}/{$videos_private[i].title|clean}"><img src="{$relative}/media/videos/tmb/{$videos_private[i].VID}/{$videos_private[i].thumb}.jpg" alt="{$videos_private[i].title|escape:'html'}" width="140" id="privaterotate_{$videos_private[i].VID}_{$videos_private[i].thumbs}" /><br /><span class="font-12 font-bold">{$videos_private[i].title|truncate:23:' ...':true|escape:'html'}</span><br /><img alt="" style="position: absolute; left: 0px; top: 0px; width: 140px; height: 105px;" src="{$relative_tpl}/images/{private type='video'}" />{if $videos_private[i].hd==1}<img alt="" style="position: absolute; right: 6px; top: 8px; border:none; width: 21px; height: 14px;" src="{$relative_tpl}/images/hd.png"/>{/if}</a>
                <div class="vbox_small_left">
                    {insert name=duration assign=duration duration=$videos_private[i].duration}
                    {$duration}
                </div>
                <div class="vbox_small_right">
                    {insert name=rating_small assign=video_rating rating=$videos_private[i].rate}
                    {$video_rating}
                    <div class="clear_right"></div>
                    {$videos_private[i].viewnumber} {if $videos_private[i].viewnumber == '1'}{t c='global.view'}{else}{t c='global.views'}{/if}
                </div>
				<div class="clear"></div>
                {if $edit_videos == '1' && isset($smarty.session.uid) && $smarty.session.uid == $user.UID}
                <div class="vbox_small_remove">
                    <a href="{$relative}/edit/{$videos_private[i].VID}" class="remove">{t c='global.edit'}</a>
                </div>
                {/if}
            </div>
            {/section}
            <div class="clear_left"></div>
        </div>
        {/if}
        {if $favorites}
        <div class="box">            
            <div class="btitle">
                <div class="btitlel"><h2>{t c='user.FAVORITE_VIDEOS'}</h2></div>
                <div class="btitler"><a href="{$relative}/user/{$user.username}/favorite/videos">{t c='global.view_all'}.</a></div>
                <div class="clear"></div>
            </div>
            <div id="remove_favorite_message" class="posting" style="display:none"></div>
            {section name=i loop=$favorites}
            <div id="favorite_video_{$favorites[i].VID}" class="video_box_small">
                <a href="{$relative}/video/{$favorites[i].VID}/{$favorites[i].title|clean}"><img src="{$relative}/media/videos/tmb/{$favorites[i].VID}/{$favorites[i].thumb}.jpg" alt="{$favorites[i].title|escape:'html'}" width="140" id="favoriterotate_{$favorites[i].VID}_{$favorites[i].thumbs}" /><br /><span class="font-12 font-bold">{$favorites[i].title|truncate:23:' ...':true|escape:'html'}</span><br />{if $favorites[i].type == 'private'}<img alt="" style="position: absolute; left: 0px; top: 0px; width: 140px; height: 105px;" src="{$relative_tpl}/images/{private type='video'}" />{/if}{if $favorites[i].hd==1}<img alt="" style="position: absolute; right: 6px; top: 8px; border:none; width: 21px; height: 14px;" src="{$relative_tpl}/images/hd.png"/>{/if}</a>
                <div class="vbox_small_left">
                    {insert name=duration assign=duration duration=$favorites[i].duration}
                    {$duration}
                </div>
                <div class="vbox_small_right">
                    {insert name=rating_small assign=video_rating rating=$favorites[i].rate}
                    {$video_rating}
                    <div class="clear_right"></div>
                    {$favorites[i].viewnumber} {if $favorites[i].viewnumber == '1'}{t c='global.view'}{else}{t c='global.views'}{/if}
                </div>
                <div class="clear"></div>
                {if $edit_videos == '1' && isset($smarty.session.uid) && $smarty.session.uid == $user.UID}
                <div class="vbox_small_remove">
                    <a href="#remove_video" id="remove_video_from_favorite_{$favorites[i].VID}" class="remove">{t c='global.remove'}</a>
                </div>
                {/if}
            </div>
            {/section}
            <div class="clear_left"></div>
        </div>
        {/if}
        {if $photos && $photo_module == '1'}
        <div class="box">            
            <div class="btitle">
                <div class="btitlel"><h2>{t c='user.FAVORITE_PHOTOS'}</h2></div>
                <div class="btitler"><a href="{$relative}/user/{$user.username}/favorite/photos">{t c='global.view_all'}</a></div>
                <div class="clear"></div>
            </div>
            <div id="remove_favorite_photo_message" class="posting" style="display: none;"></div>
            <div class="photo_row">
            {section name=i loop=$photos}
            <div id="favorite_photo_{$photos[i].PID}" class="photo_box">
                <a href="{$relative}/photo/{$photos[i].PID}/"><img src="{$relative}/media/photos/tmb/{$photos[i].PID}.jpg" alt="{$photos[i].caption|escape:html}" width="150" id="album_photo_{$photos[i].PID}" />{if $photos[i].type == 'private'}<img alt="" style="position: absolute; left: 0px; top: +13px; width: 120px; height: 140px;" src="{$relative_tpl}/images/{private type='album'}" />{/if}</a>
                {if isset($smarty.session.uid) && $smarty.session.uid == $user.UID}
                <div class="photo_remove">
                    <a href="#remove_photo" id="remove_photo_from_favorite_{$photos[i].PID}" class="remove">{t c='global.remove'}</a>
                </div>
                {/if}                
            </div>
            {/section}
            <div class="clear_left"></div>
            </div>
        </div>
        {/if}
        {if $games && $game_module == '1'}
        <div class="box">
            <div class="btitle">
                <div class="btitlel"><h2>{t c='user.FAVORITE_GAMES'}</h2></div>
                <div class="btitler"><a href="{$relative}/user/{$user.username}/favorite/games">{t c='global.view_all'}</a></div>
                <div class="clear"></div>
            </div>
            <div id="remove_favorite_game_message" class="posting" style="display:none"></div>
            {section name=i loop=$games}
            <div id="favorite_game_{$games[i].GID}" class="video_box_small">
                <a href="{$relative}/game/{$games[i].GID}/{$games[i].title|clean}"><span class="font-12 font-bold">{$games[i].title|truncate:21:' ...':true|escape:'html'}</span><br /><img src="{$relative}/media/games/tmb/{$games[i].GID}.jpg" alt="{$games[i].title|escape:'html'}" width="140" /><br />{if $games[i].type == 'private'}<img alt="" style="position: absolute; left: 0px; top: +15px; width: 160px; height: 120px;" src="{$relative_tpl}/images/{private type='game'}"/>{/if}</a>
                <div class="vbox_small_left">
                    {$games[i].total_plays} {if $games[i].total_plays == '1'}{t c='global.play'}{else}{t c='global.plays'}{/if}
                </div>
                <div class="vbox_small_right">
                    {insert name=rating_small assign=game_rating rating=$games[i].rate}
                    {$game_rating}
                    <div class="clear_right"></div>
                </div>
                <div class="clear"></div>
                {if isset($smarty.session.uid) && $smarty.session.uid == $user.UID}
                <div class="vbox_small_remove">
                    <a href="#remove_game" id="remove_game_from_favorite_{$games[i].GID}" class="remove">{t c='global.remove'}</a>
                </div>
                {/if}
            </div>
            {/section}
            <div class="clear_left"></div>            
        </div>
        {/if}
        {if $show_wall}
		{if $walls || ( isset($smarty.session.uid) && $wall_comments == '1' )}
        <div class="box">            
            <div class="btitle"><h2>{t c='user.WALL'}</h2></div>
            {if isset($smarty.session.uid) && $user.UID && $wall_comments == '1'}
            <div id="wall">
                <form name="wall_form" id="wall_form" method="post" action="#post_comment">
                <div class="separator"><div id="media_message" style="display: none;"></div></div>
                <div class="separator"><div id="media_content" style="display: none;"></div></div>
                <textarea name="wall_comment" id="wall_comment" cols="75" rows="5" class="user_txtarea">{$comment}</textarea>
                <div id="post_message" class="post_message" style="display: none;">{t c='global.comment_empty'}</div>
                <div class="center">
                    <div class="left"><span id="chars_left">1000</span> {t c='global.chars_left'}</div>
                    <div class="middle">
                        <input name="submit_wall" type="submit" value=" {t c='global.post'} " id="post_wall_comment_{$user.UID}" class="button">
                    </div>
                    <div class="right">
                        <a href="#attach_photo" id="attach_photo">{t c='global.attach_photo'}</a>
                        <a href="#attach_video" id="attach_video">{t c='global.attach_video'}</a>
                    </div>
                    <div class="clear_left"></div>
                </div>
                </form>
                <div id="wall_response" class="wall_posting" style="display: none;">Posting...</div>
            </div>
            <br />
            {/if}
            <div id="wall_comments_{$user.UID}">
            {if $walls}
            <div class="blinkp">
                {t c='global.showing'} <strong>{$start_num}</strong> {t c='global.to'} <strong>{$end_num}</strong> {t c='global.of'} <strong>{$walls_total}</strong> {t c='global.comments'}.
            </div>
            <div class="pagination"><ul>{$page_link}</ul></div>
            <div id="comments_delimiter" style="display:none;"></div>
            {section name=i loop=$walls}
            <div id="wall_comment_{$walls[i].wall_id}">
            <div id="delete_response_{$walls[i].wall_id}" class="response" style="display: none;"></div>
            <div class="comment">
                <div class="comment_left">
                    <a href="{$relative}/user/{$walls[i].username}">
                        <img src="{$relative}/media/users/{if $walls[i].photo != ''}{$walls[i].photo}{else}nopic-{$walls[i].gender}.gif{/if}" width="60" title="{$walls[i].username}'s avatar" alt="{$walls[i].username}'s avatar" />
                    </a>
                </div>
                <div class="comment_right">
                    <div class="comment_info">
                        {insert name=time_range assign=addtime time=$walls[i].addtime}
                        <a href="{$relative}/user/{$walls[i].username}">{$walls[i].username}</a>&nbsp;<strong>-</strong>&nbsp;<span class="font-10">{$addtime}</span>
                    </div>
                    <p class="comment_body">{$walls[i].message|nl2br}</p>
                    {if isset($smarty.session.uid)}
                    <div class="comment_actions">
                        {if $smarty.session.uid == $walls[i].UID}
                        <a href="#delete_comment" id="delete_comment_wall_{$walls[i].wall_id}_{$user.UID}">{t c='global.delete'}</a> <strong>&middot;</strong>
                        {/if}
                        <span id="reported_spam_{$walls[i].wall_id}_{$user.UID}"><a href="#report_spam" id="report_spam_wall_{$walls[i].wall_id}_{$user.UID}">{t c='global.report_spam'}</a></span>
                    </div>
                    {/if}                                                                                                                                                                                                    
                </div>
                <div class="clear"></div>
            </div>
            </div>
            {/section}
            {else}
            <div id="comments_delimiter" style="display:none;"></div>
            {/if}
            <br />
            </div>
        </div>
        </div>
		{/if}
        {/if}
    </div>
    <div class="clear"></div>
</div>
