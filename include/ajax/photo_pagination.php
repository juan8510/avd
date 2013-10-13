<?php
defined('_VALID') or die('Restricted Access!');

if ( $config['photo_module'] == '0' ) {
    die();
}

require $config['BASE_DIR']. '/classes/filter.class.php';
require $config['BASE_DIR']. '/include/adodb/adodb.inc.php';
require $config['BASE_DIR']. '/include/compat/json.php';
require $config['BASE_DIR']. '/classes/pagination.class.php';
require $config['BASE_DIR']. '/include/dbconn.php';

$data           = array('items_code' => '', 'comments_code' => '');
$code           = array();
$items_code     = NULL;
if ( isset($_POST['photo_id']) && isset($_POST['page']) ) {
    $filter         = new VFilter();
    $pid            = $filter->get('photo_id', 'INTEGER');
    $page           = $filter->get('page', 'INTEGER');
    $uid            = ( isset($_SESSION['uid']) ) ? intval($_SESSION['uid']) : NULL;
    
    $sql            = "SELECT COUNT(CID) AS total_comments FROM photo_comments WHERE PID = " .$pid. " AND status = '1'";
    $rsc            = $conn->execute($sql);
    $total          = $rsc->fields['total_comments'];
    $pagination     = new Pagination(10, $page);
    $limit          = $pagination->getLimit($total);
    $sql            = "SELECT c.CID, c.UID, c.comment, c.addtime, s.username, s.photo, s.gender
                       FROM photo_comments AS c, signup AS s
                       WHERE PID = " .$pid. " AND status = '1' AND c.UID = s.UID 
                       ORDER BY addtime DESC LIMIT " .$limit;
    $rs             = $conn->execute($sql);
    $comments       = $rs->getrows();
    $page_link      = $pagination->getPagination('photo/' .$pid, 'p_photo_comments_' .$pid. '_');
    $page_link_u    = $pagination->getPagination('photo/' .$pid, 'pp_photo_comments_' .$pid. '_');
    $start_num      = $pagination->getStartItem();
    $end_num        = $pagination->getEndItem();
    
    $items_code     = $lang['global.showing'].' <strong>' .$start_num. '</strong> '.$lang['global.to'].' <strong>' .$end_num. '</strong> '.$lang['global.of'].' <strong>' .$total. '</strong> '.$lang['global.comments'].'.';
    if ( $comments ) {
        $code[]     = '<div class="pagination"><ul>' .$page_link. '</ul></div>';
        $code[]     = '<div id="comments_delimiter" style="display:none;"></div>';
        foreach ( $comments as $comment ) {
            $photo      = ( $comment['photo'] == '' ) ? 'nopic-' .$comment['gender']. '.gif' : $comment['photo'];
            $username   = $comment['username'];
            $code[]     = '<div id="photo_comment_' .$pid. '_' .$comment['CID']. '">';
            $code[]     = '<div id="delete_response_' .$commend['CID']. '" class="response" style="display: none;"></div>';
            $code[]     = '<div class="comment">';
            $code[]     = '<div class="comment_left"><a href="' .$config['BASE_URL']. '/user/' .$username. '"><img src="' .$config['BASE_URL']. '/media/users/' .$photo. '" width="60" title="' .$username. '" alt="' .$username. '" /></a></div>';
            $code[]     = '<div class="comment_right">';
            $code[]     = '<div class="comment_info"><a href="' .$config['BASE_URL']. '/user/' .$username. '">' .$username. '</a>&nbsp;<strong>-</strong>&nbsp;<span class="font-10">' .time_range($comment['addtime']). '</span></div>';
            $code[]     = '<p class="comment_body">' .nl2br(htmlspecialchars($comment['comment'], ENT_QUOTES, 'UTF-8')). '</p>';
            if ( $uid ) {
                $code[]   = '<div class="comment_actions">';
                if ( $comment['UID'] == $uid ) {
                    $code[] = '<a href="#delete_comment" id="delete_comment_photo_' .$comment['CID']. '_' .$pid. '">'.$lang['global.delete'].'</a> <strong>&middot;</strong>';                
                }
                $code[]  = '<a href="#report_spam" id="report_spam_' .$comment['CID']. '">'.$lang['global.report_spam'].'</a>';
                $code[]  = '</div>';
            }
            $code[] = '</div>';
            $code[] = '<div class="clear"></div>';
            $code[] = '</div>';
            $code[] = '</div>';
        }
        $code[]         = '<div class="pagination"><ul>' .$page_link_u. '</ul></div><br />';
    } else {
        $code[] = '<br />This photo contains has no comments!<br /><br />';
    }        
} 

$data['items_code']     = $items_code;
$data['comments_code']  = implode("\n", $code);

echo json_encode($data);
die();
?>
