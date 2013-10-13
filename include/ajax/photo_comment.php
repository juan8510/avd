<?php
defined('_VALID') or die('Restricted Access!');

if ( $config['photo_module'] == '0' ) {
    die();
}

require $config['BASE_DIR']. '/classes/filter.class.php';
require $config['BASE_DIR']. '/include/adodb/adodb.inc.php';
require $config['BASE_DIR']. '/include/compat/json.php';
require $config['BASE_DIR']. '/include/dbconn.php';

$data   = array('msg' => '', 'code' => '', 'pid' => 0, 'cid' => 0);
if ( isset($_POST['photo_id']) && isset($_POST['album_id']) && isset($_POST['comment']) ) {
    if ( $config['photo_comments'] == '0' ) {
        $data['msg'] = $lang['ajax.photo_comment_disabled'];
    } elseif ( isset($_SESSION['uid']) ) {
        $spam   = false;
        if ( isset($_SESSION['p_comment_added']) ) {
            $delay  = intval($_SESSION['p_comment_added'])+30;
            if ( time() < $delay ) {
                $spam                       = true;
                $_SESSION['p_comment_added']  = time();
            }
        }

        if ( $spam ) {
            $data['msg'] = $lang['ajax.dont_spam'];
        } else {
            $filter         = new VFilter();
            $uid            = intval($_SESSION['uid']);
            $pid            = $filter->get('photo_id', 'INTEGER');
            $aid            = $filter->get('album_id', 'INTEGER');
            $comment        = $filter->get('comment');
            $sql            = "INSERT INTO photo_comments ( PID, UID, comment, addtime )
                               VALUES (" .$pid. ", " .$uid. ", '" .mysql_real_escape_string($comment). "', '" .time(). "')";
            $conn->execute($sql);
            $cid            = mysql_insert_id();
            $sql            = "UPDATE photos SET total_comments = total_comments+1 WHERE PID = " .$pid. " LIMIT 1";
            $conn->execute($sql);
            $sql            = "UPDATE albums SET total_comments = total_comments+1 WHERE AID = " .$aid. " LIMIT 1";
            $conn->execute($sql);
        
            $username       = $_SESSION['username'];
            $photo          = ( $_SESSION['photo'] == '' ) ? 'nopic-' .$_SESSION['gender']. '.gif' : $_SESSION['photo'];                
            $code           = '<div id="photo_comment_' .$pid. '_' .$cid. '">';
            $code          .= '<div id="delete_response_' .$cid. '" class="response" style="display: none;"></div>';
            $code          .= '<div class="comment">';
            $code          .= '<div class="comment_left">';
            $code          .= '<a href="' .$config['BASE_URL']. '/user/' .$username. '"><img src="' .$config['BASE_URL']. '/media/users/' .$photo. '" width="60" title="' .$username. '" alt="' .$username. '" />';
            $code          .= '</div>';
            $code          .= '<div class="comment_right">';
            $code          .= '<div class="comment_infi">';
            $code          .= '<a href="' .$config['BASE_URL']. '/user/' .$username. '">' .$username. '</a>&nbsp;<strong>-</strong>&nbsp;<span class="font-10">right now</span>';
            $code          .= '</div>';
            $code          .= '<p class="comment_body">' .nl2br(htmlspecialchars($comment, ENT_QUOTES, 'UTF-8')). '</p>';
            $code          .= '<div class="comment_actions">';
            $code          .= '<a href="#delete_comment" id="delete_comment_photo_' .$cid. '_' .$pid. '">'.$lang['global.delete'].'</a> <strong>&middot;</strong>';
            $code          .= '<a href="#report_spam" id="report_spam_' .$cid. '">'.$lang['global.report_spam'].'</a>';
            $code          .= '</div>';                                                                                          
            $code          .= '</div>';
            $code          .= '<div class="clear"></div>';        
            $code          .= '</div>';
            $code          .= '</div>';        
            $data['code']   = $code;
            $data['cid']    = $cid;
            $data['pid']    = $pid;
			$data['status'] = 1;
            $_SESSION['p_comment_added'] = time();
            
            $sql    = "SELECT a.UID, s.email, u.photo_comment 
                       FROM albums AS a, users_prefs AS u, signup AS s
                       WHERE a.AID = " .$aid. "
                       AND a.UID = u.UID
                       AND a.UID = s.UID
                       LIMIT 1";
            $rs     = $conn->execute($sql);
            if ( $conn->Affected_Rows() === 1 ) {
                $prefs_p_comment = $rs->fields['photo_comment'];
                if ( $prefs_p_comment == '1' ) {
                    $email          = $rs->fields['email'];
                    require $config['BASE_DIR']. '/classes/file.class.php';
                    require $config['BASE_DIR']. '/classes/email.class.php';
                    $photo_link     = $config['BASE_URL']. '/photo/' .$pid;
                    $search         = array('{$username}', '{$site_title}', '{$site_name}', '{$baseurl}', '{$photo_link}');
                    $replace        = array($_SESSION['username'], $config['site_title'], $config['site_name'], $config['BASE_URL'], $photo_link);
                    $mail           = new VMail();
                    $mail->sendPredefined($email, 'photo_comment', $search, $replace);
                }
            }
        }
    } else {
        $data['msg'] = $lang['ajax.photo_comment_login'];
    }
}

echo json_encode($data);
die();
?>
