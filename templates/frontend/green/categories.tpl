<script type="text/javascript" src="{$relative_tpl}/js/jquery.categories-0.1.js"></script>
<div id="content">
    <div class="left span-760">
        {section name=i loop=$videos}
        {if $videos[i].category_videos}
        <div class="category_box">
        <div class="box">
            <div class="btop">
                <div class="btopl"><h2>{$videos[i].name|escape:'html'}</h2></div>
                <div class="btopc">
                    <a href="#" id="next_page_category_videos_{$videos[i].CHID}" class="next_loop">{t c='global.next'}</a>
                    <a href="#" id="prev_page_category_videos_{$videos[i].CHID}" class="prev_loop" style="display: none;">{t c='global.prev'}</a>
                    <div class="clear_right"></div>
                </div>
                <div class="btopr"><a href="{$relative}/videos?c={$videos[i].CHID}">{t c='global.view_more'}</a></div>
                <div class="clear"></div>
            </div>
            <input name="current_page_{$videos[i].CHID}" type="hidden" value="1" id="current_page_{$videos[i].CHID}" />
            <div id="category_loading" style="display: none;"></div>
            <div id="category_videos_{$videos[i].CHID}">
            {assign var=cvideos value=$videos[i].category_videos}
            {section name=j loop=$cvideos}
            <div class="video_c_box">
                <a href="{$relative}/video/{$cvideos[j].VID}/{$cvideos[j].title|clean}"><img src="{$relative}/media/videos/tmb/{$cvideos[j].VID}/{$cvideos[j].thumb}.jpg" title="{$cvideos[j].title|escape:'html'}" alt="{$cvideos[j].title|escape:'html'}" width="160" height="120" id="rotate_{$cvideos[j].VID}_{$cvideos[j].thumbs}" /><br />{if $cvideos[j].type == 'private'}<img alt="" style="position: absolute; left: 0px; top: +0px; width: 160px; height: 120px;"  src="{$relative_tpl}/images/{private type='video'}" />{/if}<span class="font-13 font-bold">{$cvideos[j].title|truncate:21:' ...':true|escape:'html'}</span></a><br />
                <div class="box_left">
                    {insert name=duration assign=duration duration=$cvideos[j].duration}
                    {$duration}<br />
                    {insert name=time_range assign=addtime time=$cvideos[j].addtime}
                    {$addtime}                                                                                                
                </div>
                <div class="box_right">
                    {insert name=rating_small assign=video_rating rating=$cvideos[j].rate}
                    {$video_rating}
                    <div class="clear_right"></div>
                    {$cvideos[j].viewnumber} {if $cvideos[j].viewnumber == '1'}{t c='global.view}{else}{t c='global.views'}{/if}
                </div>
                <div class="clear"></div>
            </div>
            {/section}
            </div>
            <div class="clear_left"></div>
        </div>
        </div>
        {/if}
        {/section}
        <div class="clear_left"></div>
        <div class="box">
            <div class="btitle"><h2>{t c='global.sponsors'}</h2></div>
            {insert name=adv assign=adv group='categories_bottom'}
            {if $adv}<br /><div class="ads">{$adv}</div><br />{/if}
        </div>
    </div>
    <div class="right span-200">
        <div class="box">
            <div class="btitle"><h2>{t c='global.sponsors'}</h2></div>
            {insert name=adv assign=adv group='categories_right'}
            {if $adv}<br /><div class="ads">{$adv}</div><br />{/if}
        </div>
    </div>
    <div class="clear"></div>
</div>
