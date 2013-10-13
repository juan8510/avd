<?php
defined('_VALID') or die('Restricted Access!');

require $config['BASE_DIR']. '/include/compat/json.php';
require $config['BASE_DIR']. '/include/adodb/adodb.inc.php';
require $config['BASE_DIR']. '/classes/pagination.class.php';
require $config['BASE_DIR']. '/include/dbconn.php';

$data   = array('status' => 0, 'msg' => '', 'code' => '', 'debug' => '');
if ( isset($_POST['page']) ) {
    if ( isset($_SESSION['uid']) ) {
        $uid            = intval($_SESSION['uid']);
        $page           = intval(trim($_POST['page']));
        $sql            = "SELECT count(VID) AS total_videos FROM playlist WHERE UID = " .$uid;
        $rs             = $conn->execute($sql);
        $total          = $rs->fields['total_videos'];
        $pagination     = new Pagination(8, $page);
        $limit          = $pagination->getLimit($total);      
        $sql            = "SELECT v.VID, v.title FROM video AS v, playlist AS p 
                           WHERE p.UID = " .$uid. " AND p.VID = v.VID
						   AND v.embed_code = ''
						   ORDER BY v.addtime DESC LIMIT " .$limit;
        $rs             = $conn->execute($sql);
        $videos         = $rs->getrows();
        $page_link      = $pagination->getPagination('media_content', 'p_mc_playlist_videos_');
        $start_num      = $pagination->getStartItem();
        $end_num        = $pagination->getEndItem();
        
        $code           = array();
        $code[]         = '<div class="box_insert">';
        $code[]         = '<div class="bsub">&nbsp;</div>';
        $code[]         = '<div class="btitle"><h2>'.$lang['ajax.ATTACH_VIDEO'].'</h2></div>';
        $code[]         = '<div class="blinkp">';
        $code[]         = $lang['user.playlist'].' <strong>&middot;</strong>';
        $code[]         = '<a href="#attach_favorite_videos" id="attach_mcp_favorite_videos">'.$lang['user.favorites'].'</a> <strong>&middot;</strong>';
        $code[]         = '<a href="#attach_my_videos" id="attach_mcp_my_videos">'.$lang['ajax.my_videos'].'</a>';
        $code[]         = '</div>';
        if ( $videos ) {
            foreach ( $videos as $video ) {
                $code[] = '<div class="video_box_attach">';
                $code[] = '<a href="#attach_playlist_video_' .$video['VID']. '" id="attach_media_video_' .$video['VID']. '"><img src="' .$config['BASE_URL']. '/media/videos/tmb/' .$video['VID']. '/1.jpg" alt="' .htmlspecialchars($video['title'], ENT_QUOTES, 'UTF-8'). '" width="120" /></a>';
                $code[] = '</div>';
            }
            $code[]     = '<div class="clear_left"></div>';
            $code[]     = '<br /><div class="pagination"><ul>' .$page_link. '</ul></div><br />';
        } else {
            $code[]     = '<div class="no_items">'.$lang['ajax.see_none'].'</div>';
        }
        $code[]         = '</div>';
        
        $data['status'] = 1;
        $data['code']   = implode("\n", $code);
    } else {
        $data['msg']    = $lang['ajax.video_login'];
    }
} else {
    $data['msg']        = 'Invalid request!';
}

echo json_encode($data);
die();
?>
