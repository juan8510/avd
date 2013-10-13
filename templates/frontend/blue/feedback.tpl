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
            <div class="btitle"><h2>{t c='feedback.title'}</h2></div>
            <div class="bexpl">
				{t c='feedback.expl' s=$site_name}
                <div id="simple_form">
                    <form name="contactUsForm" id="contactUsForm" method="post" action="{$relative}/feedback">
                    <div class="separator">
                        <label for="contact_option">{t c='feedback.department'}:</label>
                        <select name="department" id="contact_option">
                        <option value="General"{if $feedback.department == 'General'} selected="selected"{/if}>{t c='feedback.general'}</option>
                        <option value="Violations"{if $feedback.department == 'Violations'} selected="selected"{/if}>{t c='feedback.violations'}</option>
                        <option value="Advertising"{if $feedback.department == 'Advertising'} selected="selected"{/if}>{t c='feedback.advertising'}</option>
                        </select>
                    </div>
                    <div class="separator">
                        <label for="contact_email">{t c='global.email'}:</label>
                        <input name="email" type="text" value="{$feedback.email}" maxlength="100" id="contact_email" class="large" />
                    </div>
                    <div class="separator">
                        <label for="contact_name">{t c='global.name'}:</label>
                        <input name="name" type="text" value="{$feedback.name}" maxlength="100" id="contact_name" class="large" />
                    </div>
                    <div class="separator">
                        <label for="contact_message">{t c='global.message'}:</label>
                        <textarea name="message" id="contact_message" rows="5" cols="40">{$feedback.message}</textarea>
                    </div>
                    <br />
                    <div class="separator">
                        <label for="feedback_verification">{t c='global.verification'}:</label>
                        <input name="verification" type="text" value="" id="feedback_verification" />
                        <span class="font-9">{t c='global.verif_expl'}</span><br />
                        <img src="{$relative}/captcha" id="captcha_image" alt="Are you human?" /><br />
                        <span class="reload_contact"><a href="#reload_captcha" id="captcha_reload">{t c='global.verif_reload'}</a></span>
                    </div>
                    <br />
                    <div class="separator">
                        <label for="contact_submit">&nbsp;</label>
                        <input name="submit_feedback" type="submit" value=" {t c='global.send'} " id="contact_submit" class="button" />
                    </div>
                    </form>
                </div>
            </div>
            <br />
        </div>
    </div>
    <div class="right span-350">
        <div class="box">           
            <div class="btitle"><h2>{t c='faq.check'}</h2></div>
            <div class="binfo">{t c='faq.expl' s=$relative}</div>
            <br />
			<div class="clear"></div>
        </div>
        <div class="box">            
            <div class="btitle"><h2>{t c='global.what_is' s=$site_name}</h2></div>
            {include file='static/whatis.tpl'}
        </div>
    </div>
    <div class="clear"></div>
</div>