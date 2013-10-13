<?php
defined('_VALID') or die('Restricted Access!');

require $config['BASE_DIR']. '/classes/filter.class.php';
require $config['BASE_DIR']. '/include/adodb/adodb.inc.php';
require $config['BASE_DIR']. '/include/compat/json.php';
require $config['BASE_DIR']. '/include/dbconn.php';

$data   = array('msg' => '', 'code' => '', 'pid' => 0, 'cid' => 0);
if ( isset($_POST['notice_id']) && isset($_POST['comment']) ) {
    if ( $config['notice_comments'] == '0' ) {
        $data['msg'] = $lang['ajax.notice_comment_disabled'];
    } elseif ( isset($_SESSION['uid']) ) {
        $spam   = false;
        if ( isset($_SESSION['n_comment_added']) ) {
            $delay  = intval($_SESSION['n_comment_added'])+30;
            if ( time() < $delay ) {
                $spam                       = true;
                $_SESSION['n_comment_added']  = time();
            }
        }

        if ( $spam ) {
            $data['msg'] = 'Please dont spam!';
        } else {
            $filter         = new VFilter();
            $uid            = intval($_SESSION['uid']);
            $nid            = $filter->get('notice_id', 'INTEGER');
            $comment        = $filter->get('comment');
            $sql            = "INSERT INTO notice_comments ( NID, UID, comment, addtime )
                               VALUES (" .$nid. ", " .$uid. ", '" .mysql_real_escape_string($comment). "', '" .time(). "')";
            $conn->execute($sql);
            $cid            = mysql_insert_id();
            $sql            = "UPDATE notice SET total_comments = total_comments+1 WHERE NID = " .$nid. " LIMIT 1";
            $conn->execute($sql);
        
            $username       = $_SESSION['username'];
            $photo          = ( $_SESSION['photo'] == '' ) ? 'nopic-' .$_SESSION['gender']. '.gif' : $_SESSION['photo'];                
            $code           = '<div id="notice_comment_' .$nid. '_' .$cid. '">';
            $code          .= '<div id="delete_response_' .$cid. '" class="response" style="display: none;"></div>';
            $code          .= '<div class="comment">';
            $code          .= '<div class="comment_left">';
            $code          .= '<a href="' .$config['BASE_URL']. '/user/' .$username. '"><img src="' .$config['BASE_URL']. '/media/users/' .$photo. '" width="60" title="' .$username. '\'s avatar" alt="' .$username. '\'s avatar" />';
            $code          .= '</div>';
            $code          .= '<div class="comment_right_notice">';
            $code          .= '<div class="comment_info_notice">';
            $code          .= '<a href="' .$config['BASE_URL']. '/user/' .$username. '">' .$username. '</a>&nbsp;<strong>-</strong>&nbsp;<span class="font-10">right now</span>';
            $code          .= '</div>';
            $code          .= '<p class="comment_body_notice">' .nl2br(htmlspecialchars($comment, ENT_QUOTES, 'UTF-8')). '</p>';
            $code          .= '<div class="comment_actions_notice">';
            $code          .= '<a href="#delete_comment" id="delete_notice_comment_' .$cid. '_' .$nid. '">Delete</a> <strong>&middot;</strong>';
            $code          .= '<a href="#report_spam" id="report_spam_' .$cid. '">Report Spam</a>';
            $code          .= '</div>';                                                                                          
            $code          .= '</div>';
            $code          .= '<div class="clear"></div>';        
            $code          .= '</div>';
            $code          .= '</div>';        
            $data['code']   = $code;
            $data['cid']    = $cid;
			$data['nid']	= $nid;
            $_SESSION['n_comment_added'] = time();
        }
    } else {
        $data['msg'] = $lang['ajax.notice_comment_login'];
    }
}

echo json_encode($data);
die();
?>
