<?php
defined('_VALID') or die('Restricted Access!');

require $config['BASE_DIR']. '/classes/pagination.class.php';

$type           = 'public';
if ( isset($options['query']['0']) && $options['query']['0'] == 'private' ) {
    $type       = 'private';
}

$sql            = "SELECT COUNT(VID) AS total_videos FROM video WHERE UID = " .$uid. " AND type = '" .$type. "' AND active = '1'";
$rsc            = $conn->execute($sql);
$total          = $rsc->fields['total_videos'];
$pagination     = new Pagination(20);
$limit          = $pagination->getLimit($total);
$sql            = "SELECT VID, title, rate, viewnumber, duration, type, thumb, thumbs, hd FROM video
                   WHERE UID = " .$uid. " AND type = '" .$type. "' AND active = '1' ORDER BY addtime DESC LIMIT " .$limit;
$rs             = $conn->execute($sql);
$videos         = $rs->getrows();
$page_link      = $pagination->getPagination('user/' .$username. '/videos/' .$type);
$start_num      = $pagination->getStartItem();
$end_num        = $pagination->getEndItem();

$self_title     = $username. ' - ' .($type == 'public') ? $lang['global.public'] : $lang['global.private']. ' ' .$lang['global.videos'];

$smarty->assign('type', $type);
$smarty->assign('videos', $videos);
$smarty->assign('videos_total', $total);
$smarty->assign('page_link', $page_link);
$smarty->assign('start_num', $start_num);
$smarty->assign('end_num', $end_num);
?>
