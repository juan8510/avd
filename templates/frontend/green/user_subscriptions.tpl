<div id="content">
    <div class="left span-300">
        {include file='user_info.tpl'}
    </div>
    <div class="right span-650">
          <div class="box">              
              <div class="btitle"><h2>{$username|upper} {t c='user.SUBSCRIPTIONS'}</h2></div>
              <div class="bsubmenu">
				  <div class="bsubmenul">
	              &nbsp;{if $order == 'subscribe_date'}{t c='user.recent_subscriptions'}{else}<a href="{url base="user/`$username`/subscriptions" strip='o' value='subscribe_date'}">{t c='user.recent_subscriptions'}</a>{/if} <strong>&middot;</strong>
              	  {if $order == 'recent_users'}{t c='user.recent_users'}{else}<a href="{url base="user/`$username`/subscriptions" strip='o' value='recent_users'}">{t c='user.recent_users'}</a>{/if} <strong>&middot;</strong>
              	  {if $order == 'recent_logins'}{t c='user.recent_logins'}{else}<a href="{url base="user/`$username`/subscriptions" strip='o' value='recent_logins'}">{t c='user.recent_logins'}</a>{/if} <strong>&middot;</strong>
                  {if $order == 'username'}{t c='global.username'}{else}<a href="{url base="user/`$username`/subscriptions" strip='o' value='username'}">{t c='global.username'}</a>{/if}
				  </div>
				  <div class="bsubmenur">&nbsp;</div>
				  <div class="clear"></div>
              </div>
              {if $subscriptions}
              <div class="blinkp">&nbsp;{t c='global.showing'} <strong>{$start_num}</strong> {t c='global.to'} <strong>{$end_num}</strong> {t c='global.of'} <strong>{$subscriptions_total}</strong> {t c='user.subscriptions'}.</div>
			  <div id="remove_subscription_message" class="posting" style="display:none"></div>
              {section name=i loop=$subscriptions}
              <div id="subscription_{$subscriptions[i].UID}" class="user-box">
                  <a href="{$relative}/user/{$subscriptions[i].username}"><img src="{$relative}/media/users/{if $subscriptions[i].photo == ''}nopic-{$subscriptions[i].gender}.gif{else}{$subscriptions[i].photo}{/if}" alt="{$subscriptions[i].username}'s avatar" /><br /><span class="font-12">{$subscriptions[i].username|escape:'html'}</span></a><br />
				  {if isset($smarty.session.uid) && $smarty.session.uid == $user.UID}
                  <div class="user-box-remove">
                      <a href="#remove_subscription" id="remove_subscription_{$subscriptions[i].UID}" class="remove">{t c='global.remove'}</a>
                  </div>
                  {/if}				  
              </div>                                                      
              {/section}
              <br />
              <div class="clear_left"></div>
              <div class="pagination"><ul>{$page_link}</ul></div><br />
              {else}
              <p>&nbsp;&nbsp;&nbsp;{t c='user.subscriptions_none'}</p>
              {/if}
          </div>
    </div>
    <div class="clear"></div>
</div>
