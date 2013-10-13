<div id="content">
    <div class="left span-755">
        <div class="box">        
        <div class="btitle"><h2>{t c='user.DELETE_TITLE'}</h2></div>
            <br />
            <div id="simple_form">
                <form name="deleteAccount" id="deleteAccount" method="post" action="{$relative}/user/delete">
                <div class="separator">
                    <div class="delete_account">{t c='user.delete_expl'}</div>
                </div>
                <div class="separator">
                    <label for="delete" class="delete">Are you sure you want to delete your account?</label>
                    <input name="delete_yes" type="submit" value="{t c='global.yes'}" class="button" id="delete" />
                    <input name="delete_no" type="submit" value="{t c='global.back_to_profile'}" class="button" id="delete_no" />
                </div>
                <div class="separator">
                    <label for="confirm_delete" class="delete">&nbsp;</label>
                    <input name="confirm_delete" type="checkbox" id="confirm_delete" /> {t c='user.delete_confirm'}
                </div>
                </form>
            </div>
            <br />
        </div>
        <div class="box">
            <div class="btitle"><h2>{t c='global.sponsors'}</h2></div>
        </div>
    </div>
    <div class="right span-200">
        <div class="box">
            <div class="btitle"><h2>{t c='global.sponsors'}</h2></div>
        </div>
    </div>
    <div class="clear"></div>
</div>
