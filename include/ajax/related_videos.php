<?php
defined('_VALID') or die('Restricted Access!');

require $config['BASE_DIR']. '/classes/filter.class.php';
require $config['BASE_DIR']. '/include/adodb/adodb.inc.php';
require $config['BASE_DIR']. '/classes/pagination.class.php';
require $config['BASE_DIR']. '/include/compat/json.php';
require $config['BASE_DIR']. '/include/dbconn.php';

$data   = array('status' => 0, 'videos' => '', 'page' => 0, 'pages' => 0, 'debug' => '');
if ( isset($_POST['video_id']) && isset($_POST['move']) && isset($_POST['page']) ) {
    $filter         = new VFilter();
    $vid            = $filter->get('video_id', 'INTEGER');
    $page           = $filter->get('page', 'INTEGER');
    $move           = ( $_POST['move'] == 'next' ) ? 'next' : 'prev';
    if ( $move == 'prev' ) {
        $page   = ( $page < 1 ) ? 1: $page-1;
    } else {
        $page   = $page+1;
    }
    
    $sql            = "SELECT title, channel, keyword, type FROM video WHERE VID = " .$vid. " LIMIT 1";
    $rs             = $conn->execute($sql);
    $video          = $rs->getrows();
    $video          = $video['0'];
    
    $sql_add        = NULL;
    if ( $video['keyword'] ) {
        $keywords   = explode(' ', $video['keyword']);
        $sql_add   .= " OR (";
        $sql_or     = NULL;
        foreach ( $keywords as $keyword ) {
            $sql_add .= $sql_or. " keyword LIKE '%" .mysql_real_escape_string($keyword). "%'";
            $sql_or   = " OR ";
        }
        $sql_add   .= ")";
    }
    
	$type			= ($config['show_private_videos'] == '1') ? '' : " AND type = 'public'";
    $sql            = "SELECT COUNT(VID) AS total_videos FROM video WHERE channel = '" .$video['channel']. "' AND VID != " .$vid. "
					   AND active = '1'" .$type. "
                       AND ( title LIKE '%" .mysql_real_escape_string($video['title']). "%' " .$sql_add. ")";
    $rs             = $conn->execute($sql);
    $total          = $rs->fields['total_videos'];
    if ( $total > 100 ) {
	$total = 100;
    }
    $total          = ( $total > 100 ) ? 100 : $total;
    $pagination     = new Pagination(10, $page);
    $limit          = $pagination->getLimit($total);
    $sql            = "SELECT VID, title, duration, addtime, rate, viewnumber, type, thumb
	                   FROM video 
                       WHERE channel = '" .intval($video['channel']). "' AND VID != " .$vid. "
					   AND active = '1'" .$type. "
                       AND ( title LIKE '%" .mysql_real_escape_string($video['title']). "%' " .$sql_add. ")
                       ORDER BY addtime DESC LIMIT " .$limit;
    $rs             = $conn->execute($sql);
    $videos         = $rs->getrows();
    $code           = array();
    $total_pages    = $pagination->getTotalPages();
    $page           = ( $page >= $total_pages ) ? $total_pages : $page;
	$private_img    = '<img alt="" style="position: absolute; left: 0px; top: +0px; width: 160px; height: 120px;" src="'.$config['BASE_URL'].'/templates/frontend/' .$config['template']. '/images/'.private_photo('video').'" />';
    foreach ( $videos as $video ) {
        $code[]     = '<div class="video_box_related">';
        $code[]     = '<a href="' .$config['BASE_URL']. '/video/' .$video['VID']. '/' .prepare_string($video['title']). '">';
        $code[]     = '<span class="font-13 font-bold">' .htmlspecialchars(truncate($video['title'], 21), ENT_QUOTES, 'UTF-8'). '</span><br />';
        $code[]     = '<img src="' .$config['BASE_URL']. '/media/videos/tmb/' .$video['VID']. '/'.$video['thumb'].'.jpg" title="' .htmlspecialchars($video['title'], ENT_QUOTES, 'UTF-8'). '" alt="' .htmlspecialchars($video['title'], ENT_QUOTES, 'UTF-8'). '" width="160" height="120" id="rotate_' .$video['VID']. '" /><br />';
		if ($video['type'] == 'private') {
			$code[] = $private_img;
		}
        $code[]     = '</a>';
        $code[]     = '<div class="vbox_rel_left">';
        $code[]     = duration($video['duration']). '<br />';
        $code[]     = time_range($video['addtime']);
        $code[]     = '</div>';
        $code[]     = '<div class="vbox_rel_right">';
        $code[]     = video_rating_small($video['rate']);
        $code[]     = '<div class="clear_right"></div>';
		$views      = ($video['viewnumber'] == '1') ? $lang['global.view'] : $lang['global.views'];
        $code[]     = $video['viewnumber']. ' '.$views;
        $code[]     = '</div>';
        $code[]     = '<div class="clear"></div>';
        $code[]     = '</div>';
    }
    
    $data['page']   = $page;
    $data['status'] = ( $total_pages > 1 ) ? 1 : 0;
    $data['videos'] = implode("\n", $code);
    $data['pages']  = $total_pages;
}

echo json_encode($data);
die();
?>
