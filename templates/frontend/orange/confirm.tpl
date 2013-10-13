<div id="content">
    <div class="left span-560">
        <div class="box">            
            <div class="btitle"><h2>{t c='confirm.title'}</h2></div>
            <div id="simple_form">
                {t c='confirm.expl'}.
                <br /><br />
                <form name="confirmEmailForm" id="confirmEmailForm" method="post" action="{$relative}/confirm">
                    <div class="separator">
                        <label for="confirm_email">{t c='global.email'}: </label>
                        <input name="email" type="text" value="" id="confirm_email" class="large" />
                    </div>
                    <br />
                    <div class="separator">
                        <label for="confirm_submit">&nbsp;</label>
                        <input name="submit_confirm" type="submit" value="{t c='confirm.send'}" id="confirm_submit" class="button">
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