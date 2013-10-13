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
        $sql            = "SELECT COUNT(PID) AS total_photos FROM photo_favorites
                           WHERE UID = " .$uid;
        $rs             = $conn->execute($sql);
        $total          = $rs->fields['total_photos'];
        $pagination     = new Pagination(8, $page);
        $limit          = $pagination->getLimit($total);      
        $sql            = "SELECT p.PID, p.caption FROM photos AS p, photo_favorites AS f 
                           WHERE f.UID = " .$uid. " AND p.PID = f.PID ORDER BY p.PID DESC LIMIT " .$limit;
        $rs             = $conn->execute($sql);
        $photos         = $rs->getrows();
        $page_link      = $pagination->getPagination('media_content', 'p_mc_favorite_photos_');
        $start_num      = $pagination->getStartItem();
        $end_num        = $pagination->getEndItem();
        
        $code           = array();
        $code[]         = '<div class="box_insert">';
        $code[]         = '<div class="bsub">&nbsp;</div>';
        $code[]         = '<div class="btitle"><h2>'.$lang['ajax.ATTACH_PHOTO'].'</h2></div>';
        $code[]         = '<div class="blinkp">';
        $code[]         = '<a href="#attach_my_photos" id="attach_mcp_my_photos">'.$lang['ajax.my_photos'].'</a> <strong>&middot;</strong>';
        $code[]         = $lang['user.favorites'];
        $code[]         = '</div>';
        if ( $photos ) {
            $index      = 0;
            $code[]     = '<div class="photo_row">';
            foreach ( $photos as $photo ) {
                if ( $index == 4 ) {
                    $code[] = '</div><div class="clear_left"></div><div class="photo_row">';
                }
                $code[] = '<div id="attach_favorite_photo_' .$photo['PID']. '" class="photo_box_small">';
                $code[] = '<a href="#attach_favorite_photo" id="attach_media_photo_' .$photo['PID']. '"><img src="' .$config['BASE_URL']. '/media/photos/tmb/' .$photo['PID']. '.jpg" alt="' .htmlspecialchars($photo['caption'], ENT_QUOTES, 'UTF-8'). '" width="120" /></a>';
                $code[] = '</div>';
                ++$index;
            }            
            $code[]     = '</div>';
            $code[]     = '<div class="clear_left"></div>';
            $code[]     = '<br /><div class="pagination"><ul>' .$page_link. '</ul></div><br />';
        } else {
            $code[]     = '<div class="no_items">'.$lang['ajax.see_none'].'</div>';
        }
        $code[]         = '</div>';
        
        $data['status'] = 1;
        $data['code']   = implode("\n", $code);
    } else {
        $data['msg']    = $lang['ajax.photo_login'];
    }
} else {
    $data['msg']        = 'Invalid request!';
}

echo json_encode($data);
die();
?>
