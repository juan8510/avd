<script type="text/javascript">
var lang_favoriting = "{t c='global.favoriting'}";
var lang_posting = "{t c='global.posting'}";
var lang_thanks = "{t c='rate.thanks'}";
var lang_lame = "{t c='rate.lame'}";
var lang_bleh = "{t c='rate.bleh'}";
var lang_alright = "{t c='rate.alright'}";
var lang_good = "{t c='rate.good'}";
var lang_awesome = "{t c='rate.awesome'}";
</script>
<script type="text/javascript" src="{$relative_tpl}/js/jquery.game-0.2.js"></script>
<div id="content">
    <div class="left span-630">
        <h1>{$game.title|escape:'html'}</h1>
        <div id="player">{if !$is_friend}{t c='game.private' r=$relative u=$game.username un=$game.username}{/if}</div>
        {if $is_friend}
        <script type='text/javascript' src="{$relative_tpl}/js/swfobject.js"></script>
        <script type='text/javascript'>
        var s1 = new SWFObject('{$relative}/media/games/swf/{$game.GID}.swf','player','630','500','9');
        s1.addParam('allowfullscreen','true');
        s1.addParam('allowscriptaccess','always');
        s1.write('player');
        </script>
        {/if}
        <div class="video_actions">
            <div class="video_rating">
                <input name="current_rating" type="hidden" value="{$game.rate}" id="current_rating" />
                <div id="rating">
                    {insert name=rating assign=game_rating rating=$game.rate ratedby=$game.ratedby type='game' item_id=$game.GID}
                    {$game_rating}                                        
                </div>
                <div id="rating_text">
                    {$game.ratedby} {if $game.ratedby == '1'}{t c='global.rating'}{else}{t c='global.ratings'}{/if}
                </div>
                <div class="clear"></div>
            </div>
            <div class="video_links">
                {if isset($smarty.session.uid)}
                <div id="flag_game"><a href="#flag_game">{t c='global.flag'}</a></div>
                <div id="favorite_game"><a href="#favorite_game" id="favorite_game_{$game.GID}">{t c='global.favorite'}</a></div>
                {/if}
                <div id="share_game"><a href="#share_game">{t c='global.share'}</a></div>
                <div class="clear_right"></div>
            </div>
            <div class="clear"></div>
        </div>
        <div id="response_message" class="response" style="display: none;"></div>
        <div id="share_game_box" style="display: none;">
            <div class="box">
                <div class="btitle"><h2>{t c='game.share'}</h2></div>
                <div class="blink"><a href="#close_share" id="close_share">close</a></div>
                <div class="clear_right"></div>
                <div id="share_game_response" class="response" style="display: none;"></div>
                <div id="share_game_form">
                    <form name="share_game_form" method="post" action="#share_game">
                    <div class="video_box_left">
                        <div class="separator">
                            {t c='global.from'}: <br />
                            <input name="from" type="text" value="{if isset($smarty.session.uid)}{if $smarty.session.fname != ''}{$smarty.session.fname}{else}{$smarty.session.username}{/if}{/if}" maxlength="50" id="share_from" /><br />
                            <span id="share_from_error" class="font-11 font-bold" style="color: red; display: none;"></span>
                        </div>
                        <div class="separator">
                            {t c='global.to'}: <br />
                            <textarea name="to" cols="30" rows="5" id="share_to"></textarea><br />
                            <span id="share_to_error" class="font-11 font-bold" style="color: red; display: none;"><br /></span>
                            <span class="font-11">Enter E-mails or {$site_name} usernames<br />comma or space separated).</span>
                        </div>
                    </div>
                    <div class="video_box_right">
                        <div class="separator">
                            {t c='global.message_opt'}:
                            <textarea name="message" cols="30" rows="8" id="share_message"></textarea>
                        </div>
                    </div>
                    <div class="clear"></div>
                    <div style="width: 100%; text-align: center; padding-bottom: 5px;">
                        <input name="submit_share" type="button" value=" {t c='game.send_share'} " id="send_share_game_{$game.GID}" class="button" />
                    </div>
                    </form>
                </div>
            </div>
        </div>
        {if isset($smarty.session.uid)}
        <div id="flag_game_box" style="display: none;">
            <div class="box">
                <div class="btitle"><h2>{t c='game.flag'}</h2></div>
                <div class="blink"><a href="#close_flag" id="close_flag">close</a></div>
                <div class="clear_right"></div>
                <div id="flag_game_response" class="posting" style="display: none;"></div>
                <div id="flag_game_form">
                    <div class="video_box_left">
                        <input name="flag_reason" type="radio" value="inappropriate" checked="yes" />&nbsp; {t c='flag.inappr'}<br />
                        <input name="flag_reason" type="radio" value="underage" />&nbsp; {t c='flag.underage'}<br />
                        <input name="flag_reason" type="radio" value="copyrighted" />&nbsp; {t c='flag.copyright'}<br />
                        <input name="flag_reason" type="radio" value="not_playing" />&nbsp; {t c='flag.not_playing'}<br />
                        <input name="flag_reason" type="radio" value="other" />&nbsp; {t c='flag.other'}<br />
                        <span id="flag_reason_error" class="font-11 font-bold" style="color: red; display: none;"></span>
                    </div>
                    <div class="video_box_right">
                        <div class="separator">
                            {t c='flag.reason'}:<br />
                            <textarea name="flag_message" cols="30" rows="4" id="flag_message"></textarea>
                        </div>
                    </div>
                    <div class="clear"></div>
                    <div style="width: 100%; text-align: center; padding-bottom: 5px;">
                        <input name="submit_flag" type="button" value=" {t c='game.send_flag'} " id="submit_flag_game_{$game.GID}" class="button" />
                    </div>
                </div>
            </div>
        </div>
        {/if}
        <div class="video_info">
            <div class="video_username">
                {t c='global.from'}: <a href="{$relative}/user/{$game.username}">{$game.username}</a><br />
            </div>
            <div class="video_views">
                {$game.total_plays} {if $game.total_plays == '1'}{t c='global.play'}{else}{t c='global.plays'}{/if}
            </div>
            <div class="clear"></div>
            <div class="video_tags" id="video_tags">
                {t c='menu.tags'}:
                {assign var='keywords' value=$game.tags}
                {section name=i loop=$keywords}
                <a href="{$relative}/search?search_query={$keywords[i]}&search_type=games">{$keywords[i]}</a>,
                {/section}
            </div>
            <div class="video_addtime">
                {insert name=time_range assign=addtime time=$game.addtime}
                {$addtime}
            </div>
            <div class="clear"></div>
			<div class="bookmarks">
			{literal}
