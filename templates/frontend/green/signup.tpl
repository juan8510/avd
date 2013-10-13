<div id="content">
    <script type="text/javascript" src="{$relative_tpl}/js/jquery.signup-0.1.js"></script>
    <div class="left span-560">
        <div class="box">            
            <div class="btitle"><h2>{t c='signup.title' s=$site_name}</h2></div>
            <div id="signup">
                <form name="signup_form" id="signup_form" method="post" action="{$relative}/signup">
                    <div class="separator">
                        <label for="signup_username">{t c='global.username'}:</label>
                        <input name="username" type="text" value="{$signup.username}" id="signup_username" />
                        &nbsp;<span class="font-11"><strong><a href="#check_username" id="check_username">{t c='signup.check'}</a></strong></span>
                        <div id="username_check_response" style="display:none;"></div>
                        <div id="check_username_result" style="display: none;"></div>
                    </div>
                    <div class="separator">
                        <label for="signup_password">{t c='global.password'}:</label>
                        <input name="password" type="password" value="" id="signup_password" />
                    </div>
                    <div class="separator">
                        <label for="signup_password_confirm">{t c='global.password_confirm'}:</label>
                        <input name="password_confirm" type="password" value="" id="signup_password_confirm" />
                    </div>
                    <div class="separator">
                        <label for="signup_email">{t c='global.email'}:</label>
                        <input name="email" type="text" value="{$signup.email}" id="signup_email" class="large" /><br />
                    </div>
                    <div class="separator">
                        <label for="signup_gender_male">{t c='global.gender'}:</label>
                        <input name="gender" type="radio" value="Male" class="radio" id="signup_gender_male"{if $signup.gender == 'Male'} checked="checked"{/if} />{t c='global.male'}
                        <input name="gender" type="radio" value="Female" class="radio" id="signup_gender_female"{if $signup.gender == 'Female'} checked="checked"{/if} />{t c='global.female'}
                    </div>
                    {if $captcha == '1'}
                    <br />
                    <div class="separator">
                        <label for="signup_verification">{t c='global.verification'}:</label>
                        <input name="verification" type="text" value="" id="signup_verification" />
						<span class="font-9">{t c='global.verif_expl'}!</span><br />
                        <img src="{$relative}/captcha" id="captcha_image" alt="Are you human?" />
                        <span class="reload"><a href="#reload_captcha" id="captcha_reload">{t c='global.verif_reload'}</a></span>
                    </div>
                    {/if}
                    <br />
                    <div class="separator">
                        <label for="signup_age">&nbsp;</label>
                        <input name="age" type="checkbox" id="signup_age"{if $signup.age == 'on'} checked="checked"{/if} class="checkbox" />&nbsp;{t c='signup.certify'}
                    </div>
                    <div class="separator">
                        <label for="signup_certify">&nbsp;</label>
                        <input name="terms" type="checkbox" id="signup_certify"{if $signup.terms == 'on'} checked="checked"{/if} class="checkbox" />&nbsp;{t c='signup.terms' u=$baseurl v=$baseurl}
                    </div>
                    <br />
                    <div class="separator">
                        <label for="submit_signup">&nbsp;</label>
                        <input name="submit_signup" type="submit" value="{t c='global.sign_up'}" id="submit_signup" class="button" />
                    </div>
                </form>
            </div>
            <br />
        </div>
    </div>
    <div class="right span-390">
        <div class="box">
            <div class="btitle"><h2>{t c='signup.login'}</h2></div>
            <div id="login">
                <form name="login_form" id="login_form" method="post" action="{$relative}/login">
                    <div class="separator">
                        <label for="login_username">{t c='global.username'}:</label>
                        <input name="username" type="text" value="{$username}" id="login_username" class="login"  />
                    </div>
                    <div class="separator">
                        <label for="login_password">{t c='global.password'}:</label>
                        <input name="password" type="password" value="" id="login_password" class="login" />
                    </div>
                    <div class="separator">
                        <label for="login_remember">&nbsp;</label>
                        <input name="age" type="checkbox" id="login_remember" class="checkbox" />&nbsp;{t c='global.remember'}
                    </div>
                    <br />
                    <div class="separator">
                        <label for="lost_password">&nbsp;</label>
                        <a href="{$relative}/lost" rel="nofollow" id="lost_password">{t c='global.forgot'}</a>
                    </div>
                    <div class="separator">
                        <label for="confirmation_email">&nbsp;</label>
                        <a href="{$relative}/confirm" rel="nofollow" id="confirmation_email">{t c='global.confirm'}</a>
                    </div>                    
                    <br />
                    <div class="separator">
                        <label for="login_submit">&nbsp;</label>
                        <input name="submit_login" type="submit" value="{t c='global.login'}" id="login_submit" class="button" />
                    </div>
                </form>
            </div>
        </div>
        <div class="box">
            <div class="btitle"><h2>{t c='global.what_is' s=$site_name}</h2></div>
            {include file='static/whatis.tpl'}
        </div>
    </div>
    <div class="clear"></div>
</div>
