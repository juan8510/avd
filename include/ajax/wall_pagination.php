<?php
defined('_VALID') or die('Restricted Access!');

require $config['BASE_DIR']. '/classes/filter.class.php';
require $config['BASE_DIR']. '/include/adodb/adodb.inc.php';
require $config['BASE_DIR']. '/include/compat/json.php';
require $config['BASE_DIR']. '/classes/pagination.class.php';
require $config['BASE_DIR']. '/include/dbconn.php';

$code           = array();
if ( isset($_POST['user_id']) && isset($_POST['page']) ) {
    $filter         = new VFilter();
    $oid            = $filter->get('user_id', 'INTEGER');
    $page           = $filter->get('page', 'INTEGER');
    $uid            = ( isset($_SESSION['uid']) ) ? intval($_SESSION['uid']) : NULL;
    
    $sql            = "SELECT username FROM signup WHERE UID = " .$oid. " LIMIT 1";
    $rs             = $conn->execute($sql);
    $username       = $rs->fields['username'];
    
    $sql            = "SELECT COUNT(wall_id) AS total_walls FROM wall WHERE OID = " .$oid;
    $rsc            = $conn->execute($sql);
    $total          = $rsc->fields['total_walls'];
    $pagination     = new Pagination(10, $page);
    $limit          = $pagination->getLimit($total);
    $sql            = "SELECT w.wall_id, w.UID, w.message, w.addtime, u.username, u.photo, u.gender
                       FROM wall AS w, signup AS u WHERE w.OID = " .$oid. " AND w.status = '1' AND w.UID = u.UID 
                       ORDER BY w.addtime DESC LIMIT " .$limit;
    $rs             = $conn->execute($sql);
    $comments       = $rs->getrows();
    $page_link      = $pagination->getPagination('user/' .$username. '/wall', 'p_wall_comments_' .$oid. '_');
    $page_link_b    = $pagination->getPagination('user/' .$username. '/wall', 'pp_wall_comments_' .$oid. '_');
    $start_num      = $pagination->getStartItem();
    $end_num        = $pagination->getEndItem();
    
    $code[]         = '<div class="blinkp">';
    $code[]         = $lang['global.showing']. ' <strong>' .$start_num. '</strong> '.$lang['global.to'].' <strong>' .$end_num. '</strong> '.$lang['global.of'].' <strong>' .$total. '</strong> '.$lang['global.comments'].'.';
    $code[]         = '</div>';
    if ( $comments ) {
        $code[]     = '<div class="pagination"><ul>' .$page_link. '</ul></div>';
        $code[]     = '<div id="comments_delimiter" style="display:none;"></div>';
        foreach ( $comments as $comment ) {
            $photo      = ( $comment['photo'] == '' ) ? 'nopic-' .$comment['gender']. '.gif' : $comment['photo'];
            $username   = $comment['username'];
            $code[]     = '<div id="wall_comment_' .$oid. '_' .$comment['wall_id']. '">';
            $code[]     = '<div id="delete_response_' .$comment['wall_id']. '" class="response" style="display: none;"></div>';
            $code[]     = '<div class="comment">';
            $code[]     = '<div class="comment_left"><a href="' .$config['BASE_URL']. '/user/' .$username. '"><img src="' .$config['BASE_URL']. '/media/users/' .$photo. '" width="60" title="' .$username. '" alt="' .$username. '" /></a></div>';
            $code[]     = '<div class="comment_right">';
            $code[]     = '<div class="comment_info"><a href="' .$config['BASE_URL']. '/user/' .$username. '">' .$username. '</a>&nbsp;<strong>-</strong>&nbsp;<span class="font-10">' .time_range($comment['addtime']). '</span></div>';
            $code[]     = '<p class="comment_body">' .nl2br(htmlspecialchars($comment['message'], ENT_QUOTES, 'UTF-8')). '</p>';
            if ( $uid ) {
                $code[]   = '<div class="comment_actions">';
                if ( $comment['UID'] == $uid ) {
                    $code[] = '<a href="#delete_comment" id="delete_comment_wall_' .$comment['wall_id']. '_' .$oid. '">'.$lang['global.delete'].'</a> <strong>&middot;</strong>';                
                }
                $code[]  = '<span id="reported_spam_' .$comment['wall_id']. '_' .$oid. '"><a href="#report_spam" id="report_spam_wall_' .$comment['wall_id']. '_' .$oid. '">'.$lang['global.report_spam'].'</a></span>';
                $code[]  = '</div>';
            }
            $code[] = '</div>';
            $code[] = '<div class="clear"></div>';
            $code[] = '</div>';
            $code[] = '</div>';
        }
        $code[]         = '<div class="pagination"><ul>' .$page_link_b. '</ul></div>';
    } else {
        $code[] = '<br />This wall contains has no comments!<br /><br />';
    }        
} 

echo implode("\n", $code);
die();
?>
