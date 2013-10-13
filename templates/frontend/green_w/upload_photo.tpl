<script type="text/javascript">
var lang_file = "{t c='global.file'}";
var lang_caption = "{t c='album.caption'}";
var lang_remove = "{t c='global.remove'}";
var lang_ext_invalid = "{t c='upload.album_ext_invalid' s=$image_allowed_extensions}";
var lang_submit = "{t c='upload.album_submit'}";
</script>
<script type="text/javascript" src="{$relative_tpl}/js/jquery.upload-0.1.js"></script>
<div id="content">
    <div class="left span-300">
        {include file='user_info.tpl'}
    </div>
    <div class="right span-650">
        <div id="upload_photo_form">
        <form name="uploadPhoto" id="uploadPhoto" method="post" enctype="multipart/form-data" target="_self" action="{$relative}/upload/photo"> 
        <div class="box">          
            <div class="btitle"><h2>{t c='upload.album_title'}</h2></div>
			<div class="binfo font-12 font-bold">{t c='upload.terms' s=$site_name}</div>
            <br />
            <div class="upload_container">
                <div class="separator">
                    <label for="upload_album_name">{t c='global.name'}:</label>
                    <input name="album_name" type="text" value="{$album.name}" id="upload_album_name" class="large" /><br />
                    <span id="album_name_error" style="display: none;">{t c='upload.album_name_empty'}</span>
                </div>
                <div class="separator">
                    <label for="upload_album_tags">{t c='global.tags'}:</label>
                    <textarea name="album_tags" cols="45" id="upload_album_tags">{$album.tags}</textarea><br /><br />
                    <span id="album_tags_error" style="display: none;">{t c='upload.album_tags_empty'}</span>
                </div>
                <div class="separator">
                    <label for="upload_album_category">{t c='global.category'}:</label>
                    <select name="album_category" id="upload_album_category">
                    <option value="0"{if $album.category == ''} selected="selected"{/if}>-----</option>
                    {section name=i loop=$categories}
                    <option value="{$categories[i].CHID}"{if $album.category == $categories[i].CHID} selected="selected"{/if}>{$categories[i].name}</option>
                    {/section}
                    </select><br />
                    <span id="album_category_error" style="display: none;">{t c='global.category_empty'}</span>
                </div>
                <div class="separator">
                    <label for="upload_album_anonymous_no">{t c='upload.anonymous'}:</label>
                    <input name="album_anonymous" type="radio" value="no" id="upload_album_anonymous_no"{if $album.anonymous == 'no'} checked="checked"{/if} />&nbsp;
                    {t c='upload.anonymous_yes'}
                </div>
                <div class="separator">
                    <label for="upload_album_anonymous_yes">&nbsp;</label>
                    <input name="album_anonymous" type="radio" value="yes" id="upload_album_anonymous_yes"{if $album.anonymous == 'yes'} checked="checked"{/if} />&nbsp;
                    {t c='upload.anonymous_no'}
                </div>
                <div class="separator">
                    <label for="upload_album_type_public">{t c='global.type'}:</label>
                    <input name="album_type" type="radio" value="public" id="upload_album_type_public"{if $album.type == 'public'} checked="checked"{/if} />&nbsp;
                    {t c='upload.album_public'}
                </div>
                <div class="separator">
                    <label for="upload_album_type_private">&nbsp;</label>
                    <input name="album_type" type="radio" value="private" id="upload_album_type_private"{if $album.type == 'private'} checked="checked"{/if} />&nbsp;
                    {t c='upload.album_private'}
                </div>
            </div>
            <br />
            <div class="binfo font-12 font-bold">{t c='upload.contr' s=$site_name}</div>
            <br />
        </div>
        <div class="box">
            <div class="btitle"><h2>{t c='upload.album_add_title'}</h2></div>
            <br>
            <div class="upload_photo_container" id="upload_photo_container_1">
                <div class="separator">
                    <label for="photo_1">{t c='global.file'}:</label>
                    <input name="photo_1" type="file" id="photo_1"><br />
                    <span id="album_photo_error" style="display: none;">{t c='album.select_one'}</span><br />
                    <span id="photo_1_error" style="display: none;"></span>
                </div>
                <div class="separator">
                    <label for="caption_1">{t c='album.caption'}:</label>
                    <input name="caption_1" type="text" value="" maxlength="100" id="caption_1" />
                </div>
            </div>
            <a href="#add_more" id="add_photo" class="add_photo">{t c='global.add_more'}</a>
            <br /><br />
        </div>
        <div id="upload_message_photos" style="display: none; margin: 10px 0 10px 0;">{t c='album.uploading'}</div>
        <br />
        <input name="upload_photo_submit" type="submit" value=" {t c='upload.album_button'} " id="upload_submit" class="button">
        </form>
        </div>
    </div>
    <div class="clear"></div>
</div>
