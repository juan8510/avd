<div id="content">
    <div class="left span-300">
        {include file='user_info.tpl'}
    </div>
    <div class="right span-650">
          <div class="box">              
              <div class="btitle"><h2>{$username|upper} {t c='user.SUBSCRIBERS'}</h2></div>
              <div class="blinkp">
              &nbsp;{if $order == 'subscribe_date'}{t c='user.recent_subscribers'}{else}<a href="{url base="user/`$username`/subscribers" strip='o' value='subscribe_date'}">{t c='user.recent_subscribers'}</a>{/if} <strong>&middot;</strong>
              {if $order == 'recent_users'}{t c='user.recent_users'}{else}<a href="{url base="user/`$username`/subscribers" strip='o' value='recent_users'}">{t c='user.recent_users'}</a>{/if} <strong>&middot;</strong>
              {if $order == 'recent_logins'}{t c='user.recent_logins'}{else}<a href="{url base="user/`$username`/subscribers" strip='o' value='recent_logins'}">{t c='user.recent_logins'}</a>{/if} <strong>&middot;</strong>
              {if $order == 'username'}{t c='global.username'}{else}<a href="{url base="user/`$username`/subscribers" strip='o' value='username'}">{t c='global.username'}</a>{/if}
              </div>
              {if $subscribers}
              <div class="blinkp">&nbsp;{t c='global.showing'} <strong>{$start_num}</strong> {t c='global.to'} <strong>{$end_num}</strong> {t c='global.of'} <strong>{$subscribers_total}</strong> {t c='user.subscribers'}.</div>
			  <div id="remove_subscriber_message" class="posting" style="display:none"></div>
              {section name=i loop=$subscribers}
              <div id="subscriber_{$subscribers[i].UID}" class="user-box">
                  <a href="{$relative}/user/{$subscribers[i].username}"><img src="{$relative}/media/users/{if $subscribers[i].photo == ''}nopic-{$subscribers[i].gender}.gif{else}{$subscribers[i].photo}{/if}" alt="{$subscribers[i].username}'s avatar" /><br /><span class="font-12">{$subscribers[i].username|escape:'html'}</span></a><br />
                  {if isset($smarty.session.uid) && $smarty.session.uid == $user.UID}
                  <div class="user-box-remove">
                      <a href="#remove_subscriber" id="remove_subscriber_{$subscribers[i].UID}" class="remove">{t c='global.remove'}</a>
                  </div>
                  {/if}				  
              </div>                                                      
              {/section}
              <br />
              <div class="clear_left"></div>
              <div class="pagination"><ul>{$page_link}</ul></div><br />
              {else}
              <p>&nbsp;&nbsp;&nbsp;{t c='user.subscribers_none'}</p>
              {/if}
          </div>
    </div>
    <div class="clear"></div>
</div>
