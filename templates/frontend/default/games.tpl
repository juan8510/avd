<div id="content">
    <div class="left span-755">
        <div class="box">    
            <div class="bmenu">
                <div class="bmenul"><h2>{$title|upper} {t c='game.GAMES'}</h2></div>
                <div class="bmenur">{literal}
                    <script type="text/javascript">
                        $(document).ready(function(){
                            $("select[id='order_type'], select[id='order_category'], select[id='order_timeline']").change(function() {
                                $('#orderGames').submit();
                            });
                        });
                    </script>
                    {/literal}
                    <div id="order_form">
                    <form name="orderGames" id="orderGames" method="get" action="{$relative}/games">
                        <input name="o" type="hidden" value="{$order}" />
                        <span class="mleft">{t c='global.type'}: </span>
                        <select name="type" id="order_type">
                            <option value=""{if $type == ''} selected="yes"{/if}>{t c='global.all'}</option>
                            <option value="public"{if $type == 'public'} selected="yes"{/if}>{t c='global.public'}</option>
                            <option value="private"{if $type == 'private'} selected="yes"{/if}>{t c='global.private'}</option>
                        </select>
                        <span class="mleft">{t c='global.category'}:</span>
                        <select name="c" id="order_category">
                            <option value="0"{if $category == '0'} selected="yes"{/if}>{t c='global.all'}</option>
                            {section name=i loop=$categories}
                            <option value="{$categories[i].category_id}"{if $category == $categories[i].category_id} selected="yes"{/if}>{$categories[i].category_name|escape:'html'}</option>
                            {/section}
                        </select>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
            <div class="bsubmenu">
                <div class="bsubmenul">
                    {if $order == 'bp'}{t c='global.being_played'}{else}<a href="{url base='games' strip='o' value='bp'}">{t c='global.being_played'}</a>{/if} <strong>&middot;</strong>
                    {if $order == 'mr'}{t c='global.most_recent'}{else}<a href="{url base='games' strip='o' value='mr'}">{t c='global.most_recent'}</a>{/if} <strong>&middot;</strong>
                    {if $order == 'mp'}{t c='global.most_played'}{else}<a href="{url base='games' strip='o' value='mp'}">{t c='global.most_played'}</a>{/if} <strong>&middot;</strong>
                    {if $order == 'tr'}{t c='global.top_rated'}{else}<a href="{url base='games' strip='o' value='tr'}">{t c='global.top_rated'}</a>{/if} <strong>&middot;</strong>
                    {if $order == 'md'}{t c='global.most_commented'}{else}<a href="{url base='games' strip='o' value='md'}">{t c='global.most_commented'}</a>{/if} <strong>&middot;</strong>
                    {if $order == 'tf'}{t c='global.top_favorites'}{else}<a href="{url base='games' strip='o' value='tf'}">{t c='global.top_favorites'}</a>{/if}                                                                                                                    
                </div>
                <div class="bsubmenur">
                    <div id="timeline_form">
                        <span>{t c='global.timeline'}: </span>
                        <select name="t" id="order_timeline">
                            <option value="t"{if $timeframe == 't'} selected="yes"{/if}>{t c='global.today'}</option>
                            <option value="w"{if $timeframe == 'w'} selected="yes"{/if}>{t c='global.this_week'}</option>
                            <option value="m"{if $timeframe == 'm'} selected="yes"{/if}>{t c='global.this_month'}</option>
                            <option value="a"{if $timeframe == 'a'} selected="yes"{/if}>{t c='global.all'}</option>
                        </select>
                    </div>
                    </form>
                </div>
                <div class="clear"></div>
            </div>
            <div class="blinkp">
                <div class="blinkcl">{t c='global.showing'} <span>{$start_num}</span> {t c='global.to'} <span>{$end_num}</span> {t c='global.of'} <span>{$games_total}</span> {t c='game.games'}.</div>
                <div class="blinkcr"><a href="{$relative}/upload/game">{t c='game.upload_game'}</a></div>
                <div class="clear"></div>
            </div>
            {if $games}
            {section name=i loop=$games}
            <div class="video_box">
                <a href="{$relative}/game/{$games[i].GID}/{$games[i].title|clean}"><img src="{$relative}/media/games/tmb/{$games[i].GID}.jpg" title="{$games[i].title|escape:'html'}" alt="{$games[i].title|escape:'html'}" width="160" height="120" />{if $games[i].type == 'private'}<img alt="" style="position: absolute; left: 0px; top: +15px; width: 160px; height: 120px;" src="{$relative_tpl}/images/{private type='game'}"/>{/if}<br /><span class="font-13 font-bold">{$games[i].title|truncate:20:' ...':true|escape:'html'}</span><br /></a>
                <div class="box_left">
                    {insert name=time_range assign=addtime time=$games[i].addtime}
                    {$addtime}                                                                                                
                </div>
                <div class="box_right">
                    {insert name=rating_small assign=video_rating rating=$games[i].rate}
                    {$video_rating}
                    <div class="clear_right"></div>
                    {$games[i].total_plays} {if $games[i].total_plays == '1'}{t c='global.play'}{else}{t c='global.plays'}{/if}
                </div>
                <div class="clear"></div>
            </div>
            {/section}
            <div class="clear_left"></div>
            <div class="pagination"><ul>{$page_link}</ul></div><br />
            {else}
                <p>&nbsp;&nbsp;&nbsp;{t c='games.none'}</p>
            {/if}
			<div class="clear"></div>
        </div>
        <div class="box">
		<div class="btitle"><h2>{t c='global.sponsors'}</h2></div>
        {insert name=adv assign=adv group='games_bottom'}
        {if $adv}<br /><div class="ads">{$adv}</div><br />{/if}
        </div>
    </div>
    <div class="right span-200">
	{insert name=load_plugin page=game plugin=gtag_cloud}
          <div class="box">
              <div class="btitle"><h2>{t c='global.sponsors'}</h2></div>
              {insert name=adv assign=adv group='games_right'}
              {if $adv}<br /><div class="ads">{$adv}</div><br />{/if}
          </div>
    </div>
    <div class="clear"></div>
</div>
