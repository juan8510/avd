<div id="content">
    <div class="left span-300">
        {include file='user_info.tpl'}
    </div>
    <div class="right span-650">
        <div class="box">            
            <div class="btitle"><h2>{$username|upper} {t c='user.WALL'}</h2></div>
            {if isset($smarty.session.uid) && $wall_comments == '1'}
            <div id="wall">
                <form name="wall_form" id="wall_form" method="post" action="#post_comment">
                <div class="separator"><div id="media_message" style="display: none;"></div></div>
                <div class="separator"><div id="media_content" style="display: none;"></div></div>
                <textarea name="wall_comment" id="wall_comment" cols="75" rows="5" class="user_txtarea">{$comment}</textarea>
                <div id="post_message" class="post_message" style="display: none;">{t c='global.comment_empty'}</div>
                <div class="center">
                    <div class="left"><span id="chars_left">1000</span> {t c='global.chars_left'}</div>
                    <div class="middle">
                        <input name="submit_wall" type="submit" value=" {t c='global.post'} " id="post_wall_comment_{$user.UID}" class="button">
                    </div>
                    <div class="right">
                        <a href="#attach_photo" id="attach_photo">{t c='global.attach_photo'}</a> &nbsp;
                        <a href="#attach_video" id="attach_video">{t c='global.attach_video'}</a>
                    </div>
                    <div class="clear_left"></div>
                </div>
                </form>
                <div id="wall_response" class="wall_response" style="display: none;"></div>
            </div>
            <br />
            {/if}
            <div id="wall_comments_{$user.UID}">
            {if $walls}
                <div class="blinkp">
                    &nbsp;{t c='global.showing'} <strong>{$start_num}</strong> {t c='global.to'} <strong>{$end_num}</strong> {t c='global.of'} <strong>{$walls_total}</strong> {t c='global.comments'}.
                </div>
                <div class="pagination"><ul>{$page_link}</ul></div>
                <div id="comments_delimiter" style="display:none;"></div>
                {section name=i loop=$walls}
                <div id="wall_comment_{$walls[i].wall_id}">
                <div id="delete_response_{$walls[i].wall_id}" class="response" style="display: none;"></div>
                <div class="comment">
                    <div class="comment_left">
                        <a href="{$relative}/user/{$walls[i].username}">
                            <img src="{$relative}/media/users/{if $walls[i].photo != ''}{$walls[i].photo}{else}nopic-{$walls[i].gender}.gif{/if}" width="60" title="{$walls[i].username}'s avatar" alt="{$walls[i].username}'s avatar" />
                        </a>
                    </div>
                    <div class="comment_right">
                        <div class="comment_info">
                            {insert name=time_range assign=addtime time=$walls[i].addtime}
                            <a href="{$relative}/user/{$walls[i].username}">{$walls[i].username}</a>&nbsp;<strong>-</strong>&nbsp;<span class="smallest">{$addtime}</span>
                        </div>
                        <p class="comment_body">{$walls[i].message|nl2br}</p>
                        {if isset($smarty.session.uid)}
                        <div class="comment_actions">
                            {if $smarty.session.uid == $walls[i].UID}
                            <a href="#delete_comment" id="delete_comment_wall_{$walls[i].wall_id}_{$user.UID}">{t c='global.delete'}</a> <strong>&middot;</strong>
                            {/if}
                            <span id="reported_spam_{$walls[i].wall_id}_{$user.UID}"><a href="#report_spam" id="report_spam_wall_{$walls[i].wall_id}_{$user.UID}">{t c='global.report_spam'}</a></span>
                        </div>
                        {/if}                                                                                                                                                                                                    
                    </div>
                    <div class="clear"></div>
                </div>
                </div>
                {/section}
                <div class="pagination"><ul>{$page_link_b}</ul></div>
            </div>            
            {else}
            <div id="comments_delimiter" style="display:none;"></div>
            {/if}
            <br />
            </div>
        </div>
    </div>
    <div class="clear"></div>
</div>
