<?php
defined('_VALID') or die('Restricted Access!');

require $config['BASE_DIR']. '/classes/filter.class.php';
require $config['BASE_DIR']. '/include/adodb/adodb.inc.php';
require $config['BASE_DIR']. '/classes/pagination.class.php';
require $config['BASE_DIR']. '/include/compat/json.php';
require $config['BASE_DIR']. '/include/dbconn.php';

$data   = array('status' => 0, 'games' => '', 'page' => 0, 'pages' => 0);
if ( isset($_POST['game_id']) && isset($_POST['move']) && isset($_POST['page']) ) {
    $filter         = new VFilter();
    $gid            = $filter->get('game_id', 'INTEGER');
    $page           = $filter->get('page', 'INTEGER');
    $move           = ( $_POST['move'] == 'next' ) ? 'next' : 'prev';
    if ( $move == 'prev' ) {
        $page   = ( $page < 1 ) ? 1 : $page-1;
    } else {
        $page   = $page+1;
    }
    
    $sql            = "SELECT title, category, tags FROM game WHERE GID = " .$gid. " LIMIT 1";
    $rs             = $conn->execute($sql);
    $game           = $rs->getrows();
    $game           = $game['0'];
    
    $sql_add        = NULL;
    if ( $game['tags'] ) {
        $keywords   = explode(' ', $game['tags']);
        $sql_add   .= " OR (";
        $sql_or     = NULL;
        foreach ( $keywords as $keyword ) {
            $sql_add .= $sql_or. " tags LIKE '%" .mysql_real_escape_string($keyword). "%'";
            $sql_or   = " OR ";
        }
        $sql_add   .= ")";
    }
    
	$type			= ($config['show_private_games'] == '1') ? '' : " AND type = 'public'";
    $sql            = "SELECT COUNT(GID) AS total_games FROM game WHERE status = '1' AND category = '" .$game['category']. "'" .$type. " AND GID != " .$gid. "
					   AND status = '1' AND ( title LIKE '%" .mysql_real_escape_string($game['title']). "%' " .$sql_add. ")";
    $rs             = $conn->execute($sql);
    $total          = $rs->fields['total_games'];
    $total          = ( $total > 100 ) ? 100 : $total;
    $pagination     = new Pagination(10, $page);
    $limit          = $pagination->getLimit($total);
    $sql            = "SELECT GID, title, addtime, rate, total_plays FROM game 
                       WHERE status = '1' AND category = '" .intval($game['category']). "'" .$type. " AND GID != " .$gid. "
                       AND ( title LIKE '%" .mysql_real_escape_string($game['title']). "%' " .$sql_add. ") 
                       ORDER BY addtime DESC LIMIT " .$limit;
    $rs             = $conn->execute($sql);
    $games          = $rs->getrows();
    $code           = array();
    $total_pages    = $pagination->getTotalPages();
    $page           = ( $page >= $total_pages ) ? $total_pages : $page;
	$private_img	= '<img alt="" style="position: absolute; left: 0px; top: +15px; width: 160px; height: 120px;" src="'.$config['BASE_URL'].'/templates/frontend/' .$config['template']. '/images/'.private_photo('game').'" />';
    foreach ( $games as $game ) {
        $code[]     = '<div class="video_box_related">';
        $code[]     = '<a href="' .$config['BASE_URL']. '/game/' .$game['GID']. '/' .prepare_string($game['title']). '">';
        $code[]     = '<span class="font-13 font-bold">' .htmlspecialchars(truncate($game['title'], 20), ENT_QUOTES, 'UTF-8'). '</span><br />';
        $code[]     = '<img src="' .$config['BASE_URL']. '/media/games/tmb/' .$game['GID']. '.jpg" title="' .htmlspecialchars($game['title'], ENT_QUOTES, 'UTF-8'). '" alt="' .htmlspecialchars($game['title'], ENT_QUOTES, 'UTF-8'). '" width="160" height="120" /><br />';
		if ($game['type'] == 'private') {
			$code[] = $private_img;
		}
        $code[]     = '</a>';
        $code[]     = '<div class="vbox_rel_left">';
        $code[]     = time_range($game['addtime']);
        $code[]     = '</div>';
        $code[]     = '<div class="vbox_rel_right">';
        $code[]     = video_rating_small($game['rate']);
        $code[]     = '<div class="clear_right"></div>';
		$views		= ($game['total_plays'] == '1') ? $lang['global.play'] : $lang['global.plays'];
        $code[]     = $game['total_plays']. ' '.$views;
        $code[]     = '</div>';
        $code[]     = '<div class="clear"></div>';
        $code[]     = '</div>';
    }
    
    $data['page']   = $page;
    $data['status'] = ( $total_pages > 1 ) ? 1 : 0;
    $data['games']  = implode("\n", $code);
    $data['pages']  = $total_pages;
}

echo json_encode($data);
die();
?>
