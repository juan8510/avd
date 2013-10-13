<script type="text/javascript">
var lang_blocking = "{t c='global.blocking'}";
var lang_unblocking = "{t c='global.unblocking'}";
var lang_block = "{t c='user.block'}";
var lang_unblock = "{t c='user.unblock'}";
</script>
<script type="text/javascript" src="{$relative_tpl}/js/jquery.profile-0.1.js"></script>
<div id="profile_menu">
<ul>
    <li><a href="{$relative}/user/edit"{if $profile_menu == 'edit'} class="active"{/if}>{t c='user.personal'}</a></li>
    <li><a href="{$relative}/user/prefs"{if $profile_menu == 'prefs'} class="active"{/if}>{t c='user.prefs'}</a></li>
    <li><a href="{$relative}/user/avatar"{if $profile_menu == 'avatar'} class="active"{/if}>{t c='user.avatar'}</a></li>
    <li><a href="{$relative}/user/blocks"{if $profile_menu == 'blocks'} class="active"{/if}>{t c='user.block_list'}</a></li>
    <li><a href="{$relative}/user/delete"{if $profile_menu == 'delete'} class="active"{/if}>{t c='user.delete_profile'}</a></li>
</ul>
<div class="clear_left"></div>
</div>
<div id="profile_menu_expl">
    <div class="pmenu_left">
    {if $profile_menu == 'delete'}
	{t c='user.delete_sub'}
    {elseif $profile_menu == 'blocks'}
	{t c='user.block_sub'}
    {elseif $profile_menu == 'avatar'}
	{t c='user.avatar_sub'}
    {elseif $profile_menu == 'prefs'}
	{t c='user.prefs_sub'}
    {else}
	{t c='user.profile_sub'}
    {/if}
    </div>
    <div class="pmenu_right">
        <a href="{$relative}/user/{$username}">{t c='global.back_to_profile'}.</a>
    </div>
    <div class="clear"></div>
</div>
