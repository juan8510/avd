<script type="text/javascript">
var game_allowed_extensions = /{$upload_allowed_extensions}$/i;
var image_allowed_extensions = /{$image_allowed_extensions}$/i;
var lang_game_submit = "{t c='upload.game_submit'}";
var lang_game_ext = "{t c='upload.game_ext_invalid'}";
var lang_game_thumb_ext = "{t c='upload.game_thumb_ext_invalid'}";
</script>
<script type="text/javascript" src="{$relative_tpl}/js/jquery.upload-0.1.js"></script>
<div id="content">
    <div class="left span-300">
        {include file='user_info.tpl'}
    </div>
    <div class="right span-650">
        <div class="box">            
            <div class="btitle"><h2>{t c='upload.game_title'}</h2></div>
            <div class="binfo font-12 font-bold">{t c='upload.terms' s=$site_name}</div>
            <br>
            <div id="upload_game_form">
            <form name="uploadGame" id="uploadGame" method="post" enctype="multipart/form-data" target="_self" action="{$relative}/upload/game">
                <input type="hidden" name="MAX_FILE_SIZE" value="{$upload_max_size}" />
                <input type="hidden" name="UPLOAD_IDENTIFIER" id="UPLOAD_IDENTIFIER" value="{$upload_id}" />
                <input type="hidden" name="game_upload_started" />
                <div class="separator">
                    <label for="upload_game_title">{t c='global.title'}:</label>
                    <input name="game_title" type="text" value="{$game.title}" id="upload_game_title" class="large" /><br />
                    <span id="game_title_error" class="error" style="display: none;">{t c='upload.game_title_empty'}</span>
                </div>
                <div class="separator">
                    <label for="upload_game_keywords">{t c='global.tags'}:</label>
                    <textarea name="game_keywords" id="upload_game_keywords">{$game.keywords}</textarea><br />
                    <span id="game_tags_error" class="error" style="display: none;">{t c='upload.game_tags_error'}<br /></span>
                    <span class="expl">{t c='upload.tags_expl'}</span>
                </div>
                <div class="separator">
                    <label for="upload_game_category">{t c='global.category'}:</label>
                    <select name="game_category" id="upload_game_category">
                    <option value="0"{if $game.category == '0'} selected="selected"{/if}>-----</option>
                    {section name=i loop=$categories}
                    <option value="{$categories[i].category_id}"{if $game.category == $categories[i].category_id} selected="selected"{/if}>{$categories[i].category_name|escape:'html'}</option>
                    {/section}
                    </select><br />
                    <span id="game_category_error" class="error" style="display: none;">{t c='upload.game_category_empty'}</span>
                </div>
                <div class="separator">
                    <label for="upload_game_file">{t c='global.file'}:</label>
                    <input name="game_file" type="file" id="upload_game_file" /><br />
                    <span id="game_file_error" class="error" style="display: none;">{t c='upload.game_file_error'}</span>
                    <span id="game_file_ext_error" class="error" style="display: none;"></span>
                </div>
                <div class="separator">
                    <label for="upload_game_thumb_file">{t c='upload.game_thumb'}:</label>
                    <input name="game_thumb_file" type="file" id="upload_game_thumb_file" /><br />
                    <span id="game_thumb_file_error" class="error" style="display: none;">{t c='upload.game_thumb_select'}</span>
                    <span id="game_thumb_file_ext_error" class="error" style="display: none;"></span>
                </div>
                <br>
                <div class="separator">
                    <label for="upload_game_anonymous_no">{t c='upload.anonymous'}:</label>
                    <input name="game_anonymous" type="radio" value="no" id="upload_game_anonymous_no" class="radio"{if $game.anonymous == 'no'} checked="checked"{/if} />
                    <span class="radio">{t c='upload.anonymous_yes'}</span><br>
                    <label for="upload_game_anonymous_yes">&nbsp;</label>
                    <input name="game_anonymous" type="radio" value="yes" id="upload_game_anonymous_yes" class="radio"{if $game.anonymous == 'yes'} checked="checked"{/if} />
                    <span class="radio">{t c='upload.anonymous_no'}</span>
                </div>
                <div class="separator">
                    <label for="upload_game_privacy_public">{t c='upload.privacy'}:</label>
                    <input name="game_privacy" type="radio" value="public" id="upload_game_privacy_public" class="radio"{if $game.privacy == 'public'} checked="checked"{/if} />
                    <span class="radio">{t c='upload.privacy_public_game'}</span><br>
                    <label for="upload_game_privacy_private">&nbsp;</label>
                    <input name="game_privacy" type="radio" value="private" id="upload_game_privacy_private" class="radio"{if $game.privacy == 'private'} checked="checked"{/if} />
                    <span class="radio">{t c='upload.privacy_private_game'}</span>
                </div>
                <br>
                <div id="upload_loader" style="display: none;">
                    <img src="{$relative}/images/ajax-loader.gif">
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
                    <label for="upload_game_submit">&nbsp;</label>
                    <input name="submit_upload_game" type="button" id="upload_game_submit" value=" {t c='upload.game_button'}" class="button" />
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
