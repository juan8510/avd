<script type="text/javascript">
var lang_favoriting = "{t c='global.favoriting'}";
var lang_thanks = "{t c='rate.thanks'}";
var lang_lame = "{t c='rate.lame'}";
var lang_bleh = "{t c='rate.bleh'}";
var lang_alright = "{t c='rate.alright'}";
var lang_good = "{t c='rate.good'}";
var lang_awesome = "{t c='rate.awesome'}";
</script>
<script type="text/javascript" src="{$relative_tpl}/js/jquery.photo-0.2.js"></script>
<div id="content">
    <div class="left span-300">
        {include file='user_info.tpl'}
    </div>
    <div class="right span-650">
        <div class="box">            
            <div class="btitle"><h2>{t c='photo.title'} {$album.name|truncate:20:' ...':true|escape:'html'}</h2></div>
            {if !$is_friend}
			<div class="private">{t c='album.private' r=$relative s=$username u=$username}</div></div></div>
            {else}
            <div class="photo">
                {if isset($next)}<a href="{$relative}/photo/{$next}">{/if}<img src="{$relative}/media/photos/{$photo.PID}.jpg" alt="{$photo.caption}" />{if isset($next)}</a>{/if}<br />
                <div class="photo_actions">
                    <div class="photo_rating">
                        <input name="current_rating" type="hidden" value="{$photo.rate}" id="current_rating" />
                        <div id="rating">
                            {insert name=rating assign=photo_rating rating=$photo.rate ratedby=$photo.ratedby type='photo' item_id=$photo.PID}
                            {$photo_rating}
                        </div>
                        <div id="rating_text">
                            {$photo.ratedby} {if $photo.ratedby == '1'}{t c='global.rating'}{else}{t c='global.ratings'}{/if}
                        </div>
                        <div class="clear_left"></div> 
                    </div>
                    <div class="photo_links">
                        {if isset($smarty.session.uid)}
                        <div id="flag_photo"><a href="#flag_photo">{t c='global.flag'}</a></div>
                        <div id="favorite_photo"><a href="#favorite_photo" id="favorite_photo_{$photo.PID}_{$photo.AID}">{t c='global.favorite'}</a></div>
                        {/if}
                        <div id="share_photo"><a href="#share_photo">{t c='global.share'}</a></div>
                        <div class="clear_right"></div>                        
                    </div>
                    <div class="clear"></div>
                </div>
                {if isset($prev)}
                <a href="{$relative}/photo/{$prev}">&laquo; {t c='global.prev'}</a>
                {/if}
                {if isset($prev) && isset($next)} &middot; {/if}
                {if isset($next)}
                <a href="{$relative}/photo/{$next}">{t c='global.next'} &raquo;</a>
                {/if}
            </div>
            <div class="album">
                <a href="{$relative}/album/{$photo.AID}/{$album.name|clean}">{t c='global.back_to'} '{$album.name|escape:'html'}'</a>
            </div>
            <br />
        </div>
        <div id="response_message" class="response" style="display: none;"></div>
        {if isset($smarty.session.uid)}
        <div id="flag_photo_box" style="display:none;">
            <div class="box">                
                <div class="btitle"><h2>{t c='photo.flag'}</h2></div>
                <div class="blink"><a href="#close_flag" id="close_flag">{t c='global.close'}</a></div>
                <div class="clear_right"></div>
                <div id="flag_photo_response" class="posting" style="display: none;"></div>
                <div id="flag_photo_form">
                    <div class="photo_box_left">
                        <input name="flag_reason" type="radio" value="inappropriate" checked="yes" />&nbsp; {t c='flag.inappr'}<br />
                        <input name="flag_reason" type="radio" value="underage" />&nbsp; {t c='flag.underage'}<br />
                        <input name="flag_reason" type="radio" value="copyrighted" />&nbsp; {t c='flag.copyright'}<br />
                        <input name="flag_reason" type="radio" value="other" />&nbsp; {t c='flag.other'}<br />
                        <span id="flag_reason_error" class="font-11 font-bold" style="color: red; display: none;"></span>
                    </div>
                    <div class="photo_box_right">
                        <div class="separator">
                            {t c='flag.reason'}:<br />
                            <textarea name="flag_message" cols="30" rows="4" id="flag_message"></textarea>                            
                        </div>
                    </div>
                    <div class="clear"></div>
                    <div style="width: 100%; text-align: center; padding-bottom: 5px;">
                        <input name="submit_flag" type="button" value=" {t c='photo.flag_send'} " id="submit_flag_photo_{$photo.PID}" class="button" />
                    </div>                                                                                               
                </div>
            </div>
        </div>
        {/if}
        <div id="share_photo_box" style="display: none;">
            <div class="box">
                <div class="btitle"><h2>{t c='photo.share'}</h2></div>
                <div class="blink"><a href="#close_share" id="close_share">{t c='global.close'}</a></div>
                <div class="clear_right"></div>
                <div id="share_photo_response" class="response" style="display: none;"></div>
                <div id="share_video_form">
                    <form name="share_video_form" method="post" action="#share_video">
                        <div class="photo_box_left">
                            <div class="separator">
                                {t c='global.from'}: <br />
                                <input name="from" type="text" value="{if isset($smarty.session.uid)}{if $smarty.session.fname != ''}{$smarty.session.fname}{else}{$smarty.session.username}{/if}{/if}" id="share_from" /><br />
                                <span id="share_from_error" class="font-11 font-bold" style="color: red; display: none;"></span>
                            </div>
                            <div class="separator">
                                {t c='global.to'}: <br />
                                <textarea name="to" cols="30" rows="5" id="share_to"></textarea><br />
                                <span id="share_to_error" class="font-11 font-bold" style="color: red; display: none;"><br /></span>
                                <span class="font-11">{t c='global.share_expl' s=$site_name}</span>
                            </div>                                                                                                                                                                                                                                                                                                    
                        </div>
                        <div class="photo_box_right">
                            <div class="separator">
                                {t c='global.message_opt'}:
                                <textarea name="message" cols="30" rows="8" id="share_message"></textarea>
                            </div>                                                                                                                                
                        </div>
                        <div class="clear"></div>
                        <div style="width: 100%; text-align: center; padding-bottom: 5px;">
                            <input name="submit_share" type="button" value=" {t c='photo.share_send'} " id="send_share_photo_{$photo.PID}" class="button" />
                        </div>                                                                                        
                    </form>
                </div>
            </div>
        </div>
        <div class="box">            
            <div class="btitle"><h2>{t c='global.COMMENTS'}</h2></div>
            {if isset($smarty.session.uid) && $photo_comments == '1'}
            <div id="post_comment">
                <form name="postPhotoComment" id="postPhotoComment" method="post" action="">
                    <textarea name="photo_comment" id="photo_comment" cols="75" rows="5" class="user_txtarea"></textarea>
                    <div id="post_message" class="post_message" style="display: none;">{t c='global.comment_empty'}</div>
                    <div class="action"><span id="chars_left">1000</span> {t c='global.chars_left'}</div>
                    <div class="action">
                        <input name="submit_comment" type="button" value=" {t c='global.post'} " id="post_photo_comment_{$photo.AID}_{$photo.PID}" class="button" />
                    </div>
                    <div class="clear_left"></div>
                </form>
                <div id="photo_response" class="response" style="display: none;"></div>
            </div>
            {/if}
            <div class="blinkp" id="photo_items">
                {t c='global.showing'} <strong>{$start_num}</strong> {t c='global.to'} <strong>{$end_num}</strong> {t c='global.of'} <strong>{$comments_total}</strong> {t c='global.comments'}.
            </div>
            <div id="photo_comments_{$photo.PID}">
            {if $comments}
            <div class="pagination"><ul>{$page_link}</ul></div>
            <div id="comments_delimiter" style="display:none;"></div>
            {section name=i loop=$comments}
            <div id="photo_comment_{$photo.PID}_{$comments[i].CID}">
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
                    <p class="comment_body">{$comments[i].comment|escape:'html'|nl2br}</p>
                    {if isset($smarty.session.uid)}
                    <div class="comment_actions">
                        {if $smarty.session.uid == $comments[i].UID}
                        <a href="#delete_comment" id="delete_comment_photo_{$comments[i].CID}_{$photo.PID}">{t c='global.delete'}</a> <strong>&middot;</strong>
                        {/if}
                        <span id="reported_spam_{$comments[i].CID}_{$photo.PID}"><a href="#report_spam" id="report_spam_photo_{$comments[i].CID}_{$photo.PID}">{t c='global.report_spam'}</a></span>
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
    </div>
    {/if}
    <div class="clear"></div>
</div>
