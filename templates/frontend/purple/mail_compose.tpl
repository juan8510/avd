<div id="content">
    <div class="left span-300">
        {include file='mail_menu.tpl'}
        {include file='user_info.tpl'}
    </div>
    <div class="right span-650">
        <div class="box">            
            <div class="btitle"><h2>{t c='mail.compose_title'}</h2></div>
            <div id="compose_message">
                <form name="compose_message_form" id="compose_message_form" method="post" action="{$relative}/mail/compose">
                    <br />
                    <div class="separator">
                        <label for="receiver">{t c='global.to'}: </label>
                        <input name="receiver" type="text" value="{$compose.receiver}" maxlength="15" id="receiver" /> or 
                        <select name="receiver_friend">
                            <option value="">{t c='mail.select_friend'}</option>
                            {section name=i loop=$friends}
                            <option value="{$friends[i].username}"{if $friends[i].username == $compose.friend} selected="yes"{/if}>{$friends[i].username|escape:'html'}</option>
                            {/section}
                        </select><br />
                        <span class="expl">{t c='mail.select_expl' s=$site_name}</span>
                    </div>
                    <div class="separator">
                        <label for="subject">Subject: </label>
                        <input name="subject" type="text" value="{$compose.subject}" id="subject" maxlength="99" class="large" />
                    </div>
                    <div class="separator">
                        <label for="body">{t c='global.message'}: </label>
                        <textarea name="body" id="body" cols="60" rows="10">{$compose.body}</textarea>
                    </div>
                    <div class="separator">
                        <label for="save_outbox">&nbsp;</label>
                        <input name="save_outbox" type="checkbox" id="save_outbox"{if $compose.save_outbox == '1'} checked="checked"{/if} /> {t c='mail.save_outbox'}
                    </div>
                    <div class="separator">
                        <label for="send_self">&nbsp;</label>
                        <input name="send_self" type="checkbox" id="send_self"{if $compose.send_self == '1'} checked="checked"{/if} /> {t c='mail.send_myself'}
                    </div>
                    <br />
                    <div class="separator">
                        <label for="send">&nbsp;</label>
                        <input name="send_mail" type="submit" value=" {t c='mail.send'} " id="send" class="button" />
                    </div>
                    <br />
                </form>
            </div>
        </div>
    </div>
    <div class="clear"></div>
</div>
