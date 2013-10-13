<div id="content">
    <div class="left span-300">
        {include file='user_info.tpl'}
    </div>
    <div class="right span-650">
        <div class="box">            
            <div class="btitle"><h2>{t c='blog.delete'}</h2></div>
            <br />
            <div id="simple_form">
                <form name="deleteBlogForm" id="deleteBlogForm" method="post" action="{$relative}/blog/delete/{$blog.BID}/{$blog.title|clean}">
                    <div class="separator">
                        <label for="delete" class="delete">{t c='blog.delete_confirm'}</label>
                        <input name="delete_yes" type="submit" value="{t c='global.yes'}" class="button" id="delete" />
                        <input name="delete_no" type="submit" value="{t c='global.no'}" class="button" id="delete_no" />
                    </div>
                </form>
            </div>
            <br />
        </div>
    </div>
    <div class="clear"></div>
</div>
