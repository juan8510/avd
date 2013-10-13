<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>{if isset($self_title) && $self_title != ''}{$self_title|escape:'html'}{else}{$site_name}{/if}</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="robots" content="index, follow" />
    <meta name="revisit-after" content="1 days" />
    <meta name="keywords" content="{if isset($self_keywords) && $self_keywords != ''}{$self_keywords|escape:'html'}{else}{$meta_keywords}{/if}" />
    <meta name="description" content="{if isset($self_description) && $self_description != ''}{$self_description|escape:'html'}{else}{$meta_description}{/if}" />
    <link rel = "stylesheet" href = "{$relative_tpl}/css/style.css" type = "text/css" />
    <link rel = "stylesheet" href = "{$relative_tpl}/css/style_menu.css" type = "text/css" />
	<link rel="Shortcut Icon" type="image/ico" href="/favicon.ico" />
    <!--[if IE 7]><link rel="stylesheet" type="text/css" href="{$relative_tpl}/css/style_ie7.css" /><![endif]-->
    <!--[if IE 6]><link rel="stylesheet" type="text/css" href="{$relative_tpl}/css/style_ie6.css" /><![endif]-->
    <script type="text/javascript">
    var base_url = "{$baseurl}";
    var tpl_url = "{$relative_tpl}";
	{if isset($video.VID)}var video_id = "{$video.VID}";{/if}
	var lang_deleting = "{t c='global.deleting'}";
	var lang_flaging = "{t c='global.flaging'}";
	var lang_loading = "{t c='global.loading'}";
	var lang_sending = "{t c='global.sending'}";
	var lang_share_name_empty = "{t c='share.name_empty'}";
	var lang_share_rec_empty = "{t c='share.recipient'}";
</script>
    <script type="text/javascript" src="{$relative_tpl}/js/jquery-1.2.6.pack.js"></script>
    <script type="text/javascript" src="{$relative_tpl}/js/jquery.livequery.pack.js"></script>
    <script type="text/javascript" src="{$relative_tpl}/js/jquery.rotator-0.2.js"></script>
    <script type="text/javascript" src="{$relative_tpl}/js/jquery.avs-0.2.js"></script>
    {if $submenu_tag_scroller == '1'}<script type="text/javascript" src="{$relative_tpl}/js/jscroller2-1.5.js"></script>{/if}
