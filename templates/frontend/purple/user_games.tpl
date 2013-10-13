<div id="content">
    <div class="left span-300">
        {include file='user_info.tpl'}
    </div>
    <div class="right span-650">
          <div class="box">              
              <div class="btitle"><h2>{$username|upper} {$type|upper} {t c='user.GAMES'}</h2></div>
              {if $games}
              <div class="blinkp">{t c='global.showing'} <strong>{$start_num}</strong> {t c='global.to'} <strong>{$end_num}</strong> {t c='global.of'} <strong>{$games_total}</strong> {t c='game.games'}.</div>
              {section name=i loop=$games}
              <div class="video_box_small">
                  <a href="{$relative}/game/{$games[i].GID}/{$games[i].title|clean}"><span class="font-10 font-bold">{$games[i].title|truncate:21:' ...':true|escape:'html'}</span><br /><img src="{$relative}/media/games/tmb/{$games[i].GID}.jpg" title="{$games[i].title|escape:'html'}" alt="{$games[i].title|escape:'html'}" width="140" /><br />{if $games[i].type == 'private'}<img alt="" style="position: absolute; left: 0px; top: +15px; width: 140px; height: 105px;" src="{$relative_tpl}/images/{private type='game'}"/>{/if}</a>
                  <div class="vbox_small_left">
                      {$games[i].total_plays} {if $games[i].total_plays == '1'}{t c='global.play'}{else}{t c='global.plays'}{/if}
                  </div>
                  <div class="vbox_small_right">
                      {insert name=rating_small assign=game_rating rating=$games[i].rate}
                      {$game_rating}
                      <div class="clear_right"></div>
                  </div>
                  <div class="clear"></div>
              </div>                                                  
              {/section}
              <br />
              <div class="clear_left"></div>
              <div class="pagination"><ul>{$page_link}</ul></div><br />
              {else}
              <br />{t c='user.games_none' s=$type|upper}
              {/if}
          </div>
    </div>
    <div class="clear"></div>
</div>
