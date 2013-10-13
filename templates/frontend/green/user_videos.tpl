<div id="content">
    <div class="left span-300">
        {include file='user_info.tpl'}
    </div>
    <div class="right span-650">
          <div class="box">              
              <div class="btitle"><h2>{$username|upper} {$type|upper} {t c='user.VIDEOS'}</h2></div>
			  {if $videos}
              <div class="blink">
                <div class="blinkl">
                    &nbsp;{t c='global.showing'} <strong>{$start_num}</strong> {t c='global.to'} <strong>{$end_num}</strong> {t c='global.of'} <strong>{$videos_total}</strong> {t c='video.videos'}.
                </div>
                <div class="blinkr">
                {if isset($smarty.session.uid) && $smarty.session.uid == $user.UID}
                    <a href="{$relative}/upload">{t c='videos.upload'}</a>
                {/if}
                </div>
                <div class="clear"></div>
              </div>
              {section name=i loop=$videos}
              <div class="video_box_small">
                  <a href="{$relative}/video/{$videos[i].VID}/{$videos[i].title|clean}"><img src="{$relative}/media/videos/tmb/{$videos[i].VID}/{$videos[i].thumb}.jpg" title="{$videos[i].title|escape:'html'}" alt="{$videos[i].title|escape:'html'}" width="140" id="favoriterotate_{$videos[i].VID}_{$videos[i].thumbs}" /><br /><span class="font-12 font-bold">{$videos[i].title|truncate:23:' ...':true|escape:'html'}</span><br />{if $videos[i].type == 'private'}<img alt="" style="position: absolute; left: 0px; top: 0px; width: 140px; height: 105px;" src="{$relative_tpl}/images/{private type='video'}" />{/if}{if $videos[i].hd==1}<img alt="" style="position: absolute; right: 6px; top: 8px; border:none; width: 21px; height: 14px;" src="{$relative_tpl}/images/hd.png"/>{/if}</a>
                  <div class="vbox_small_left">
                      {insert name=duration assign=duration duration=$videos[i].duration}
                      {$duration}<br />
                  </div>
                  <div class="vbox_small_right">
                      {insert name=rating_small assign=video_rating rating=$videos[i].rate}
                      {$video_rating}
                      <div class="clear_right"></div>
                      {$videos[i].viewnumber} {if $videos[i].viewnumber == '1'}{t c='global.view'}{else}{t c='global.views'}{/if}                                                                        
                  </div>
				  <div class="clear"></div>
				  {if $edit_videos == '1' && isset($smarty.session.uid) && $smarty.session.uid == $user.UID}
              	  <div class="vbox_small_remove">
                	  <a href="{$relative}/edit/{$videos[i].VID}" class="remove">{t c='global.edit'}</a>
              	  </div>
              	  {/if}
              </div>                                                  
              {/section}
              <br />
              <div class="clear_left"></div>
              <div class="pagination"><ul>{$page_link}</ul></div><br />
			  {else}
              <p>&nbsp;&nbsp;&nbsp;{t c='user.videos_none' s=$type}.</p>
			  {/if}
          </div>
    </div>
    <div class="clear"></div>
</div>
