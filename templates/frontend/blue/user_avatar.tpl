<script type="text/javascript" src="{$relative_tpl}/js/jquery.imgareaselect-0.6.1.min.js"></script>
<div id="content">
    {literal}
    <script type="text/javascript">
    function selectChange(img, selection)
    {
        document.getElementById("x1").value = selection.x1;
        document.getElementById("y1").value = selection.y1;
        document.getElementById("x2").value = selection.x2;
        document.getElementById("y2").value = selection.y2;
        document.getElementById("width").value = selection.width;
        document.getElementById("height").value = selection.height;
    }
    
    $(window).load(function(){                     
        $('img#user_avatar').imgAreaSelect({ selectionOpacity: 0.2, x1: 1, y1: 1, x2:101, y2:121, resizable: false, persistent:true, onSelectChange: selectChange });
    });
    </script>
    {/literal}
    <div class="span-100">
        <div class="box">
        
        <div class="btitle"><h2>{t c='user.AVATAR_TITLE'}</h2></div>            
            <div id="user_profile">
            <form name="profile_avatar_form" id="profile_avatar_form" method="post" enctype="multipart/form-data" action="{$relative}/user/avatar" style="width: 90%; margin: auto;">
            <div class="profile_photo">
            {if $user.photo != ''}
            <img src="{$relative}/media/users/{$user.photo}?{0|rand:100}">
            {else}
            {t c='user.avatar_none'}
            {/if}
            </div>
            <br />
            <div class="selector">
                <label for="profile_avatar">{t c='global.file'}:</label>
                <input name="avatar" type="file" id="profile_avatar" />&nbsp;
                <input name="avatar_submit" type="submit" class="button" value=" {t c='global.upload'} " />
            </div>
            <br />
            </form>
            </div>
            {if $uploaded}
            <div style="width: 90%; margin: auto;">
            <form name="profile_avatar_crop_form" id="profile_avatar_crop_form" method="post" action="{$relative}/user/avatar">
            <input name="x1" type="hidden" value="5" id="x1">
            <input name="y1" type="hidden" value="5" id="y1">
            <input name="x2" type="hidden" value="100" id="x2">
            <input name="y2" type="hidden" value="120" id="y2">
            <input name="width" type="hidden" value="100" id="width">
            <input name="height" type="hidden" value="120" id="height">
            <br />            
            <img src="{$relative}/media/users/orig/{$user.UID}.jpg?{0|rand:100}" id="user_avatar" />
            <br /><br />
            <input name="avatar_crop_submit" type="submit" class="button" value=" {t c='global.crop'} " />
            <br /><br />
            </form>
            </div>
            {/if}
        </div>
    </div>
</div>
