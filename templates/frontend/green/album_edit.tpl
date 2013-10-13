<script type="text/javascript" src="{$relative_tpl}/js/jquery.imgareaselect-0.6.1.min.js"></script>
<script type="text/javascript" src="{$relative_tpl}/js/jquery.album-0.1.js"></script>
<div id="content">
    <div class="left span-300">
    {include file='user_info.tpl'}
    </div>
    <div class="right span-650">
        <div id="upload_photo_form">
        <form name="uploadPhoto" id="uploadPhoto" method="post" action="{$relative}/album/edit/{$album.AID}">
        <div class="box">            
            <div class="btitle"><h2>{t c='global.EDIT'}: {$album.name|upper|escape:'html'}</h2></div>
            <div class="blink">
                <div class="blinkr">
                      <a href="{$relative}/album/{$album.AID}/">{t c='global.back_to'} {$album.name|escape:'html'}</a> <strong>&middot;</strong>
                      <a href="{$relative}/album/addphotos/{$album.AID}">{t c='album.add_more_photos'}</a>
                </div>
                <div class="clear_right"></div>
            </div>
            <div class="upload_container">
                <div class="separator">
                    <label for="upload_album_name">{t c='global.name'}:</label>
                    <input name="album_name" type="text" value="{$album.name}" id="upload_album_name" class="large" /><br />
                    <span id="album_name_error" style="display: none;">Please enter the album name!</span>
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
                    <label for="upload_album_tags">{t c='menu.tags'}:</label>
                    <textarea name="album_tags" cols="45" id="upload_album_tags">{$album.tags}</textarea><br /><br />
                    <span id="album_tags_error" style="display: none;">{t c='album.tags_empty'}</span>
                </div>
                <div class="separator">
                    <label for="upload_album_type_public">{t c='global.type'}:</label>
                    <input name="album_type" type="radio" value="public" id="upload_album_type_public" class="radio"{if $album.type == 'public'} checked="checked"{/if} />&nbsp;
                	{t c='album.public'}
                </div>
                <div class="separator">
                    <label for="upload_album_type_private">&nbsp;</label>
                    <input name="album_type" type="radio" value="private" id="upload_album_type_private" class="radio"{if $album.type == 'private'} checked="checked"{/if} />&nbsp;
                    {t c='album.private'}
                </div>
            </div>            
            <br />
        </div>
        <div class="box">
            {if $photos}
            <br /><div class="blinkml">{t c='album.step_one'}:</div><div class="clear_left"></div><br />
            {section name=i loop=$photos}
            {if $smarty.section.i.index == '0'}
            <div class="photo_row">
            {/if}
            <div class="photo_box">
                <a href="{$relative}/photo/{$photos[i].PID}/"><img src="{$relative}/media/photos/tmb/{$photos[i].PID}.jpg" alt="{$photos[i].caption|escape:html}" width="150" id="album_photo_{$photos[i].PID}" /></a>
            </div>
            {if $smarty.section.i.index gt '0' && $smarty.section.i.index mod 4 == '3' && $smarty.section.i.index != $smarty.section.i.total-1}
            <div class="clear_left"></div>
            </div>
            <div class="photo_row">
            {/if}
            {if $smarty.section.i.index == $smarty.section.i.total-1}
                <div class="clear_left"></div>
                </div>
            {/if}
            {/section}
            <br /><div class="blinkml">{t c='album.step_two'}.</div><div class="clear_left"></div><br />
            <input name="x1" type="hidden" value="0" id="x1" />
            <input name="y1" type="hidden" value="0" id="y1" />
            <input name="x2" type="hidden" value="120" id="x2" />
            <input name="y2" type="hidden" value="140" id="y2" />
            <input name="width" type="hidden" value="120" id="width" />
            <input name="height" type="hidden" value="140" id="height" />
            <input name="photo" type="hidden" value="1" id="photo" />
            <input name="random" type="hidden" value="" id="random" />
            <br />
            &nbsp; <img src="{$relative}/media/photos/tmb/{$photos[0].PID}.jpg?{0|rand:100}" id="album_cover" class="album_cover" />
            <br /><br />                                                                        
            {else}
				<br />{t c='album.edit_no_photos' r=$relative a=$album.AID}!<br /><br />
            {/if}
        </div>
        <br />
        <input name="submit_album_edit" type="submit" value=" {t c='global.save'} " class="button" />
        </form>
        </div>
    </div>
    <div class="clear"></div>
</div>
