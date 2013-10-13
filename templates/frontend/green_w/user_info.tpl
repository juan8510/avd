<script type="text/javascript">
var lang_posting = "{t c='global.posting'}";
var lang_removing = "{t c='global.removing'}";
var lang_blocking = "{t c='global.blocking'}";
var lang_unblocking = "{t c='global.unblocking'}";
var lang_block = "{t c='user.block'}";
var lang_unblock = "{t c='user.unblock'}";
var lang_friend_msg = "{t c='ajax.invite_friend_msg_length'}";
var lang_friendship = "{t c='ajax.invite_friend_friendship'}";
var lang_thanks = "{t c='rate.thanks'}";
var lang_lame = "{t c='rate.lame'}";
var lang_bleh = "{t c='rate.bleh'}";
var lang_alright = "{t c='rate.alright'}";
var lang_good = "{t c='rate.good'}";
var lang_awesome = "{t c='rate.awesome'}";
var lang_remove_friend_ask = "{t c='ajax.remove_friend_ask'}";
var lang_remove_fav_game_ask = "{t c='ajax.remove_fav_game_ask'}";
var lang_remove_fav_video_ask = "{t c='ajax.remove_fav_video_ask'}";
var lang_remove_fav_photo_ask = "{t c='ajax.remove_fav_photo_ask'}";
var lang_remove_playlist_ask = "{t c='ajax.remove_playlist_ask'}";
var lang_report_user_msg_length = "{t c='ajax.report_user_msg_length'}";
var lang_subscribing = "{t c='global.subscribing'}";
var lang_unsubscribe = "{t c='user.unsubscribe'}";
var lang_unsubscribing = "{t c='global.unsubscribing'}";
var lang_subscribe = "{t c='user.subscribe'}";
var lang_wall_length = "{t c='ajax.wall_comment_length'}";
</script>
<script type="text/javascript" src="{$relative_tpl}/js/jquery.profile-0.2.js"></script>
        <div class="box">
            <div class="btitle"><h2>{t c='user.quick_jumps'}</h2></div>
            <ul class="quick-links">
                <li><a href="{$relative}/user/{$username}">{t c='user.profile'}</a></li>		
                {if $blog_module == '1'}<li><a href="{$relative}/user/{$username}/blog">{t c='global.blog'}</a></li>{/if}
                {if $photo_module == '1'}<li><a href="{$relative}/user/{$username}/albums">{t c='user.photo_albums'}</a></li>{/if}
                <li><a href="{$relative}/user/{$username}/playlist">{t c='user.playlist'}</a></li>                                
                <li><a href="{$relative}/user/{$username}/videos/public">{t c='global.public'} {t c='global.videos'}</a></li>
                <li><a href="{$relative}/user/{$username}/videos/private">{t c='global.private'} {t c='global.videos'}</a></li>
                <li><a href="{$relative}/user/{$username}/favorite/videos">{t c='global.favorite'} {t c='global.videos'}</a></li>
				<li><a href="{$relative}/user/{$username}/favorite/photos">{t c='global.favorite'} {t c='global.photos'}</a></li>
				<li><a href="{$relative}/user/{$username}/favorite/games">{t c='global.favorite'} {t c='global.games'}</a></li>
                <li><a href="{$relative}/user/{$username}/wall">{t c='user.wall'}</a></li>                
                <li><a href="{$relative}/user/{$username}/friends">{t c='user.friends'}</a></li>
                <li><a href="{$relative}/user/{$username}/subscribers">{t c='user.subscribers'}</a></li>
                <li><a href="{$relative}/user/{$username}/subscriptions">{t c='user.subscriptions'}</a></li>
                {if isset($smarty.session.uid) && $smarty.session.uid == $user.UID}
                <li><a href="{$relative}/mail">{t c='global.inbox'}</a></li>
                {/if}
            </ul>
            <div class="clear_left"></div>
        </div>
        <div class="box">    
            <div class="btitle"><h2>{$username|upper} {t c='user.PROFILE'}</h2></div>
            {if $smarty.session.username == $username}
            <div class="blinkp">
                &nbsp;&nbsp;<a href = "{$relative}/user/edit">{t c='user.edit_profile'}</a> <strong>&middot;</strong>
                <a href = "{$relative}/user/avatar">{t c='user.change_avatar'}</a>                              
            </div>
            {/if}
            <div class="clear_left"></div>
            <div class="profile_avatar">
                <input name="current_rating_user" type="hidden" value="{$user.rate}" id="current_user_rating" />
                <a href="{$relative}/user/{$username}">
                    <img src="{$relative}/media/users/{if $user.photo != ''}{$user.photo}{else}nopic-{$user.gender}.gif{/if}" title="{$user.username}'s avatar" alt="{$user.username}'s avatar" />
                </a>
                <div id="rating_user">
                    {insert name=user_rating assign=user_rating rating=$user.rate ratedby=$user.ratedby UID=$user.UID}
                    {$user_rating}
                </div>
                <div class="clear_left"></div>
                <div id="rating_text_user">
                    {$user.ratedby} {if $user.ratedby == '1'}{t c='global.rating'}{else}{t c='global.ratings'}{/if}
                </div>
            </div>
            <div class="profile_info">
            <ul class="profile_info">
                <li><a href="{$relative}/user/{$user.username}">{$user.username}</a></li>
                <li>{t c='user.popularity'}: <span class="grey">{$user.popularity} {if $user.popularity == '1'}{t c='global.point'}{else}{t c='global.points'}{/if}</span></li>
                <li>{t c='user.activity'}: <span class="grey">{$user.points} {if $user.points == '1'}{t c='global.point'}{else}{t c='global.points'}{/if}</span></li>
                {insert name=age assign=age bdate=$user.bdate}
                {if $age != ''}<li>{t c='user.age'}: <span class="grey">{$age}</span></li>{/if}
                <li>{t c='global.gender'}: <span class="grey">{if $user.gender == 'Male'}{t c='global.male'}{else}{t c='global.female'}{/if}</span></li>
                {if $user.relation != ''}<li>{t c='user.relation'}: <span class="grey">{$user.relation}</span></li>{/if}
                {if $user.interested != ''}<li>{t c='global.interested'}: <span class="grey">{$user.interested}</span></li>{/if}
                {insert name=time_range assign=joined time=$user.addtime}
                <li>{t c='user.joined'}: <span class="grey">{$joined}</span></li>
                {insert name=time_range assign=last_login time=$user.logintime}
                <li>{t c='user.last_login'}: <span class="grey">{$last_login}</span></li>
                <li>{t c='user.profile_viewed'}: <span class="grey">{$user.profile_viewed} {if $user.profile_viewed == '1'}{t c=global.time'}{else}{t c='global.times'}{/if}</span></li>
                <li>{t c='user.has_watched'}: <span class="grey">{$user.watched_video} {if $user.watched_video == '1'}{t c='global.video'}{else}{t c='videos.videos'}{/if}</span></li>
                <li>{t c='user.video_watch' s=$user.username}: <span class="grey">{$user.video_viewed} {if $user.video_viewed == '1'}{t c='global.time'}{else}{t c='global.times'}{/if}</span></li>
            </ul>
            <div class="clear_left"></div>
            </div>
            <div class="clear"></div>
        </div>
        <div class="box">
      		<div class="btitle"><h2>{t c='user.CONTACT'} {$username|upper}</h2></div>
      		<div class="user_actions">
          		<ul>
                {insert name=is_blocked assign=is_blocked UID=$smarty.session.uid BID=$user.UID}
                {if !$is_blocked}
                {insert name=is_friend assign=is_friend UID=$smarty.session.uid FID=$user.UID}
                {if $is_friend}
                <li id="remove_friend"><a href="#remove_friend" id="remove_from_friends_{$user.UID}">{t c='user.remove_friend'}</a></li>
				{if $private_msgs == 'friends'}
                <li id="send_message"><a href="{$relative}/mail/compose/{$user.username}">{t c='user.send_message'}</a></li>
				{/if}
                {else}
                <li id="add_friend"><a href="#invite_friend" id="invite_as_friend_{$user.UID}">{t c='user.add_friend'}</a></li>
                {/if}
                {/if}
				{if $private_msgs == 'all'}
				<li id="send_message"><a href="{$relative}/mail/compose/{$user.username}">{t c='user.send_message'}</a></li>
				{/if}
                {insert name=is_subscribed assign=is_subscribed SUID=$smarty.session.uid UID=$user.UID}
                {if $is_subscribed}
                <li id="handle_subscription"><a href="#unsubscribe_user" id="unsubscribe_from_{$user.UID}">{t c='user.unsubscribe'}</a></li>
                {else}
                <li id="handle_subscription"><a href="#subscribe_user" id="subscribe_to_{$user.UID}">{t c='user.subscribe'}</a></li>
                {/if}
                <li id="report_user"><a href="#report_user" id="open_report_user">{t c='user.report'}</a></li>
                {if $is_blocked}
                <li id="block_user"><a href="#unblock_user" id="remove_block_{$user.UID}">{t c='user.unblock'}</a></li>
                {else}
                <li id="block_user"><a href="#block_user" id="add_block_{$user.UID}">{t c='user.block'}</a></li>
                {/if}
          		</ul>
          		<div class="clear_left"></div>
      		</div>
      		<div id="user_message" class="posting" style="display:none;"></div>
      		<div id="invite_message" style="display: none;">
          		<input name="owner_id" type="hidden" value="{$user.UID}" id="user_id" />
          		<div class="invite_header">
              		<div class="invite_left">{t c='user.add_friend'}</div>
              		<div class="invite_right"><a href="#close_invite_message" id="close_invite_message">{t c='global.close'}</a></div>
              		<div class="clear"></div>
          		</div>
          		<br />
          		<span>{t c='global.message_opt'}:</span><br />
          		<textarea name="invite_friend_message" id="invite_friend_message" rows="5" cols="10"></textarea>
          		<div id="invite_friend_error" class="invite_error" style="display: none;"></div>
          		<div class="submit_box">
              		<input name="send_friend_invite" type="button" value="{t c='user.send_invite'}" id="send_friend_invite" class="button" />
          		</div>
      		</div>
      		<div id="report_message" style="display: none;">        
          		<div class="invite_header">
              		<div class="invite_left">{t c='user.report'}</div>
              		<div class="invite_right"><a href="#close_report_user" id="close_report_message">{t c='global.close'}</a></div>
              		<div class="clear"></div>
          		</div>
          		<br />
          		<input name="report_reason" value="offensive" id="report_reason_1" type="radio" class="radio" checked="checked" /> {t c='flag.offensive'}<br />
          		<input name="report_reason" value="underage" id="report_reason_2" type="radio" class="radio" /> {t c='flag.underage'}<br />
          		<input name="report_reason" value="spammer" id="report_reason_3" type="radio" class="radio" /> {t c='flag.spammer'}<br />
          		<input name="report_reason" value="other" id="report_reason_4" type="radio" class="radio" /> {t c='flag.other'}<br />
          		<div id="other_message" style="display: none;">
              		<br />
              		<span>{t c='global.message_opt'}:</span><br />
              		<textarea name="other_reason" id="other_reason" rows="5" cols="10"></textarea><br />
          		</div>
          		<br />
          		<div class="submit_box">
              		<input name="send_report_user" type="button" value="{t c='user.flag_user'}" id="send_flag_user_{$user.UID}" class="button" />
          		</div>
      		</div>
			<div class="clear"></div>
		</div>
        <div class="box">            
            <div class="btitle"><h2>{t c='user.MORE_INFO'} {$username}</h2></div>
            <ul class="user_info">
                {if isset($user.aboutme) && $user.aboutme != ''}
                <li>{t c='global.about_me'}: <span class="grey">{$user.aboutme}</span></li>
                {/if}
                {if isset($user.country) && $user.country != ''}
                <li>{t c='global.country'}: <span class="grey">{$user.country}</span></li>
                {/if}
                {if isset($user.town) && $user.town != ''}
                <li>{t c='global.hometown'}: <span class="grey">{$user.town}</span></li>
                {/if}
                {if isset($user.city) && $user.city != ''}
                <li>{t c='global.city'}: <span class="grey">{$user.city}</span></li>
                {/if}
                {if isset($user.school) && $user.school != ''}
                <li>{t c='global.school'}: <span class="grey">{$user.school}</span></li>
                {/if}
                {if isset($user.occupation) && $user.occupation != ''}
                <li>{t c='global.job'}: <span class="grey">{$user.occupation}</span></li>
                {/if}
                {if isset($user.interest_hobby) && $user.interest_hobby != ''}
                <li>{t c='global.here_for'}: <span class="grey">{$user.interest_hobby}</span></li>
                {/if}
                {if isset($user.fav_movie_show) && $user.fav_movie_show != ''}
                <li>{t c='user.favorite_sex'}: <span class="grey">{$user.fav_movie_show}</span></li>
                {/if}
                {if isset($user.fav_music) && $user.fav_music != ''}
                <li>{t c='user.favorite_sex_partner'}: <span class="grey">{$user.fav_music}</span></li>
                {/if}
                {if isset($user.fav_book) && $user.fav_book != ''}
                <li>{t c='user.my_erogenic_zones'}: <span class="grey">{$user.fav_book}</span></li>
                {/if}
                {if isset($user.turnon) && $user.turnon != ''}
                <li>{t c='user.turn_on'}: <span class="grey">{$user.turnon}</span></li>
                {/if}
                {if isset($user.turnoff) && $user.turnoff != ''}
                <li>{t c='user.turn_off'}: <span class="grey">{$user.turnoff}</span></li>
                {/if}
                {if isset($user.interested) && $user.interested != ''}
                <li>{t c='global.interested'}: <span class="grey">{$user.interested}</span></li>
                {/if}
            </ul>
            <br />
        </div>