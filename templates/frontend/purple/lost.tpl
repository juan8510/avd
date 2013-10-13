<div id="content">
    <div class="left span-560">
        <div class="box">            
            <div class="btitle"><h2>{t c='lost.title'}</h2></div>
            <div id="simple_form">
                {t c='confirm.expl'}
                <br /><br />
                <form name="lost_password_form" id="lost_password_form" method="post" action="{$relative}/lost">
                    <div class="separator">
                        <label for="lost_email">{t c='global.email'}: </label>
                        <input name="email" type="text" value="" id="lost_email" class="large" />
                    </div>
                    <br />
                    <div class="separator">
                        <label for="lost_submit">&nbsp;</label>
                        <input name="submit_lost" type="submit" value=" {t c='lost.send'} " id="lost_submit" class="button">
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