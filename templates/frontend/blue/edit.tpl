<script type="text/javascript" src="{$relative_tpl}/js/jquery.video_edit-0.1.js"></script>
<div id="content">
    <div class="left span-300">
    {include file='user_info.tpl'}
    </div>
    <div class="right span-650">
        <div class="box">
            <div class="btitle"><h2>{t c='global.EDIT'}: {$video.title|truncate:50:' ...':true|escape:'html'}</h2></div>
            <br />
            <div id="upload_video_form">
            <form name="editVideo" id="editVideo" method="post" enctype="multipart/form-data" target="_self" action="{$relative}/edit/{$video.VID}">
                <div class="separator">
                    <label for="upload_video_title">{t c='global.title'}:</label>
                    <input name="title" type="text" value="{$video.title}" id="upload_video_title" class="large" /><br />
                    <span id="video_title_error" class="error" style="display: none;">{t c='upload.video_title_empty'}</span>
                </div>
                <div class="separator">
                    <label for="upload_video_keywords">{t c='global.tags'}:</label>
                    <textarea name="keyword" id="upload_video_keywords">{$video.keyword}</textarea><br />
                    <span class="expl">{t c='upload.tags_expl'}</span><br />
                    <span id="video_tags_error" class="error" style="display: none;">{t c='upload.video_tags_empty'}</span>
                </div>
                <div class="separator">
                    <label for="upload_video_category">{t c='global.category'}:</label>
                    <select name="channel" id="upload_video_category">
                    {section name=i loop=$categories}
                    <option value="{$categories[i].CHID}"{if $video.channel == $categories[i].CHID} selected="selected"{/if}>{$categories[i].name|escape:'html'}</option>
                    {/section}
                    </select><br />
                    <span id="video_category_error" class="error" style="display: none;">{t c='global.category_empty'}</span>
                </div>
                <div class="separator">
                    <label for="upload_video_privacy_public">{t c='upload.privacy'}:</label>
                    <input name="type" type="radio" value="public" id="upload_video_privacy_public" class="radio"{if $video.type == 'public'} checked="checked"{/if} />
                    <span class="radio">{t c='upload.video_public'}</span><br>
                    <label for="upload_video_privacy_private">&nbsp;</label>
                    <input name="type" type="radio" value="private" id="upload_video_privacy_private" class="radio"{if $video.type == 'private'} checked="checked"{/if} />
                    <span class="radio">{t c='upload.video_private'}</span>
                </div>
				<div class="separator">
					<label for="thumb">{t c='edit.thumb'}:</label>
					<div style="width: 414px; float: right; margin-bottom: 5px;">
					<input name="thumb" id="thumb" type="hidden" value="{$video.thumb}" />
					{insert name=thumb assign=thumb vid=$video.VID thumb=$video.thumb thumbs=$video.thumbs}
					{$thumb}
					</div>
					<div class="clear_right"></div>
				</div>
                <div class="separator">
                    <label for="edit_submit">&nbsp;</label>
                    <input name="edit_submit" type="submit" id="edit_submit" value="{t c='edit.video'}" class="button" />
                </div>
            </form>
            </div>
		</div>
    </div>
    <div class="clear"></div>
</div>
