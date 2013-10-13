<div id="content">
    <div class="left span-300">
        {include file='user_info.tpl'}
    </div>
    <div class="right span-650">
        <div class="box">            
            <div class="btitle"><h2>{$username|upper} {t c='user.PHOTO_ALBUMS'}</h2></div>
            {if $albums}
            <div class="blink">
                <div class="blinkl">
                    &nbsp;{t c='global.showing'} <strong>{$start_num}</strong> {t c='global.to'} <strong>{$end_num}</strong> {t c='global.of'} <strong>{$albums_total}</strong> {t c='global.albums'}.
                </div>
                <div class="blinkr">
                {if isset($smarty.session.uid) && $smarty.session.uid == $user.UID}
                    <a href="{$relative}/upload">{t c='album.upload'}</a>
                {/if}
                </div>
                <div class="clear"></div>
            </div>
            {section name=i loop=$albums}
            <div class="album_box">
                <a href="{$relative}/album/{$albums[i].AID}/{$albums[i].name|clean}"><img src="{$relative}/media/albums/{$albums[i].AID}.jpg" title="{$albums[i].name|escape:'html'}" alt="{$albums[i].name|escape:'html'}" width="120" /><br /><span class="font-11 font-bold">{$albums[i].name|truncate:30:' ...':true|escape:'html'}</span><br />{if $albums[i].type == 'private'}<img alt="" style="position: absolute; left: 0px; top: 0px; width: 120px; height: 140px;" src="{$relative_tpl}/images/{private type='album'}" />{/if}</a>
            </div>                                                    
            {/section}
            <div class="clear_left"></div>
            <div class="pagination"><ul>{$page_link}</ul></div><br />
            {else}
                <p>&nbsp;&nbsp;&nbsp;{t c='albums.none_found'}.</p>
            {/if}
        </div>
    </div>
    <div class="clear"></div>
</div>