<!-- AddThis Button BEGIN -->
<div class="addthis_toolbox">
<div class="custom_images">
<a class="addthis_button_twitter"><img src="{/literal}{$relative_tpl}{literal}/images/social/twitter_16.png" width="16" height="16" alt="Twitter" /></a>
<a class="addthis_button_facebook"><img src="{/literal}{$relative_tpl}{literal}/images/social/facebook_16.png" width="16" height="16" alt="Facebook" /></a>
<a class="addthis_button_buzz"><img src="{/literal}{$relative_tpl}{literal}/images/social/yahoobuzz_16.png" width="16" height="16" alt="Yahoo Buzz" /></a>
<a class="addthis_button_myspace"><img src="{/literal}{$relative_tpl}{literal}/images/social/myspace_16.png" width="16" height="16" alt="MySpace" /></a>
<a class="addthis_button_google"><img src="{/literal}{$relative_tpl}{literal}/images/social/google_16.png" width="16" height="16" alt="Google" /></a>
<a class="addthis_button_live"><img src="{/literal}{$relative_tpl}{literal}/images/social/windows_16.png" width="16" height="16" alt="Live" /></a>
<a class="addthis_button_stumbleupon"><img src="{/literal}{$relative_tpl}{literal}/images/social/stumbleupon_16.png" width="16" height="16" alt="StumbleUpon" /></a>
<a class="addthis_button_digg"><img src="{/literal}{$relative_tpl}{literal}/images/social/digg_alt_16.png" width="16" height="16" alt="Digg" /></a>
<a class="addthis_button_blogger"><img src="{/literal}{$relative_tpl}{literal}/images/social/blogger_16.png" width="16" height="16" alt="Blogger" /></a>
<a class="addthis_button_technorati"><img src="{/literal}{$relative_tpl}{literal}/images/social/technorati_16.png" width="16" height="16" alt="Technorati" /></a>
<a class="addthis_button_yahoobkm"><img src="{/literal}{$relative_tpl}{literal}/images/social/yahoo_16.png" width="16" height="16" alt="Yahoo" /></a>
<a class="addthis_button_favorites"><img src="{/literal}{$relative_tpl}{literal}/images/social/favorites_16.png" width="16" height="16" alt="Favorites" /></a>
</div>
</div>
<script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#username=avsbookmark"></script>
<!-- AddThis Button END -->
			{/literal}
			</div>
        </div>
    </div>
    <div class="right span-320">
        {insert name=adv assign=adv group='game_right'}
        {if $adv}<br /><div class="ads">{$adv}</div><br />{/if}
        {insert name=adv assign=adv group='game_right_second'}
        {if $adv}<br /><div class="ads">{$adv}</div><br />{/if}
    </div>
    <div class="clear"></div>
    <div class="box">
        <div class="bmenu">
            <div class="bmenul">
                <h2>
                    <a href="#related_games" id="show_related_games">{t c='game.related'} ({$games_total})</a> <strong>&middot;</strong>
                    <a href="#comments" id="show_comments">{t c='global.COMMENTS'} ({$comments_total})</a>
                </h2>
            </div>
            <div class="bmenur">
                <div class="center_related" style="display: none;"><img src="{$relative_tpl}/images/ajax_loader_bar.gif" alt="Ajax Loader" /></div>
            </div>
            <div class="clear"></div>
        </div>
        <div id="related_games">
            {if $games}
            <input name="current_page_related_games" type="hidden" value="1" id="current_page_related_games" />
            <div class="bar_space_related_left">
                <a href="#prev_related_games" id="prev_related_games_{$game.GID}" class="prev_bar_related" style="display: none;"></a>
            </div>
            <div id="related_games_container">
            {section name=i loop=$games}
            <div class="video_box_related">
                <a href="{$relative}/game/{$games[i].GID}/{$games[i].title|clean}"><span class="font-13 font-bold">{$games[i].title|truncate:20:' ...':true|escape:'html'}</span><br /><img src="{$relative}/media/games/tmb/{$games[i].GID}.jpg" title="{$games[i].title|escape:'html'}" alt="{$games[i].title|escape:'html'}" width="160" /><br />{if $games[i].type == 'private'}<img alt="" style="position: absolute; left: 0px; top: +15px; width: 160px; height: 120px;" src="{$relative_tpl}/images/{private type='game'}"/>{/if}</a>
                <div class="vbox_rel_left">
                    {insert name=time_range assign=addtime time=$games[i].addtime}
                    {$addtime}
                </div>
                <div class="vbox_rel_right">
                    {insert name=rating_small assign=game_rating rating=$games[i].rate}
                    {$game_rating}
                    <div class="clear_right"></div>
                    {$games[i].total_plays} {if $games[i].total_plays == '1'}{t c='global.play'}{else}{t c='global.plays'}{/if}
                </div>
                <div class="clear"></div>                                                                                                                                                                                                                                                                
            </div>
            {/section}
            </div>
            <div class="bar_space_related_right">
                <a href="#next_related_games" id="next_related_games_{$game.GID}" class="next_bar_related"></a>
            </div>
            <div class="clear"></div>
            {else}
            <div class="no_comments">{t c='game.related_none'}</div>
            {/if}
            <br />
        </div>
        <div id="game_comments" style="display: none;">
            {if isset($smarty.session.uid) && $game_comments == '1'}
            <div id="post_comment">
                <form name="postGameComment" id="postGameComment" method="post" action="#">
                    <textarea name="game_comment" id="game_comment" cols="100" rows="5" class="game_comment"></textarea>
                    <div id="post_message" class="post_message" style="display: none;">{t c='global.comment_empty'}</div>
                    <div class="action"><span id="chars_left">1000</span> {t c='global.chars_left'}</div>
                    <div class="action">
                        <input name="submit_comment" type="button" value=" {t c='global.post'} " id="post_game_comment_{$game.GID}" class="button" />
                    </div>
                    <div class="clear_left"></div>
                </form>
                <div id="game_response" class="response" style="display: none;"></div>
            </div>
            {/if}
            <div id="game_comments_{$game.GID}">
                <div class="blinkp">
                    {t c='global.showing'} <span>{$start_num}</span> {t c='global.to'} <span>{$end_num}</span> {t c='global.of'} <span>{$comments_total}</span> {t c='global.comments'}.
                </div>
                <div class="pagination"><ul>{$page_link_comments}</ul></div>
                <div id="comments_delimiter" style="display:none;"></div>
                {if $comments}
                {section name=i loop=$comments}
                <div id="game_comment_{$game.GID}_{$comments[i].CID}">
                <div id="delete_response_{$comments[i].CID}" class="response" style="display: none;"></div>
                    <div class="comment">
                        <div class="comment_left">
                            <a href="{$relative}/user/{$comments[i].username}"><img src="{$relative}/media/users/{if $comments[i].photo != ''}{$comments[i].photo}{else}nopic-{$comments[i].gender}.gif{/if}" width="60" title="{$comments[i].username}'s avatar" alt="{$comments[i].username}'s avatar" /></a>
                        </div>
                        <div class="comment_right_video">
                            <div class="comment_info_video">
                                {insert name=time_range assign=addtime time=$comments[i].addtime}
                                <a href="{$relative}/user/{$comments[i].username}">{$comments[i].username}</a>&nbsp;<strong>-</strong>&nbsp;<span class="font-10">{$addtime}</span>
                            </div>
                            <p class="comment_body_video">{$comments[i].comment|escape:'html'|nl2br}</p>
                            {if isset($smarty.session.uid)}
                            <div class="comment_actions_video">
                                {if $smarty.session.uid == $comments[i].UID}
                                <a href="#delete_comment" id="delete_comment_game_{$comments[i].CID}_{$game.GID}">{t c='global.delete'}</a> <strong>&middot;</strong>
                                {/if}
                                <span id="reported_spam_{$comments[i].CID}_{$game.GID}"><a href="#report_spam" id="report_spam_game_{$comments[i].CID}_{$game.GID}">{t c='global.report_spam'}</a></span>
                            </div>
                            {/if}
                        </div>
                        <div class="clear"></div>
                    </div>
                </div>
                {/section}
                <div class="pagination"><ul>{$page_link_comments_bottom}</ul></div>
                {else}
                <div class="no_comments">{t c='global.comments_none'}</div>
                {/if}
            </div>
            <br />
        </div>
    </div>
    <div class=" box span-100">
              <div class="btitle"><h2>{t c='global.sponsors'}</h2></div>
    {insert name=adv assign=adv group='game_bottom'}
    {if $adv}<br /><div class="ads">{$adv}</div><br />{/if}

    </div>
</div>
