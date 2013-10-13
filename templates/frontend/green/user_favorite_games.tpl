<div id="content">
    <div class="left span-300">
        {include file='user_info.tpl'}
    </div>
    <div class="right span-650">
          <div class="box">              
              <div class="btitle">
                  <div class="btitlel"><h2>{$username|upper} {t c='user.FAVORITE_GAMES'}</h2></div>
                  <div class="btitler">
                      {if isset($smarty.session.uid) && $smarty.session.uid == $user.UID}
                      <a href="{$relative}/user/{$username}/favorite/games?clear=yes" title="Clear Favorite Games List" onclick="javascript:return confirm('{t c='user.fav_games_all'}');">{t c='global.clear_all'}</a>
                      {/if}
                  </div>
                  <div class="clear"></div>
              </div>
              {if $favorites}
              <div class="blinkp">{t c='global.showing'} <strong>{$start_num}</strong> {t c='global.to'} <strong>{$end_num}</strong> {t c='global.of'} <strong>{$favorites_total}</strong> {t c='user.fav_games'}.</div>
              <div id="remove_favorite_game_message" class="posting" style="display:none"></div>
              {section name=i loop=$favorites}
              <div id="favorite_game_{$favorites[i].GID}" class="video_box_small">
                  <a href="{$relative}/game/{$favorites[i].GID}/"><span class="font-12 font-bold">{$favorites[i].title|truncate:21:' ...':true|escape:'html'}</span><br /><img src="{$relative}/media/games/tmb/{$favorites[i].GID}.jpg" title="{$favorites[i].title|escape:'html'}" alt="{$favorites[i].title|escape:'html'}" width="140" height="105" /><br />{if $favorites[i].type == 'private'}<img alt="" style="position: absolute; left: 0px; top: +14px; width: 140px; height: 105px;" src="{$relative_tpl}/images/{private type='game'}" />{/if}</a>
                  <div class="vbox_small_left">
                      {$favorites[i].total_plays} {if $games[i].total_plays == '1'}{t c='global.play'}{else}{t c='global.plays'}{/if}
                  </div>
                  <div class="vbox_small_right">
                      {insert name=rating_small assign=game_rating rating=$favorites[i].rate}
                      {$game_rating}
                      <div class="clear_right"></div>
                  </div>
                  <div class="clear"></div>
                  {if isset($smarty.session.uid) && $smarty.session.uid == $user.UID}
                  <div class="vbox_small_remove">
                      <a href="#remove_video" id="remove_game_from_favorite_{$favorites[i].GID}" class="remove">{t c='global.remove'}</a>
                  </div>
                  {/if}
              </div>                                                  
              {/section}
              <br />
              <div class="clear_left"></div>
              <div class="pagination"><ul>{$page_link}</ul></div><br />
              {else}
              <br />&nbsp;&nbsp;&nbsp;{t c='user.fav_games_none'}<br /><br />
              {/if}
          </div>
    </div>
    <div class="clear"></div>
</div>
