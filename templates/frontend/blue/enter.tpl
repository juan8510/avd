<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>{$site_name|escape:'html'}</title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<meta name="description" content="{$meta_description|escape:'html'}" />
	<meta name="keywords" content="{$meta_keywords|escape:'html'}" />
	<meta name="revisit-after" content="1" />
	<link rel="shortcut icon" href="{$relative}/favicon.ico" />
{literal}
<style type="text/css">
	body { background-color: #fff; margin: 0 20px 0 20px; }
	.align-center {	text-align: center; }
	#container { width: 650px; margin-left: auto; margin-right: auto; }
	#logo {	margin: 100px 0 30px 0; }
	#logo img { border: none;}
	#warning { font: normal 26px "Lucida Sans Unicode", Arial; color: #999; letter-spacing: -1px; }
	#warning2 {	margin: 20px 0 0 0;	font: normal 16px "Lucida Sans Unicode", Arial;	color: #555; }
	#enter { float: left; margin: 50px 0 0 150px; }
	#leave { float: right; margin: 50px 150px 0 0; }
	#enter a, #leave a { display: block; width: 100px; height: 34px; background:transparent url({/literal}{$baseurl}{literal}/templates/frontend/purple/images/enter_btn.png) no-repeat; font: normal 19px/30px "Lucida Sans Unicode", Arial; color: #ccc; text-decoration:none; text-align: center; }
</style>
{/literal}
</head>
<body>
<div id="container">
<div id="logo" class="align-center">
	<a href="/"><img src="{$baseurl}/templates/frontend/blue/images/logo.png" alt="{$site_name|escape:'html'} Logo!" /></a>
</div>
<div id="warning" class="align-center">
	WARNING: This website contains explicit adult material.
</div>
<div id="warning2" class="align-center">
	You may only enter this Website if you are at least
	18 years of age, or at least the age of majority in the jurisdiction
	where you reside or from which you access this Website.  If you do not
	meet these requirements, then you do not have permission to use the
	Website.
</div>
<div id="enter">
	<a href="{$baseurl}">Enter</a>
</div>
<div id="leave">
	<a href="http://www.google.com">Leave</a>
</div>
</body>
</html>
