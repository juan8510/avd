<script type="text/javascript">
var lang_posting = "{t c='global.posting'}";
var lang_comment_limit = "{t c='global.comment_limit'}";
var lang_comment_success = "{t c='global.comment_success'}";
</script>
<script type="text/javascript" src="{$relative_tpl}/js/jquery.blog-0.1.js"></script>
<div id="content">
    <div class="left span-300">
        {include file='user_info.tpl'}
    </div>
    <div class="right span-650">
        <div class="box">
            <div class="btitle"><h2>{$blog.title|truncate:50:' ...':true|escape:'html'}</h2></div>
            {if isset($smarty.session.uid) && $smarty.session.uid == $blog.UID}
            <div class="blink">
                <div class="blinkl">
                    {t c='global.total_views'}: <strong>{$blog.total_views}</strong>
                </div>
                <div class="blinkr">
                    <a href="{$relative}/blog/edit/{$blog.BID}">{t c='global.edit'}</a> <strong>&middot;</strong>
                    <a href="{$relative}/blog/delete/{$blog.BID}">{t c='global.delete'}</a>
                </div>
                <div class="clear"></div>
            </div>
            {/if}
            <div class="blog_message">{$blog.content|nl2br}</div>
            <br />
            {if isset($smarty.session.uid) && $blog_comments == '1'}
            <br />
            <div id="post_comment_blog">
                <form name="postBlogComment" id="postBlogComment" method="post" action="{$relative}/blog/{$blog.BID}">
                    <div class="separator"><div id="media_message" style="display: none;"></div></div>
                    <div class="separator"><div id="media_content" style="display: none;"></div></div>
                    <textarea name="blog_comment" id="blog_comment" cols="75" rows="5" class="user_txtarea"></textarea>
                    <div id="post_message" class="post_message" style="display: none;">{t c='global.comment_empty'}!</div>
                    <div class="action"><span id="chars_left">1000</span> {t c='global.chars_left'}</div>
                    <div class="action">
                        <input name="submit_comment" type="button" value=" {t c='global.post'} " id="post_blog_comment_{$blog.BID}" class="button" />
                    </div>
                    <div class="action">
                        <a href="#attach_photo" id="attach_photo">{t c='global.attach_photo'}</a>
                    </div>
                    <div class="clear_left"></div>
                </form>
                <div id="blog_response" class="response" style="display: none;"></div>
            </div>
            <br />                                                                                                                                                                                  
            {/if}
            {if $comments}
            <div id="blog_comments_{$blog.BID}">
            <div class="blinkl">
                {t c='global.showing'} <strong>{$start_num}</strong> {t c='global.to'} <strong>{$end_num}</strong> {t c='global.of'} <strong>{$comments_total}</strong> {t c='global.comments'}.
            </div>
            <div class="clear_left"></div>
            <div class="pagination"><ul>{$page_link}</ul></div>
            <div id="comments_delimiter" style="display:none;"></div>
            {section name=i loop=$comments}
            <div id="blog_comment_{$blog.BID}_{$comments[i].CID}">
            <div id="delete_response_{$comments[i].CID}" class="response" style="display: none;"></div>
            <div class="comment">
                <div class="comment_left">
                    <a href="{$relative}/user/{$comments[i].username}">
                        <img src="{$relative}/media/users/{if $comments[i].photo != ''}{$comments[i].photo}{else}nopic-{$comments[i].gender}.gif{/if}" width="60" title="{$comments[i].username}'s avatar" alt="{$comments[i].username}'s avatar" />
                    </a>
                </div>
                <div class="comment_right">
                    <div class="comment_info">
                         {insert name=time_range assign=addtime time=$comments[i].addtime}
                         <a href="{$relative}/user/{$comments[i].username}">{$comments[i].username}</a>&nbsp;<strong>-</strong>&nbsp;<span class="font-10">{$addtime}</span>
                    </div>
                    <p class="comment_body">{$comments[i].comment|nl2br}</p>
                    {if isset($smarty.session.uid)}
                    <div class="comment_actions">
                        {if $smarty.session.uid == $comments[i].UID}
                        <a href="#delete_comment" id="delete_comment_blog_{$comments[i].CID}_{$blog.BID}">{t c='global.delete'}</a> <strong>&middot;</strong>
                        {/if}
                        <span id="reported_spam_{$comments[i].CID}_{$blog.BID}"><a href="#report_spam" id="report_spam_blog_{$comments[i].CID}_{$blog.BID}">{t c='global.report_spam'}</a></span>
                    </div>
                    {/if}
                </div>
                <div class="clear"></div>
            </div>
            </div>
	        {/section}
            <div class="pagination"><ul>{$page_link_b}</ul></div>
            </div>
            <br />
            {else}
            <div id="comments_delimiter" style="display:none;"></div>
            {/if}
            <br />
        </div>
    </div>
    <div class="clear"></div>
</div>
