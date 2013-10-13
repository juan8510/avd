<div id="content">
    <div class="left span-755">
        <div class="box">
            <div class="btitle">
                <div class="btitlel"><h2>{translate c='index.videos_being_watched'}</h2></div>
                <div class="btitler"><a href="{$relative}/videos?o=bw">{translate c='index.videos_being_watched_more'}</a></div>
                <div class="clear"></div>
            </div>
            {if $viewed_videos}
            {section name=i loop=$viewed_videos}
            <div class="video_box">
                <a href="{$relative}/video/{$viewed_videos[i].VID}/{$viewed_videos[i].title|clean}"><img src="{$relative}/media/videos/tmb/{$viewed_videos[i].VID}/{$viewed_videos[i].thumb}.jpg" title="{$viewed_videos[i].title|escape:'html'}" alt="{$viewed_videos[i].title|escape:'html'}" width="160" height="120" id="rotate_{$viewed_videos[i].VID}_{$viewed_videos[i].thumbs}_viewed" /><br /><span class="font-13 font-bold">{$viewed_videos[i].title|truncate:21:' ...':true|escape:'html'}</span><br />{if $viewed_videos[i].type == 'private'}<img alt="" style="position: absolute; left: 0px; top: 0px; width: 160px; height: 120px;" src="{$relative_tpl}/images/{private type='video'}" />{/if}{if $viewed_videos[i].hd==1}<img alt="" style="position: absolute; right: 6px; top: 8px; border:none; width: 21px; height: 14px;" src="{$relative_tpl}/images/hd.png"/>{/if}</a>
                <div class="box_left">
                    {insert name=duration assign=duration duration=$viewed_videos[i].duration}
                    {$duration}<br />
                    {insert name=time_range assign=addtime time=$viewed_videos[i].addtime}
                    {$addtime}
                </div>
                <div class="box_right">
                    {insert name=rating_small assign=video_rating rating=$viewed_videos[i].rate}
                    {$video_rating}
                    <div class="clear_right"></div>                                                            
                    {$viewed_videos[i].viewnumber} {if $viewed_videos[i].viewnumber == '1'}{t c='global.view'}{else}{t c='global.views'}{/if}
                </div>
                <div class="clear"></div>
            </div>
            {/section}
            <div class="clear_left"></div>
            {else}
				<p>&nbsp;&nbsp;&nbsp;{t c='videos.no_videos_found'}!</p>
            {/if}
        </div>
        <div class="box">
            
            <div class="btitle">
                <div class="btitlel"><h2>{translate c='index.most_recent_videos'}</h2></div>
                <div class="btitler"><a href="{$relative}/videos?o=mr">{translate c='index.most_recent_videos_more'}</a></div>
                <div class="clear"></div>
            </div>
            {if $recent_videos}
            {section name=i loop=$recent_videos}
            <div class="video_box">
                <a href="{$relative}/video/{$recent_videos[i].VID}/{$recent_videos[i].title|clean}"><img src="{$relative}/media/videos/tmb/{$recent_videos[i].VID}/{$recent_videos[i].thumb}.jpg" title="{$recent_videos[i].title|escape:'html'}" alt="{$recent_videos[i].title|escape:'html'}" width="160" height="120" id="rotate_{$recent_videos[i].VID}_{$recent_videos[i].thumbs}_recent" /><br /><span class="font-13 font-bold">{$recent_videos[i].title|truncate:21:' ...':true|escape:'html'}</span><br />{if $recent_videos[i].type == 'private'}<img alt="" style="position: absolute; left: 0px; top: 0px; width: 160px; height: 120px;" src="{$relative_tpl}/images/{private type='video'}" />{/if}{if $recent_videos[i].hd==1}<img alt="" style="position: absolute; right: 6px; top: 8px; border:none; width: 21px; height: 14px;" src="{$relative_tpl}/images/hd.png"/>{/if}</a>
                <div class="box_left">
                    {insert name=duration assign=duration duration=$recent_videos[i].duration}
                    {$duration}<br />
                    {insert name=time_range assign=addtime time=$recent_videos[i].addtime}
                    {$addtime}
                </div>
                <div class="box_right">
                    {insert name=rating_small assign=video_rating rating=$recent_videos[i].rate}
                    {$video_rating}
                    <div class="clear_right"></div>                                                            
                    {$recent_videos[i].viewnumber} {if $recent_videos[i].viewnumber == '1'}{t c='global.view'}{else}{t c='global.views'}{/if}
                </div>
                <div class="clear"></div>
            </div>
            {/section}
            <div class="clear_left"></div>
            {else}
				<p>&nbsp;&nbsp;&nbsp;{t c='videos.no_videos_found'}!</p>
            {/if}            
        </div>
        <div class="box">
	    
	    <div class="btitle"><h2>{t c='global.sponsors'}</h2></div>
    	    {insert name=adv assign=adv group='index_bottom'}
    	    {if $adv}<br /><div class="ads">{$adv}</div><br />{/if}
        </div>
    </div>
    <div class="right span-200">
	    {insert name=load_plugin page=index plugin=login}
	    {insert name=load_plugin page=index plugin=statistics}
        <div class="box">            
            <div class="btitle"><h2>{t c='global.sponsors'}</h2></div>
            {insert name=adv assign=adv group='index_right'}
            {if $adv}<br /><div class="ads">{$adv}</div><br />{/if}
        </div>
    </div>
    <div class="clear"></div>
</div>
