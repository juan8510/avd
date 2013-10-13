<script type="text/javascript" src="{$relative_tpl}/js/jquery.photoslider-1.1.js"></script>
<script type="text/javascript" src="{$relative_tpl}/js/jquery.slider-1.5.2.min.js"></script>
<div id="content">
    <div class="left span-300">
        {include file='user_info.tpl'}
    </div>
    <div class="right span-650">
        <div class="box">
            <div class="btitle"><h2>{$album.name|upper}</h2></div>
            <div class="blink">
                <div class="blinkl">
                     {t c='global.showing'} <strong>{$start_num}</strong> {t c='global.to'} <strong>{$end_num}</strong> {t c='global.of'} <strong>{$photos_total}</strong> {t c='album.photos'}.
                </div>
                <div class="blinkr">
                      <a href="{$relative}/album/slideshow/{$album.AID}">{t c='global.slideshow'}</a>
                      {if isset($smarty.session.uid) && $smarty.session.uid == $album.UID}
                      <strong>&middot;</strong>
                      <a href="{$relative}/album/edit/{$album.AID}">{t c='global.edit'}</a> <strong>&middot;</strong>
                      <a href="{$relative}/album/addphotos/{$album.AID}">{t c='album.add_more_photos'}</a> <strong>&middot;</strong>
                      <a href="{$relative}/album/delete/{$album.AID}">{t c='global.delete'}</a>
                      {/if}
                </div>
                <div class="clear"></div>
            </div>
            {if !$is_friend}
			<div class="private">{t c='album.private' url=$relative u=$username un=$username}</div>
            {else}
            {if $photos}
            {if $delete_photos == '1' && $smarty.session.uid == $album.UID}
            <div id="delete_photo_message" class="posting" style="display:none"></div>
            {/if}
            {section name=i loop=$photos}
            {if $smarty.section.i.index == '0'}
            <div class="photo_row">
            {/if}
            <div id="album_photo_{$photos[i].PID}" class="photo_box">
                <a href="{$relative}/photo/{$photos[i].PID}/"><img src="{$relative}/media/photos/tmb/{$photos[i].PID}.jpg" alt="{$photos[i].caption|escape:html}" width="150" id="album_photo_{$photos[i].PID}" /></a>
                {if $delete_photos == '1' && $smarty.session.uid == $album.UID}
                <div class="photo_remove">
                    <a href="#delete_photo" id="delete_photo_{$photos[i].PID}" class="remove">{t c='global.remove'}</a>
                </div>
                {/if}
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
            <div class="pagination"><ul>{$page_link}</ul></div><br />
            {else}
                <br />&nbsp;{t c='global.no_photos_found'}!<br /><br />
            {/if}
            {/if}
        </div>
    </div>
    <div class="clear"></div>
</div>