</head>
<body>
<div id="container">
    <div id="header">
        <div id="logo">
           <a href="{$baseurl}" title="{$site_name}"><img src="{$relative_tpl}/images/logo.png" alt="{$site_name} Logo" /></a>
        </div>
		{insert name=language assign=flag}
        <div id="right">
            {if isset($smarty.session.uid)}
			{if $multi_language}
				<a href="#" id="select_language" class="languageselector" title="Select Language"><div><img src="{$relative_tpl}/images/flags/{$flag}" id="select_language" alt="{$flag}" /><img src="{$relative_tpl}/images/arrowdown.gif"></div></a>
			{/if}
            <div id="userlinks">
            <ul>
                <li><a href="{$relative}/logout">{translate c='global.sign_out'}</a></li>
                <li id="my_feeds"><a href="{$relative}/feeds" class="icon">{translate c='global.my_feeds'}</a></li>
                <li id="new_requests"><a href="{$relative}/requests" class="icon">{translate c='global.requests'} ({$requests_count})</a></li>
                <li id="new_mail"><a href="{$relative}/mail/inbox" class="icon">{translate c='global.inbox'} ({$mails_count})</a></li>
                <li>Welcome: <a href="{$relative}/user">{$smarty.session.username}</a>!</li>
            </ul>
            </div>
            <div class="clear_right"></div>
            {else}
			{if $multi_language}
				<a href="#" id="select_language" class="languageselector" title="Select Language"><div><img src="{$relative_tpl}/images/flags/{$flag}" id="select_language" alt="{$flag}" /><img src="{$relative_tpl}/images/arrowdown.gif"></div></a>
			{/if}
            <div id="nologinlinks">
                <a href="{$relative}/signup" rel="nofollow">&nbsp;{translate c='global.sign_up'}</a> <strong>&middot;</strong>
                <a href="{$relative}/login" rel = "nofollow">{translate c='global.login'}</a>
            </div>
			<div class="clear_right"></div>
            {/if}
            <div id="toplinks" class="grey small">
                <a href="{$relative}/invite" rel="nofollow">{translate c='global.invite_friends'}</a> <strong>&middot;</strong> 
                <a href="{$relative}/feedback" rel="nofollow">{translate c='global.support_feedback'}</a> <strong>&middot;</strong> 
                <a href="{$relative}/notices">{$site_name} {translate c='global.notice'}</a>
            </div>
			<div id="slidetabsmenu">
			<ul>
                <li{if $menu == 'community'} id="current"{/if}><a href="{$relative}/community"><span>{translate c='menu.community'}</span></a></li>
                <li{if $menu == 'categories'} id="current"{/if}><a href="{$relative}/categories"><span>{translate c='menu.categories'}</span></a></li>
                {if $blog_module == '1'}<li{if $menu == 'blogs'} id="current"{/if}><a href="{$relative}/blogs"><span>{translate c='menu.blogs'}</span></a></li>{/if}
                {if $game_module == '1'}<li{if $menu == 'games'} id="current"{/if}><a href="{$relative}/games"><span>{translate c='menu.games'}</span></a></li>{/if}
                {if $photo_module == '1'}<li{if $menu == 'albums'} id="current"{/if}><a href="{$relative}/albums"><span>{translate c='menu.photos'}</span></a></li>{/if}
                <li{if $menu == 'videos'} id="current"{/if}><a href="{$relative}/videos"><span>{translate c='menu.videos'}</span></a></li>
                <li{if $menu == 'home'} id="current"{/if}><a href="{$relative}/"><span>{translate c='menu.home'}</span></a></li>				
			</ul>
			</div>
			<div class="clear_left"></div>
        </div>
        <div class="clear"></div>
        <div id="submenu">
            <div id="upload">
                <a href="{$relative}/upload">{translate c='menu.upload'}</a>
            </div>
            <div id="search">
                <form name="search" id="search_form" method="get" action="{$relative}/search">
                    <input name="search_query" type="text" id="search_query" value="{if isset($search_query)}{$search_query}{/if}" />
                    <select class="searchselect" name="search_type" id="search_type">
                        <option value="videos"{if isset($search_type) && $search_type == 'videos'} selected="yes"{/if}>{translate c='global.videos'}</option>
                        {if $photo_module == '1'}<option value="photos"{if isset($search_type) && $search_type == 'photos'} selected="yes"{/if}>{translate c='global.photos'}</option>{/if}
                        {if $game_module == '1'}<option value="games"{if isset($search_type) && $search_type == 'games'} selected="yes"{/if}>{translate c='global.games'}</option>{/if}
                        <option value="users"{if isset($search_type) && $search_type == 'users'} selected="yes"{/if}>{translate c='global.users'}</option>
                    </select>
                    <input type="submit" value="{t c='ajax.search'}" class="searchbutton" maxlength="50" />
                    <span class="span_search">[ <a href="{$relative}/search" rel="nofollow" id="advanced_search" class="submenulink">{translate c='menu.advanced'}</a> ]</span>
                </form>
            </div>
            {if $submenu_tag_scroller == '1'}
            <div id="scroller">
                <div id="scroller_title">
                {translate c='menu.tags'}:
                </div>
                <div id="scroller_container">
                    <div class="jscroller2_left" style="font-size: 13px; line-height:15px; white-space:nowrap; margin: 0;">
                    {section name=i loop=$scroller_content}
                        <a class="submenulink" href="{$relative}/search?search_query={$scroller_content[i]}&amp;search_type=videos">{$scroller_content[i]|escape:'html'}</a>
                    {/section}
                    </div>
                </div>
                <div class="clear"></div>
            </div>
            {/if}
            <div class="clear"></div>
        </div>
		<div id="language_select" style="margin-top: 5px; display: none;">
			<div class="box" id="language_container"></div>
		</div>
        <div id="loading_advanced_search" class="response_full" style="display: none;">Loading...</div>
        <div id="search_advanced" style="margin-top: 5px; display: none;">
            <div class="box" id="advanced_search_container"></div>
        </div>
    </div>
                  <!-- end of header -->
