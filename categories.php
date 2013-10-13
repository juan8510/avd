<?php
define('_VALID', true);
require 'include/config.php';
require 'include/function_smarty.php';

$sql            = "SELECT CHID, name FROM channel ORDER BY name ASC";
$rs             = $conn->execute($sql);
$categories     = $rs->getrows();
$videos         = array();
$type			= ($config['show_private_videos'] == '1') ? '' : " AND type = 'public'";

foreach ( $categories as $category ) {
    $sql                = "SELECT * FROM video WHERE active = '1' AND channel = " .intval($category['CHID']) . $type. "
                           ORDER BY addtime DESC LIMIT 2";
    $rs                 = $conn->execute($sql);
    $category_videos    = $rs->getrows();
    $videos[]           = array('CHID' => $category['CHID'], 'name' => $category['name'], 'category_videos' => $category_videos);
}

$smarty->assign('errors',$errors);
$smarty->assign('messages',$messages);
$smarty->assign('menu', 'categories');
$smarty->assign('catgy', true);
$smarty->assign('videos', $videos);
$smarty->assign('categories', $categories);
$smarty->assign('self_title', $seo['categories_title']);
$smarty->assign('self_description', $seo['categories_desc']);
$smarty->assign('self_keywords', $seo['categories_keywords']);
$smarty->display('header.tpl');
$smarty->display('errors.tpl');
$smarty->display('messages.tpl');
$smarty->display('categories.tpl');
$smarty->display('footer.tpl');
$smarty->gzip_encode();
?>
