<div id="content">
    <div class="left span-300">
        {include file='user_info.tpl'}
    </div>
    <div class="right span-650">
          <div class="box">              
              <div class="btitle">
                  <div class="btitlel"><h2>{$username|upper} {t c='user.FAVORITE_VIDEOS'}</h2></div>
                  <div class="btitler">
                      {if isset($smarty.session.uid) && $smarty.session.uid == $user.UID}
                      <a href="{$relative}/user/{$username}/favorite/videos?clear=yes" title="Clear Favorite Videos List" onclick="javascript:return confirm('{t c='user.fav_videos_all'}');">{t c='global.clear_all'}</a>
                      {/if}
                  </div>
                  <div class="clear"></div>
              </div>
              {if $favorites}
              <div class="blinkp">&nbsp;{t c='global.showing'} <strong>{$start_num}</strong> {t c='global.to'} <strong>{$end_num}</strong> {t c='global.of'} <strong>{$favorites_total}</strong> {t c='user.fav_videos'}.</div>
              <div id="remove_favorite_message" class="posting" style="display:none"></div>
              {section name=i loop=$favorites}
              <div id="favorite_video_{$favorites[i].VID}" class="video_box_small">
                  <a href="{$relative}/video/{$favorites[i].VID}/"><img src="{$relative}/media/videos/tmb/{$favorites[i].VID}/{$favorites[i].thumb}.jpg" title="{$favorites[i].title|escape:'html'}" alt="{$favorites[i].title|escape:'html'}" width="140" id="favoriterotate_{$favorites[i].VID}_{$favorites[i].thumbs}" /><br /><span class="font-12 font-bold">{$favorites[i].title|truncate:23:' ...':true|escape:'html'}</span><br />{if $favorites[i].type == 'private'}<img alt="" style="position: absolute; left: 0px; top: 0px; width: 140px; height: 105px;" src="{$relative_tpl}/images/{private type='video'}" />{/if}{if $favorites[i].hd==1}<img alt="" style="position: absolute; right: 6px; top: 8px; border:none; width: 21px; height: 14px;" src="{$relative_tpl}/images/hd.png"/>{/if}</a>
                  <div class="vbox_small_left">
                      {insert name=duration assign=duration duration=$favorites[i].duration}
                      {$duration}<br />
                  </div>
                  <div class="vbox_small_right">
                      {insert name=rating_small assign=video_rating rating=$favorites[i].rate}
                      {$video_rating}
                      <div class="clear_right"></div>
                      {$favorites[i].viewnumber} {if $favorites[i].viewnumber == '1'}{t c='global.view'}{else}{t c='global.views'}{/if}
                  </div>
                  <div class="clear"></div>
                  {if isset($smarty.session.uid) && $smarty.session.uid == $user.UID}
                  <div class="vbox_small_remove">
                      <a href="#remove_video" id="remove_video_from_favorite_{$favorites[i].VID}" class="remove">{t c='global.remove'}</a>
                  </div>
                  {/if}
              </div>                                                  
              {/section}
              <br />
              <div class="clear_left"></div>
              <div class="pagination"><ul>{$page_link}</ul></div><br />
              {else}
              <p>&nbsp;&nbsp;&nbsp;{t c='user.fav_videos_none'}</p>
              {/if}
          </div>
    </div>
    <div class="clear"></div>
</div>
