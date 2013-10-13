<?php
defined('_VALID') or die('Restricted Access!');

require $config['BASE_DIR']. '/classes/filter.class.php';
require $config['BASE_DIR']. '/include/adodb/adodb.inc.php';
require $config['BASE_DIR']. '/include/compat/json.php';
require $config['BASE_DIR']. '/classes/pagination.class.php';
require $config['BASE_DIR']. '/include/dbconn.php';

$data           = array('comments_code' => '');
$code           = array();
$items_code     = NULL;
if ( isset($_POST['notice_id']) && isset($_POST['page']) ) {
    $filter         = new VFilter();
    $nid            = $filter->get('notice_id', 'INTEGER');
    $page           = $filter->get('page', 'INTEGER');
    $uid            = ( isset($_SESSION['uid']) ) ? intval($_SESSION['uid']) : NULL;
    
    $sql            = "SELECT COUNT(CID) AS total_comments FROM notice_comments WHERE NID = " .$nid. " AND status = '1'";
    $rsc            = $conn->execute($sql);
    $total          = $rsc->fields['total_comments'];
    $pagination     = new Pagination(10, $page);
    $limit          = $pagination->getLimit($total);
    $sql            = "SELECT c.CID, c.UID, c.comment, c.addtime, s.username, s.photo, s.gender
                       FROM notice_comments AS c, signup AS s  
                       WHERE c.NID = " .$nid. " AND c.status = '1' AND c.UID = s.UID 
                       ORDER BY c.addtime DESC LIMIT " .$limit;
    $rs             = $conn->execute($sql);
    $comments       = $rs->getrows();
    $page_link      = $pagination->getPagination('notice/' .$nid, 'p_notice_comments_' .$nid. '_');
    $page_link_u    = $pagination->getPagination('notice/' .$nid, 'pp_notice_comments_' .$nid. '_');
    $start_num      = $pagination->getStartItem();
    $end_num        = $pagination->getEndItem();
    
    if ( $comments ) {
        $code[]     = '<div class="blinkp">'.$lang['global.showing'].' <strong>' .$start_num .'</strong> '.$lang['global.to'].' <strong>' .$end_num. '</strong> '.$lang['global.of'].' <strong>' .$total. '</strong> '.$lang['global.comments'].'.</div>';
        $code[]     = '<div class="pagination"><ul>' .$page_link. '</ul></div>';
        $code[]     = '<div id="comments_delimiter" style="display:none;"></div>';
        foreach ( $comments as $comment ) {
            $photo      = ( $comment['photo'] == '' ) ? 'nopic-'.$_SESSION['gender'].'.gif' : $comment['photo'];
            $username   = $comment['username'];
            $code[]     = '<div id="notice_comment_' .$nid. '_' .$comment['CID']. '">';
            $code[]     = '<div id="delete_response_' .$comment['CID']. '" class="response" style="display: none;"></div>';
            $code[]     = '<div class="comment">';
            $code[]     = '<div class="comment_left"><a href="' .$config['BASE_URL']. '/user/' .$username. '"><img src="' .$config['BASE_URL']. '/media/users/' .$photo. '" width="60" title="' .$username. '\' avatar" alt="' .$username. '\' avatar" /></a></div>';
            $code[]     = '<div class="comment_right_notice">';
            $code[]     = '<div class="comment_info_notice"><a href="' .$config['BASE_URL']. '/user/' .$username. '">' .$username. '</a>&nbsp;<strong>-</strong>&nbsp;<span class="font-10">' .time_range($comment['addtime']). '</span></div>';
            $code[]     = '<p class="comment_body_notice">' .nl2br(htmlspecialchars($comment['comment'], ENT_QUOTES, 'UTF-8')). '</p>';
            if ( $uid ) {
                $code[]   = '<div class="comment_actions_notice">';
                if ( $comment['UID'] == $uid ) {
                    $code[] = '<a href="#delete_comment" id="delete_comment_notice' .$comment['CID']. '_' .$nid. '">'.$lang['global.delete'].'</a> <strong>&middot;</strong>';                
                }
                $code[]  = '<a href="#report_spam" id="report_spam_notice_comment' .$comment['CID']. '">'.$lang['global.report_spam'].'</a>';
                $code[]  = '</div>';
            }
            $code[] = '</div>';
            $code[] = '<div class="clear"></div>';
            $code[] = '</div>';
            $code[] = '</div>';
        }
        $code[]         = '<div class="pagination"><ul>' .$page_link_u. '</ul></div><br />';
    } else {
        $code[] = '<br />This notice contains has no comments!<br /><br />';
    }        
} 

$data['comments_code']  = implode("\n", $code);

echo json_encode($data);
die();
?>
