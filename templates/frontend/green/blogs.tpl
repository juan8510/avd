<div id="content">
    <div class="left span-755">
        <div class="box">            
            <div class="bmenu">
                <div class="bmenul"><h2>{$title|upper} {t c='blog.BLOGS'}</h2></div>
                <div class="clear"></div>
				{literal}
                <script type="text/javascript">
                $(document).ready(function(){
              		$("select[id='order_timeline']").change(function() {
                  		$('#orderBlogs').submit();
                    });
                });
                </script>
                {/literal}
            </div>
            <div class="bsubmenu">
                <div class="bsubmenul">
                    {if $order == 'mr'}{t c='global.most_recent'}{else}<a href="{url base='blogs' strip='o' value='mr'}">{t c='global.most_recent'}</a>{/if} <strong>&middot;</strong>
                    {if $order == 'mv'}{t c='global.most_viewed'}{else}<a href="{url base='blogs' strip='o' value='mv'}">{t c='global.most_viewed'}</a>{/if} <strong>&middot;</strong>
                    {if $order == 'md'}{t c='global.most_commented'}{else}<a href="{url base='blogs' strip='o' value='md'}">{t c='global.most_commented'}</a>{/if}                                                                                    
                </div>
				<div class="bsubmenur">
					 <form name="orderBlogs" id="orderBlogs" method="get" action="{$relative}/blogs">
				     <div id="timeline_form">
                        <span>{t c='global.timeline'}: </span>
						<input name="o" type="hidden" value="{$order}" />
                        <select name="t" id="order_timeline">
                            <option value="t"{if $timeframe == 't'} selected="selected"{/if}>{t c='global.today'}</option>
                            <option value="w"{if $timeframe == 'w'} selected="selected"{/if}>{t c='global.this_week'}</option>
                            <option value="m"{if $timeframe == 'm'} selected="selected"{/if}>{t c='global.this_month'}</option>
                            <option value="a"{if $timeframe == 'a'} selected="selected"{/if}>{t c='global.all'}</option>
                        </select>
                    </div>
                    </form>
				</div>
                <div class="clear"></div>
            </div>
            <div class="blinkpnodot">
                <div class="blinkcl">{t c='global.showing'} <span>{$start_num}</span> {t c='global.to'} <span>{$end_num}</span> {t c='global.of'} <span>{$blogs_total}</span> {t c='blog.blog_art'}.</div>
                <div class="blinkcr"><a href="{$relative}/blog/add">{t c='blog.create_new'}</a></div>
                <div class="clear"></div>
            </div>
        </div>    
        {if $blogs}
        {section name=i loop=$blogs}
        <div class="box">            
            <div class="btitle"><h2><a href="{$relative}/user/{$blogs[i].username}">{$blogs[i].username} {t c='global.blog'}</a></h2></div>
            <div class="blog_header">
                <h5><a href="{$relative}/blog/{$blogs[i].BID}/{$blogs[i].title|clean}">{$blogs[i].title|escape:'html'}</a></h5>
                {insert name=time_range assign=addtime time=$blogs[i].addtime}
                <span class="smallest grey"> {t c='blog.views'}: {$blogs[i].total_views} <strong>&middot;</strong> {t c='global.added'}: {$addtime}</span>
            </div>
            <div class="blog_content">
                {$blogs[i].content|nl2br}
            </div>
            <div class="blog_links">
                <a href="{$relative}/blog/{$blogs[i].BID}/{$blogs[i].title|clean}">{$blogs[i].total_comments} {t c='global.comments'}</a> <strong>&middot;</strong>
                <a href="{$relative}/blog/{$blogs[i].BID}/{$blogs[i].title|clean}">{t c='blog.post_comment'}</a>                                
            </div>
        </div>
        {/section}
        <div class="pagination"><ul>{$page_link}</ul></div>
        {else}
        <p>{t c='blog.none'}</p>
        {/if}
        <div class="box">
			<div class="btitle"><h2>{t c='global.sponsors'}</h2></div>
        {insert name=adv assign=adv group='blogs_bottom'}
        {if $adv}<br /><div class="ads">{$adv}</div><br />{/if}
        </div>
    </div>
    <div class="right span-200">
        <div class="box">
            <div class="btitle"><h2>{t c='global.sponsors'}</h2></div>
            {insert name=adv assign=adv group='blogs_right'}
            {if $adv}<br /><div class="ads">{$adv}</div><br />{/if}
        </div>
    </div>
    <div class="clear"></div>
</div>
