<div id="content">
    {literal}
    <script type="text/javascript">
        $(document).ready(function(){
            $("#captcha_reload").click(function(event){
                event.preventDefault();
                $("#captcha_image").attr('src', "{/literal}{$relative}{literal}/captcha" + '/' + Math.random());
            });
        });
    </script>
    {/literal}                                                    
    <div class="left span-600">
        <div class="box">            
            <div class="btitle"><h2>{t c='invite.title'}</h2></div>
            <div class="bexpl">
                <strong>{t c='invite.expl'}</strong>
                <div id="simple_form">
                    <form name="inviteFriendsForm" id="inviteFriendsForm" method="post" action="{$relative}/invite">
                    <div class="separator">
                        <label for="friend_1">{t c='global.friend'} {t c='global.one'}:</label>
                        <input name="friend_1" type="text" value="{$emails[0]}" id="friend_1" class="large" />
                    </div>
                    <div class="separator">
                        <label for="friend_2">{t c='global.friend'} {t c='global.two'}:</label>
                        <input name="friend_2" type="text" value="{$emails[1]}" id="friend_2" class="large" />
                    </div>
                    <div class="separator">
                        <label for="friend_3">{t c='global.friend'} {t c='global.three'}:</label>
                        <input name="friend_3" type="text" value="{$emails[2]}" id="friend_3" class="large" />
                    </div>
                    <div class="separator">
                        <label for="friend_4">{t c='global.friend'} {t c='global.four'}:</label>
                        <input name="friend_4" type="text" value="{$emails[3]}" id="friend_4" class="large" />
                    </div>
                    <div class="separator">
                        <label for="friend_5">{t c='global.friend'} {t c='global.five'}:</label>
                        <input name="friend_5" type="text" value="{$emails[4]}" id="friend_5" class="large" />
                    </div>
                    <div class="separator">
                        <label for="invite_name">{t c='global.name'}:</label>
                        <input name="name" type="text" value="{$invite.name}" id="invite_name" class="large" />
                    </div>
                    <div class="separator">
                        <label for="invite_friends_message">{t c='global.message'}:</label>
                        <textarea name="message" id="invite_friends_message" rows="5" cols="40">{$invite.message}</textarea>
                    </div>
                    <br />
                    <div class="separator">
                        <label for="invite_verification">{t c='global.verification'}:</label>
                        <input name="verification" type="text" value="" id="invite_verification" />
                        <span class="font-9">{t c='global.verif_expl'}</span><br />
                        <img src="{$relative}/captcha" id="captcha_image" alt="Are you human?" /><br />
                        <span class="reload_contact"><a href="#reload_captcha" id="captcha_reload">{t c='global.verif_reload'}</a></span>
                    </div>
                    <br />
                    <div class="separator">
                        <label for="invite_submit">&nbsp;</label>
                        <input name="submit_invite" type="submit" value=" {t c='invite.send'} " id="invite_submit" class="button" />
                    </div>
                    </form>
                </div>
            </div>
            <br />
        </div>
    </div>
    <div class="right span-350">
        <div class="box">
            <div class="btitle"><h2>{t c='global.what_is' s=$site_name}</h2></div>
            {include file='static/whatis.tpl'}
        </div>
    </div>
    <div class="clear"></div>
</div>