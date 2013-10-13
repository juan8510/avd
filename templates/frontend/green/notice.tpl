<script type="text/javascript" src="{$relative_tpl}/js/jquery.notice-0.1.js"></script>
<div id="content">
    <div class="left span-755">
        <div class="box">            
            <div class="btitle"><h2><a href="{$relative}/notice/{$notice.NID}/{$notice.title|clean}">{$notice.title|escape:'html'}</a></h2></div>
            <div class="notice_info">
                <div class="notice_info_left">
                    {insert name=time_range assign=addtime time=$notice.addtime}
                    {$addtime}
                </div>
                <div class="notice_info_right">
                    {t c='global.by'}: <a href="{$relative}/user/{$notice.username}">{$notice.username|escape:'html'}</a>
                </div>
                <div class="clear"></div>
            </div>
            <div class="notice_content">
                {$notice.content}
            </div>
            <div class="clear"></div>
        </div>
        <div class="box">
            <div class="btitle"><h2>{t c='global.COMMENTS'}</h2></div>
            {if isset($smarty.session.uid)}
            <div id="post_comment">
                <form name="postNoticeComment" id="postNoticeComment" method="post" action="">
                    <textarea name="notice_comment" id="notice_comment" cols="75" rows="5" class="notice_comment"></textarea>
                    <div id="post_message" class="post_message" style="display: none;">Please enter your comment!</div>
                    <div class="action"><span id="chars_left">1000</span> {t c='global.chars_left'}</div>
                    <div class="action">
                        <input name="submit_comment" type="button" value=" {t c='global.post'} " id="post_notice_comment_{$notice.NID}" class="button" />
                    </div>
                    <div class="clear_left"></div>
                </form>
                <div id="photo_response" class="response" style="display: none;"></div>
            </div>
            {/if}
            <div id="notice_comments_{$notice.NID}">
            {if $comments}
                <div class="blinkp" id="photo_items">
                    {t c='global.showing'} <strong>{$start_num}</strong> {t c='global.to'} <strong>{$end_num}</strong> {t c='global.of'} <strong>{$comments_total}</strong> {t c='global.comments'}.
                </div>
                <div class="pagination"><ul>{$page_link}</ul></div>
                <div id="comments_delimiter" style="display:none;"></div>
                {section name=i loop=$comments}
                <div id="notice_comment_{$notice.NID}_{$comments[i].CID}">
                <div id="delete_response_{$comments[i].CID}" class="response" style="display: none;"></div>
                <div class="comment">
                    <div class="comment_left">
                        <a href="{$relative}/user/{$comments[i].username}">
                            <img src="{$relative}/media/users/{if $comments[i].photo != ''}{$comments[i].photo}{else}nopic-{$comments[i].gender}.gif{/if}" width="60" title="{$comments[i].username}'s avatar" alt="{$comments[i].username}'s avatar" />
                        </a>
                    </div>
                    <div class="comment_right_notice">
                        <div class="comment_info_notice">
                            {insert name=time_range assign=addtime time=$comments[i].addtime}
                            <a href="{$relative}/user/{$comments[i].username}">{$comments[i].username}</a>&nbsp;<strong>-</strong>&nbsp;<span class="font-10">{$addtime}</span>
                        </div>
                        <p class="comment_body_notice">{$comments[i].comment|escape:'html'|nl2br}</p>
                        {if isset($smarty.session.uid)}
                        <div class="comment_actions_notice">
                            {if $smarty.session.uid == $comments[i].UID}
                            <a href="#delete_comment" id="delete_comment_notice_{$comments[i].CID}_{$notice.NID}">{t c='global.delete'}</a> <strong>&middot;</strong>
                            {/if}
                            <span id="reported_spam_{$comments[i].CID}_{$notice.NID}"><a href="#report_spam" id="report_spam_notice_{$comments[i].CID}_{$notice.NID}">{t c='global.report_spam'}</a></span>
                        </div>
                        {/if}
                    </div>
                    <div class="clear"></div>
                </div>
                </div>
                {/section}
                <div class="pagination"><ul>{$page_link_b}</ul></div>
            {else}
            <div id="comments_delimiter" style="display:none;"></div>
            {/if}
            <br />
            </div>
        </div>
    </div>    
    <div class="right span-200">
        <div class="box">            
            <div class="btitle"><h2>{t c='global.CATEGORIES'}</h2></div>
            <ul class="notice_categories">
                <li><a href="{$relative}/notice">{t c='global.all'}</a></li>
                {section name=i loop=$categories}
                <li><a href="{$relative}/notice?c={$categories[i].category_id}">{$categories[i].name|escape:'html'}</a></li>
                {/section}
            </ul>
            <div class="clear_left"></div>
        </div>
        <div class="box">
            <div class="btitle"><h2>{t c='notice.ARCHIVE'}</h2></div>
            <ul class="notice_categories">
                <li><a href="{$relative}/notices">{t c='global.all'}</a></li>
                {section name=i loop=$arhive}
                <li><a href="{$relative}/notices?t={$arhive[i]}">{$arhive[i]|date_format:"%B %Y"}</a></li>
                {/section}
            </ul>
            <div class="clear_left"></div>
        </div>
    </div>
    <div class="clear"></div>
</div>
