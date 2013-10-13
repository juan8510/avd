<div id="content">
    <div class="left span-300">
        {include file='mail_menu.tpl'}
        {include file='user_info.tpl'}
    </div>
    <div class="right span-650">
        <div class="box">            
            <div class="btitle"><h2>{t c='mail.reading'}: {$mail.subject|truncate:100:' ...':true|escape:'html'}</h2></div>
            <div class="mail_left">
                <a href="{$relative}/user/{$mail.sender}">{$mail.sender}<br />
                <img src="{$relative}/media/users/{if $mail.photo == ''}nopic-{$mail.gender}.gif{else}{$mail.photo}{/if}" alt="{$mail.sender}'s avatar" width="50" /></a>
            </div>
            <div class="mail_right">
                {$mail.body|escape:'html'}<br /><br />
                <a href="{$relative}/mail/compose/{$mail.sender}?s=Re: {$mail.subject|escape:urlpathinfo|escape:'html'}"><strong>Reply</strong></a>
            </div>
            <div class="clear"></div>
        </div>
    </div>
    <div class="clear"></div>
</div>
