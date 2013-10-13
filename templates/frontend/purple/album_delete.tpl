<div id="content">
    <div class="left span-300">
        {include file='user_info.tpl'}
    </div>
    <div class="right span-650">
        <div class="box">            
            <div class="btitle"><h2>{t c='global.delete'}: {$album.name|upper}</h2></div>
            <br />
            <div id="simple_form">
                <form name="deleteAccount" id="deleteAccount" method="post" action="{$relative}/album/delete/{$album.AID}">
                <div class="separator">
                    <div class="delete_account">{t c='album.delete_expl'}</div>
                </div>
                <div class="separator">
                    <label for="delete" class="delete">{t c='album.delete_ask'}</label>
                    <input name="delete_yes" type="submit" value="{t c='global.yes'}" class="button" id="delete" />
                    <input name="delete_no" type="submit" value="{t c='global.no'}! {t c='global.back_to_profile'}!" class="button" id="delete_no" />
                </div>
                <div class="separator">
                    <label for="confirm_delete" class="delete">&nbsp;</label>
                    <input name="confirm_delete" type="checkbox" id="confirm_delete" /> {t c='global.confirm_delete'}!
                </div>
                </form>
            </div>
            <br />
        </div>
    </div>
    <div class="clear"></div>
</div>
