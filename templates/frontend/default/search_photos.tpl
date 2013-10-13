<div id="content">
    <div class="left span-755">
        <div class="box">            
            <div class="bmenu">
                <div class="bmenul">
                    <h2>{t c='search.title'} '{$search_query|truncate:30:' ...':true|escape:'html'}'</h2>
                </div>{literal}
                <script type="text/javascript">
                $(document).ready(function(){
                    $("select[id='order_type'],select[id='order_category'],select[id='timeline_order']").change(function() {
                        $('#orderAlbums').submit();
                    });
                });
                </script>
                {/literal}                                                                                                                                                        
                <div class="bmenur">
                    <div id="order_form">
                        <form name="orderAlbums" id="orderAlbums" method="get" action="{$relative}/search">
                            <input name="o" type="hidden" value="{$order}" />
                            <input name="search_query" type="hidden" value="{$search_query|escape:'url'}" />
                            <input name="search_type" type="hidden" value="photos" />
                            <span class="mleft">{t c='global.type'}: </span>
                            <select name="type" id="order_type">
                            <option value=""{if $type == ''} selected="yes"{/if}>{t c='global.all'}</option>
                            <option value="public"{if $type == 'public'} selected="yes"{/if}>{t c='global.public'}</option>
                            <option value="private"{if $type == 'private'} selected="yes"{/if}>{t c='global.private'}</option>
                            </select>
                            <span class="mleft">{t c='global.category'}: </span>
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
                   {if $order == 'mr'}{t c='global.most_recent'}{else}<a href="{url base='search' strip='o' value='mr'}">{t c='global.most_recent'}</a>{/if} <strong>&middot;</strong>
                    {if $order == 'mv'}{t c='global.most_viewed'}{else}<a href="{url base='search' strip='o' value='mv'}">{t c='global.most_viewed'}</a>{/if} <strong>&middot;</strong>
                    {if $order == 'mp'}{t c='album.most_photos'}{else}<a href="{url base='search' strip='o' value='mp'}">{t c='album.most_photos'}</a>{/if} <strong>&middot;</strong>
                    {if $order == 'tr'}{t c='global.top_rated'}{else}<a href="{url base='search' strip='o' value='tr'}">{t c='global.top_rated'}</a>{/if} <strong>&middot;</strong>
                    {if $order == 'md'}{t c='global.most_commented'}{else}<a href="{url base='search' strip='o' value='md'}">{t c='global.most_commented'}</a>{/if} <strong>&middot;</strong>
                    {if $order == 'tf'}{t c='global.top_favorites'}{else}<a href="{url base='search' strip='o' value='tf'}">{t c='global.top_favorites'}</a>{/if}
                </div>
                <div class="bsubmenur">
                    <div id="timeline_form">
                        <span>{t c='global.timeline'}: </span>
                        <select name="t" id="timeline_order">
                        <option value="t"{if $timeframe == 't'} selected="yes"{/if}>{t c='global.today'}</option>
                        <option value="w"{if $timeframe == 'w'} selected="yes"{/if}>{t c='global.this_week'}</option>
                        <option value="m"{if $timeframe == 'm'} selected="yes"{/if}>{t c='global.this_month'}</option>
                        <option value="a"{if $timeframe == 'a'} selected="yes"{/if}>{t c='global.all'}</option>
                        </select>
                        </form>
                    </div>
                </div>
                <div class="clear"></div>
            </div>            
            <div class="blinkp">
                <div class="blinkcl">{t c='global.showing'} <span>{$start_num}</span> {t c='global.to'} <span>{$end_num}</span> {t c='global.of'} <span>{$albums_total}</span> {t c='global.albums'}.</div>
                <div class="blinkcr"><a href="{$relative}/upload/photo">{t c='album.upload'}</a></div>
                <div class="clear"></div>
            </div>
            {if $albums}
            {section name=i loop=$albums}
            <div class="album_box">
                <a href="{$relative}/album/{$albums[i].AID}/{$albums[i].name|clean}"><img src="{$relative}/media/albums/{$albums[i].AID}.jpg" title="{$albums[i].name|escape:'html'}" alt="{$albums[i].name|escape:'html'}" width="120" /><br />{if $albums[i].type == 'private'}<img alt="" style="position: absolute; left: 0px; top: +13px; width: 120px; height: 140px;" src="{$relative_tpl}/images/{private type='album'}"/>{/if}<span class="font-11 font-bold">{$albums[i].name|truncate:23:' ...':true|escape:'html'}</span><br /></a>
                <div class="album_info">
                    <div class="album_left">
                        {$albums[i].total_photos} {if $albums[i].total_photos > 1}photos{else}photo{/if}<br />
                    </div>
                    <div class="album_right">
                        {insert name=rating_small assign=album_rating rating=$albums[i].rate}
                        {$album_rating}
                    </div>
                    <div class="clear"></div>
                    {t c='global.from'}: <a href="{$relative}/user/{$albums[i].username}">{$albums[i].username|escape:'html'}</a><br />
                    {insert name=time_range assign=addtime time=$albums[i].addtime}
                    {t c='global.added'}: {$addtime}                                                                        
                </div>
            </div>
            {/section}
            <div class="clear_left"></div>
            <div class="pagination"><ul>{$page_link}</ul></div><br />
            {else}
                <br />&nbsp;{t c='search.none'}<br /><br />
            {/if}
        </div>
        <div class="box">
			<div class="btitle"><h2>{t c='global.sponsors'}</h2></div>
        {insert name=adv assign=adv group='search_photos_bottom'}
        {if $adv}<br /><div class="ads">{$adv}</div><br />{/if}
		</div>
    </div>
    <div class="right span-200">
        <div class="box">
			<div class="btitle"><h2>{t c='global.sponsors'}</h2></div>
            {insert name=adv assign=adv group='search_photos_right'}
            {if $adv}<br /><div class="ads">{$adv}</div><br />{/if}
        </div>
    </div>
    <div class="clear"></div>
</div>
