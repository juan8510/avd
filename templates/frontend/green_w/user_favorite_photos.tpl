<div id="content">
    <div class="left span-300">
        {include file='user_info.tpl'}
    </div>
    <div class="right span-650">
          <div class="box">              
              <div class="btitle">
                  <div class="btitlel"><h2>{$username|upper} {t c='user.FAVORITE_PHOTOS'}</h2></div>
                  <div class="btitler">
                      {if isset($smarty.session.uid) && $smarty.session.uid == $user.UID}
                      <a href="{$relative}/user/{$username}/favorite/videos?clear=yes" title="Clear Favorite Photos List" onclick="javascript:return confirm('{t c='user.fav_photos_all'}');">{t c='global.clear_all'}</a>
                      {/if}
                  </div>
                  <div class="clear"></div>
              </div>
              {if $favorites}
              <div class="blinkp">{t c='global.showing'} <strong>{$start_num}</strong> {t c='global.to'} <strong>{$end_num}</strong> {t c='global.of'} <strong>{$favorites_total}</strong> {t c='user.fav_photos'}.</div>
              <div id="remove_favorite_photo_message" class="posting" style="display: none;"></div>
              {section name=i loop=$favorites}
              {if $smarty.section.i.index == '0'}
              <div class="photo_row">
              {/if}
              <div id="favorite_photo_{$favorites[i].PID}" class="photo_box">
                  <a href="{$relative}/photo/{$favorites[i].PID}/"><img src="{$relative}/media/photos/tmb/{$favorites[i].PID}.jpg" alt="{$favorites[i].caption|escape:html}" width="150" id="album_photo_{$favorites[i].PID}" /><br />{if $favorites[i].type == 'private'}<img alt="" style="position: absolute; left: 0px; top: +13px; width: 120px; height: 140px;" src="{$relative_tpl}/images/{private type='album'}"/>{/if}</a>
                  {if isset($smarty.session.uid) && $smarty.session.uid == $user.UID}
                  <div class="photo_remove">
                      <a href="#remove_photo" id="remove_photo_from_favorite_{$favorites[i].PID}" class="remove">{t c='global.remove'}</a>
                  </div>
                  {/if}
              </div>
              {if $smarty.section.i.index gt '0' && $smarty.section.i.index mod 4 == '3' && $smarty.section.i.index != $smarty.section.i.total-1}
              <div class="clear_left"></div>
              </div>
              <div class="photo_row">
              {/if}
              {if $smarty.section.i.index == $smarty.section.i.total-1}
                  <div class="clear_left"></div>
              </div>
              {/if}
              {/section}
              <div class="pagination"><ul>{$page_link}</ul></div><br />
              {else}
                <br />&nbsp;&nbsp;&nbsp;{t c='user.fav_photos_none'}<br /><br />
              {/if}
          </div>
    </div>
    <div class="clear"></div>
</div>
