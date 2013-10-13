<?php
defined('_VALID') or die('Restricted Access!');
require $config['BASE_DIR']. '/classes/pagination.class.php';

if ( $config['game_module'] == '0' ) {
    VRedirect::go($config['BASE_URL']. '/error/page_invalid');
}

$active         = ( $config['approve'] == '1' ) ? " AND active = '1'" : " AND active = '0'";
$type           = 'public';
if ( isset($options['query']['0']) && $options['query']['0'] == 'private' ) {
    $type       = 'private';
}

$sql            = "SELECT COUNT(GID) AS total_games FROM game WHERE UID = " .$uid. " AND type = '" .$type. "' AND status = '1'";
$rsc            = $conn->execute($sql);
$total          = $rsc->fields['total_games'];
$pagination     = new Pagination(20);
$limit          = $pagination->getLimit($total);
$sql            = "SELECT GID, title, rate, total_plays, type FROM game
                   WHERE UID = " .$uid. " AND type = '" .$type. "' AND status = '1'
                   ORDER BY addtime DESC LIMIT " .$limit;
$rs             = $conn->execute($sql);
$games          = $rs->getrows();
$page_link      = $pagination->getPagination('user/' .$username. '/games/' .$type);
$start_num      = $pagination->getStartItem();
$end_num        = $pagination->getEndItem();

$self_title     = $username. '\' s ' .ucfirst($type). ' Games';

$smarty->assign('type', $type);
$smarty->assign('games', $games);
$smarty->assign('games_total', $total);
$smarty->assign('page_link', $page_link);
$smarty->assign('start_num', $start_num);
$smarty->assign('end_num', $end_num);
?>
