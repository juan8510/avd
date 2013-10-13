<div id="content">
    <div class="left span-755">
        <div class="box">            
            <div class="bmenu">
                <div class="bmenul"><h2>{t c='search.title'} '{$search_query|truncate:30:' ...':true|escape:'html'}'</h2></div>
                <div class="bmenur">{literal}
                    <script type="text/javascript">
                        $(document).ready(function(){
                            $("select[id='order_type'],select[id='order_timeline'],select[id='order_category']").change(function() {
                                $('#orderVideos').submit();
                            });
                        });
                    </script>
                    {/literal}
                    <div id="order_form">
                    <form name="orderVideos" id="orderVideos" method="get" action="{$relative}/search">
                        <input name="o" type="hidden" value="{$order}" />
                        <input name="search_query" type="hidden" value="{$search_query|escape:'url'}" />
                        <input name="search_type" type="hidden" value="videos" />
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
                            <option value="{$categories[i].CHID}"{if $category == $categories[i].CHID} selected="yes"{/if}>{$categories[i].name}</option>
                            {/section}
                        </select>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
            <div class="bsubmenu">
                <div class="bsubmenul">
                    {if $order == 'bw'}{t c='global.being_watched'}{else}<a href="{url base='search' strip='o' value='bw'}">{t c='global.being_watched'}</a>{/if} <strong>&middot;</strong>
                    {if $order == 'mr'}{t c='global.most_recent'}{else}<a href="{url base='search' strip='o' value='mr'}">{t c='global.most_recent'}</a>{/if} <strong>&middot;</strong>
                    {if $order == 'mv'}{t c='global.most_viewed'}{else}<a href="{url base='search' strip='o' value='mv'}">{t c='global.most_viewed'}</a>{/if} <strong>&middot;</strong>
                    {if $order == 'tr'}{t c='global.top_rated'}{else}<a href="{url base='search' strip='o' value='tr'}">{t c='global.top_rated'}</a>{/if} <strong>&middot;</strong>
                    {if $order == 'md'}{t c='global.most_commented'}{else}<a href="{url base='search' strip='o' value='md'}">{t c='global.most_commented'}</a>{/if}
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
                <div class="blinkcl">{t c='global.showing'} <span>{$start_num}</span> {t c='global.to'} <span>{$end_num}</span> {t c='global.of'} <span>{$videos_total}</span> {t c='videos.videos'}.</div>
                <div class="blinkcr"><a href="{$relative}/upload/video">{t c='videos.upload'}</a></div>
                <div class="clear"></div>
            </div>
            {if $videos}
            {section name=i loop=$videos}
            <div class="video_box">
                <a href="{$relative}/video/{$videos[i].VID}/{$videos[i].title|clean}"><img src="{$relative}/media/videos/tmb/{$videos[i].VID}/{$videos[i].thumb}.jpg" title="{$videos[i].title|escape:'html'}" alt="{$videos[i].title|escape:'html'}" width="160" height="120" id="rotate_{$videos[i].VID}_{$videos[i].thumbs}" /><br /><span class="font-13 font-bold">{$videos[i].title|truncate:23:' ...':true|escape:'html'}</span><br />{if $videos[i].type == 'private'}<img alt="" style="position: absolute; left: 0px; top: 0px; width: 160px; height: 120px;" src="{$relative_tpl}/images/{private type='video'}"/>{/if}{if $videos[i].hd==1}<img alt="" style="position: absolute; right: 6px; top: 8px; border:none; width: 21px; height: 14px;" src="{$relative_tpl}/images/hd.png"/>{/if}</a>
                <div class="box_left">
                    {insert name=duration assign=duration duration=$videos[i].duration}
                    {$duration}<br />
                    {insert name=time_range assign=addtime time=$videos[i].addtime}
                    {$addtime}                                                                                                
                </div>
                <div class="box_right">
                    {insert name=rating_small assign=video_rating rating=$videos[i].rate}
                    {$video_rating}
                    <div class="clear_right"></div>
                    {$videos[i].viewnumber} {if $videos[i].viewnumber == '1'}{t c='global.view'}{else}{t c='global.views'}{/if}
                </div>
                <div class="clear"></div>
            </div>
            {/section}
            <div class="clear_left"></div>
            <div class="pagination"><ul>{$page_link}</ul></div><br />
            {else}
          		{t c='videos.no_videos_found'}
            {/if}
        </div>
        <div class="box">
			<div class="btitle"><h2>{t c='global.sponsors'}</h2></div>
        {insert name=adv assign=adv group='videos_bottom'}
        {if $adv}<br /><div class="ads">{$adv}</div><br />{/if}                               
		</div>
    </div>    
    <div class="right span-200">
          <div class="box">
              <div class="btitle"><h2>{t c='global.sponsors'}</h2></div>
              {insert name=adv assign=adv group='videos_right'}
              {if $adv}<br /><div class="ads">{$adv}</div><br />{/if}
          </div>
    </div>
    <div class="clear"></div>
</div>
