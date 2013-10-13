<div id="content">
    <div class="left span-300">
        {include file='user_info.tpl'}
    </div>
    <div class="right span-650">
        <div id="upload_menu">
        <div class="box">            
            <div class="btitle"><h2>{t c='upload.title'}</h2></div>
            <div class="upload_video">
                <a href="{$relative}/upload/video"><img src="{$relative_tpl}/images/upload_video_icon.png" alt="Upload Videos"></a>
            </div>
			{if $photo_module == '1'}
            <div class="upload_photo">
                <a href="{$relative}/upload/photo"><img src="{$relative_tpl}/images/upload_photo_icon.png" alt="Upload Photos"></a>
            </div>
			{/if}
			{if $game_module == '1'}
            <div class="upload_game">
                <a href="{$relative}/upload/game"><img src="{$relative_tpl}/images/upload_game_icon.png" alt="Upload Games"></a>
            </div>
			{/if}
			<div class="clear"></div>
        </div>
        </div>
    </div>
    <div class="clear"></div>
</div>
