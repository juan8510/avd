<script type="text/javascript" src="{$relative_tpl}/js/jquery.upload-0.1.js"></script>
<div id="content">
    <div class="left span-300">
        {include file='user_info.tpl'}
    </div>
    <div class="right span-650">
        <div class="box">            
            <div class="btitle"><h2>{t c='album.add_photos_to'} '{$album.name|upper|escape:'html'}'</h2></div>
            <div class="blink">
                <div class="blinkr">
                      <a href="{$relative}/album/slideshow/{$album.AID}">{t c='global.slideshow'}</a>
                      {if isset($smarty.session.uid) && $smarty.session.uid == $album.UID}
                      <strong>&middot;</strong>
                      <a href="{$relative}/album/edit/{$album.AID}">{t c='global.edit'}</a> <strong>&middot;</strong>
                      <a href="{$relative}/album/addphotos/{$album.AID}">{t c='album.add_more_photos'}</a> <strong>&middot;</strong>
                      <a href="{$relative}/album/delete/{$album.AID}">{t c='global.delete'}</a>
                      {/if}
                </div>
                <div class="clear_right"></div>
            </div>
            <br />
            <div id="upload_photo_form">
            <form name="addMorePhotos" id="addMorePhotos" method="post" enctype="multipart/form-data" target="_self" action="{$relative}/album/addphotos/{$album.AID}/">
            <div class="upload_photo_container" id="upload_photo_container_1">
                <div class="separator">
                    <label for="photo_1">{t c='global.file'}:</label>
                    <input name="photo_1" type="file" id="photo_1"><br />
                    <span id="album_photo_error" style="display: none;">{t c='album.select_one'}!</span><br />
                    <span id="photo_1_error" style="display: none;"></span>
                </div>
                <div class="separator">
                    <label for="caption_1">{t c='album.caption'}:</label>
                    <input name="caption_1" type="text" value="" maxlength="100" id="caption_1" />
                </div>
            </div>
            <a href="#add_more" id="add_photo" class="add_photo">{t c='global.add_more'}</a><br /><br />
            </div>            
            <div class="upload_photo_submit">
                <div id="upload_message_photos" style="display: none; margin: 10px 0 10px 0;">{t c='album.uploading'}.</div>
                <br />
                <input name="add_photos_submit" type="submit" value=" {t c='global.upload'} " id="upload_submit" class="button">
            </div>
            </form>
            </div>
        </div>
    </div>
    <div class="clear"></div>
</div>
