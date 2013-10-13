<div id="content">
    <div class="left span-560">
        <div class="box">
            <div class="btitle"><h2>{t c='login.title' s=$site_name}</h2></div>
            <div id="login">
                <form name="login_form" id="login_form" method="post" action="{$relative}/login">
                    <div class="separator">
                        <label for="login_username">{t c='global.username'}:</label>
                        <input name="username" type="text" class="login" value="" id="login_username" />
                    </div>
                    <div class="separator">
                        <label for="login_password">{t c='global.password'}:</label>
                        <input name="password" type="password" class="login" value="" id="login_password" />
                    </div>
                    <div class="separator">
                        <label for="login_remember">&nbsp;</label>
                        <input name="login_remember" type="checkbox" id="login_remember" class="checkbox" />&nbsp;{t c='global.remember'}
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
            <br />
        </div>
    </div>
    <div class="right span-390">
        <div class="box">      
            <div class="btitle"><h2>{t c='global.what_is' s=$site_name}</h2></div>
            {include file='static/whatis.tpl'}
        </div>
    </div>
    <div class="clear"></div>
</div>