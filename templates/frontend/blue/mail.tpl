<div id="content">
    <div class="left span-300">
        {include file='mail_menu.tpl'}
        {include file='user_info.tpl'}
    </div>
    <div class="right span-650">
        <div class="box">            
            <div class="btitle"><h2>{$folder|upper}</h2></div>
            <div class="blinkp">
                {t c='global.showing'} <strong>{$start_num}</strong> {t c='global.to'} <strong>{$end_num}</strong> {t c='global.of'} <strong>{$total_mails}</strong> {t c='global.messages'}.
            </div>
            <br />
            <div id="mail">
                <table cellspacing="2" cellpadding="3">
                <tr class="legend">
                    <td width="5%">{t c='global.status'}</td>
                    <td width="25%">{t c='global.sender'}</td>                                        
                    <td width="40%">{t c='global.subject'}</td>
                    <td>{t c='global.date'}</td>
                    <td>{t c='global.delete'}</td>
                </tr>
                {if $mails}
                {section name=i loop=$mails}
                <tr class="{cycle values='light,dark'}">
                    <td width="5%" align="center" valign="top"><img src="{$relative_tpl}/images/{if $mails[i].readed == '1'}email_open.png{else}email.png{/if}" /></td>
                    <td width="25%" align="center">
                        <a href="{$relative}/user/{$mails[i].sender}"><strong>{$mails[i].sender}</strong></a><br />
                        <a href="{$relative}/user/{$mails[i].sender}"><img src="{$relative}/media/users/{if $mails[i].photo == ''}nopic-{$mails[i].gender}.gif{else}{$mails[i].photo}{/if}" width="50" alt="{$mails[i].sender}" /></a>
                    </td>
                    <td width="40%" align="center" valign="top">
                        <a href="{$relative}/mail/read?id={$mails[i].mail_id}">{$mails[i].subject|truncate:35:' ...':true|escape:'html'}</a>
                    </td>
                    <td align="center">{$mails[i].send_date|date_format:"%A, %B %e, %Y"}</td>
                    <td align="center">
                        <a href="{$relative}/mail/{$folder}?delete={$mails[i].mail_id}">{t c='global.delete'}</a>
                    </td>
                </tr>
                {/section}
                {else}
                <tr>
                    <td colspan="4" align="center">{t c='mail.none'}!</td>
                </tr>
                {/if}
                </table>
            </div>
            <br />
        </div>
    </div>
    <div class="clear"></div>
</div>
