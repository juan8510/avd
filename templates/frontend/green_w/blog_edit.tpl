<script type="text/javascript" src="{$relative}/addons/markitup/jquery.markitup.js"></script>
<script type="text/javascript" src="{$relative}/addons/markitup/sets/bbcode/set.js"></script>
<link rel="stylesheet" type="text/css" href="{$relative}/addons/markitup/skins/jtageditor/style.css" />
<link rel="stylesheet" type="text/css" href="{$relative}/addons/markitup/sets/bbcode/style.css" />
<div id="content">
    <div class="left span-300">
        {include file='user_info.tpl'}
    </div>
    <div class="right span-650">
        {literal}
        <script type="text/javascript">
        $(document).ready(function() {
            $("#blog_content").markItUp(myBbcodeSettings);
        });
        </script>
        {/literal}
        <div class="box">
            <div class="btitle"><h2>{t c='blog.edit'}: {$blog_title|escape:'html'}</h2></div>
            <div id="blog_form">
                <form name="addBlogForm" id="addBlogForm" method="post" action="{$relative}/blog/edit/{$bid}">
                <div class="separator">
                    <label for="blog_title">{t c='global.title'}:</label>
                    <input name="blog_title" type="text" value="{$blog_title}" maxlength="99" id="blog_title" class="large" />
                </div>
                <div class="separator">
                    <textarea name="blog_content" id="blog_content" cols="20" rows="5">{$blog_content}</textarea>
                </div>
                <br />
                <div class="separator">
                    <input name="blog_edit_submit" type="submit" value=" {t c='global.update'} " id="blog_submit" class="button" />
                </div>
                <br /><br />
                </form>
            </div>
        </div>
    </div>
    <div class="clear"></div>
</div>
