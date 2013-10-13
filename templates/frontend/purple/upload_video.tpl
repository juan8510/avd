<script type="text/javascript">
var video_allowed_extensions = /{$allowed_video_extensions}$/i;
var lang_ext_invalid = "{t c='upload.video_ext_invalid' s=$allowed_video_extensions}";
var lang_submit = "{t c='upload.video_submit'}";
</script>
<script type="text/javascript" src="{$relative_tpl}/js/jquery.upload-0.1.js"></script>
<div id="content">
    <div class="left span-300">
        {include file='user_info.tpl'}
    </div>
    <div class="right span-650">
        <div class="box">    
            <div class="btitle"><h2>{t c='upload.video_title'}</h2></div>
            <div class="binfo font-12 font-bold">{t c='upload.terms' s=$site_name}</div>
            <br>
            <div id="upload_video_form">
            <form name="uploadVideo" id="uploadVideo" method="post" enctype="multipart/form-data" target="_self" action="{$relative}/upload/video">
                <input type="hidden" name="MAX_FILE_SIZE" value="{$upload_max_size}" />
                <input type="hidden" name="UPLOAD_IDENTIFIER" id="UPLOAD_IDENTIFIER" value="{$upload_id}" />
                <input type="hidden" name="video_upload_started" />
                <div class="separator">
                    <label for="upload_video_title">{t c='global.title'}:</label>
                    <input name="video_title" type="text" value="{$video.title}" id="upload_video_title" class="large" /><br />
                    <span id="video_title_error" class="error" style="display: none;">{t c='upload.video_title_empty'}</span>
                </div>
                <div class="separator">
                    <label for="upload_video_keywords">{t c='global.tags'}:</label>
                    <textarea name="video_keywords" id="upload_video_keywords">{$video.keywords}</textarea><br />
                    <span class="expl">{t c='upload.tags_expl'}</span><br />
                    <span id="video_tags_error" class="error" style="display: none;">{t c='upload.video_tags_empty'}</span>
                </div>
                <div class="separator">
                    <label for="upload_video_category">{t c='global.category'}:</label>
                    <select name="video_category" id="upload_video_category">
                    <option value="0"{if $video.category == '0'} selected="selected"{/if}>-----</option>
                    {section name=i loop=$categories}
                    <option value="{$categories[i].CHID}"{if $video.category == $categories[i].CHID} selected="selected"{/if}>{$categories[i].name|escape:'html'}</option>
                    {/section}
                    </select><br />
                    <span id="video_category_error" class="error" style="display: none;">{t c='global.category_empty'}</span>
                </div>
                <div class="separator">
                    <label for="upload_video_file">{t c='global.file'}:</label>
                    <input name="video_file" type="file" id="upload_video_file" /><br />
                    <span id="video_file_error" class="error" style="display: none;">{t c='upload.video_file_empty'}</span>
                    <span id="video_file_ext_error" class="error" style="display: none;"></span>
                </div>
                <br>
                <div class="separator">
                    <label for="upload_video_anonymous_no">{t c='upload.anonymous'}:</label>
                    <input name="video_anonymous" type="radio" value="no" id="upload_video_anonymous_no" class="radio"{if $video.anonymous == 'no'} checked="checked"{/if} />
                    <span class="radio">{t c='upload.anonymous_yes'}</span><br>
                    <label for="upload_video_anonymous_yes">&nbsp;</label>
                    <input name="video_anonymous" type="radio" value="yes" id="upload_video_anonymous_yes" class="radio"{if $video.anonymous == 'yes'} checked="checked"{/if} />
                    <span class="radio">{t c='upload.anonymous_no'}</span>
                </div>
                <div class="separator">
                    <label for="upload_video_privacy_public">{t c='upload.privacy'}:</label>
                    <input name="video_privacy" type="radio" value="public" id="upload_video_privacy_public" class="radio"{if $video.privacy == 'public'} checked="checked"{/if} />
                    <span class="radio">{t c='upload.video_public'}</span><br>
                    <label for="upload_video_privacy_private">&nbsp;</label>
                    <input name="video_privacy" type="radio" value="private" id="upload_video_privacy_private" class="radio"{if $video.privacy == 'private'} checked="checked"{/if} />
                    <span class="radio">{t c='upload.video_private'}</span>
                </div>
                <br>
                <div id="upload_loader" style="display: none;">
                    <img src="{$relative_tpl}/images/ajax-loader.gif">
                </div>
                <div id="upload_status" style="display:none;">
                    <div id="upload_progress"><div class="bar" style="width: 0;">&nbsp;</div></div>
                    <div class="upload_info">
                        <div id="upload_time"></div>
                        <div id="upload_size"></div>
                        <div class="clear"></div>
                    </div>
                </div>
                <div id="upload_message" style="display: none;"></div>
                <div class="separator">
                    <label for="upload_video_submit">&nbsp;</label>
                    <input name="submit_upload_video" type="button" id="upload_video_submit" value="{t c='upload.video_button'}" class="button" />
                </div>
            </form>
            </div>
            <br />
            <div class="binfo font-12 font-bold">{t c='upload.contr' s=$site_name}</div>
			<br />
        </div>
    </div>
    <div class="clear"></div>
</div>
