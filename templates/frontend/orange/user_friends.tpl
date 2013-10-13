<div id="content">
    <div class="left span-300">
        {include file='user_info.tpl'}
    </div>
    <div class="right span-650">
          <div class="box">
              <div class="btitle"><h2>{$username|upper} {t c='user.FRIENDS'}</h2></div>
              <div class="bsubmenu">
				  <div class="bsubmenul">
	              &nbsp;{if $order == 'invite_date'}{t c='user.recent_friends'}{else}<a href="{url base="user/`$username`/friends" strip='o' value='invite_date'}">{t c='user.recent_friends'}</a>{/if} <strong>&middot;</strong>
	              {if $order == 'recent_users'}{t c='user.recent_users'}{else}<a href="{url base="user/`$username`/friends" strip='o' value='recent_users'}">{t c='user.recent_users'}</a>{/if} <strong>&middot;</strong>
	              {if $order == 'recent_logins'}{t c='user.recent_logins'}{else}<a href="{url base="user/`$username`/friends" strip='o' value='recent_logins'}">{t c='user.recent_logins'}</a>{/if} <strong>&middot;</strong>
	              {if $order == 'username'}{t c='global.username'}{else}<a href="{url base="user/`$username`/friends" strip='o' value='username'}">{t c='global.username'}</a>{/if}
				  </div>
				  <div class="bsubmenur">&nbsp;</div>
				  <div class="clear"></div>
              </div>
              {if $friends}
              <div class="blinkp">&nbsp;{t c='global.showing'} <strong>{$start_num}</strong> {t c='global.to'} <strong>{$end_num}</strong> {t c='global.of'} <strong>{$friends_total}</strong> {t c='global.friends'}.</div>
			  <div id="remove_friend_message" class="posting" style="display:none"></div>
              {section name=i loop=$friends}
              <div id="friend_{$friends[i].FID}" class="user-box">
                  <a href="{$relative}/user/{$friends[i].username}"><img src="{$relative}/media/users/{if $friends[i].photo == ''}nopic-{$friends[i].gender}.gif{else}{$friends[i].photo}{/if}" alt="{$friends[i].username}'s avatar" /><br /><span class="font-12">{$friends[i].username|escape:'html'}</span></a><br />
            	  {if isset($smarty.session.uid) && $smarty.session.uid == $user.UID}
            	  <div class="user-box-remove">
            		  <a href="#remove_friend" id="remove_profile_friend_{$friends[i].FID}" class="remove">{t c='global.remove'}</a>
            	  </div>
				  {/if}
			  </div>
              {/section}
              <br />
              <div class="clear_left"></div>
              <div class="pagination"><ul>{$page_link}</ul></div><br />
              {else}
              <p>&nbsp;&nbsp;&nbsp;{t c='user.friends_none'}</p>
              {/if}
          </div>
    </div>
    <div class="clear"></div>
</div>
