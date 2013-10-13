<?php
defined('_VALID') or die('Restricted Access!');

require $config['BASE_DIR']. '/classes/filter.class.php';
require $config['BASE_DIR']. '/include/adodb/adodb.inc.php';
require $config['BASE_DIR']. '/include/compat/json.php';
require $config['BASE_DIR']. '/include/dbconn.php';

$data   = array('status' => 0, 'msg' => '', 'code' => '', 'wid' => 0, 'cid' => 0);
if ( isset($_POST['user_id']) && isset($_POST['comment']) ) {
    if ( $config['wall_comments'] == '0' ) {
        $data['msg'] = $lang['ajax.wall_comment_disabled'];
    } elseif ( isset($_SESSION['uid']) ) {
        $spam   = false;
        if ( isset($_SESSION['w_comment_added']) ) {
            $delay  = intval($_SESSION['w_comment_added'])+30;
            if ( time() < $delay ) {
                $spam                       = true;
                $_SESSION['w_comment_added']  = time();
            }            
        }
  		
		$spam = false;
        if ( $spam ) {
            $data['msg']    = $lang['ajax.dont_spam'];
        } else {                    
            $filter         = new VFilter();
            $uid            = intval($_SESSION['uid']);
            $oid            = $filter->get('user_id', 'INTEGER');
            $comment        = $filter->get('comment');
            $comment        = preg_replace('/\[photo=(.*?)\]/ms', '<img src="' .$config['BASE_URL']. '/media/photos/tmb/\1.jpg" alt="" class="blog_image" />', $comment);
            $comment	    = preg_replace('/\[video=(.*?)\]/ms', '<div class="blog_video"><div id="blog_video_\1"><embed src="' .$config['BASE_URL'].'/media/player/player.swf?f='.$config['BASE_URL']. '/media/player/config_blog.php?vkey=\1" quality="high" wmode="transparent" width="510" height="390" name="/AVS_video/avs" align="middle" allowFullScreen="true" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" /></div></div>', $comment);
            $sql            = "INSERT INTO wall (OID, UID, message, addtime) 
                               VALUES (" .$oid. ", " .$uid. ", '" .mysql_real_escape_string($comment). "', " .time(). ")";
            $conn->execute($sql);
            $cid            = mysql_insert_id();
            $username       = $_SESSION['username'];
            $photo          = ( $_SESSION['photo'] == '' ) ? 'nopic-' .$_SESSION['gender']. '.gif' : $_SESSION['photo'];                
            $code           = '<div id="wall_comment_' .$oid. '_' .$cid. '">';
            $code          .= '<div id="delete_response_' .$cid. '" class="response" style="display: none;"></div>';
            $code          .= '<div class="comment">';
            $code          .= '<div class="comment_left">';
            $code          .= '<a href="' .$config['BASE_URL']. '/user/' .$username. '"><img src="' .$config['BASE_URL']. '/media/users/' .$photo. '" width="60" title="' .$username. '\'s avatar" alt="' .$username. '\'s avatar" />';
            $code          .= '</div>';
            $code          .= '<div class="comment_right">';
            $code          .= '<div class="comment_infi">';
            $code          .= '<a href="' .$config['BASE_URL']. '/user/' .$username. '">' .$username. '</a>&nbsp;<strong>-</strong>&nbsp;<span class="font-10">right now</span>';
            $code          .= '</div>';
            $code          .= '<p class="comment_body">' .nl2br($comment). '</p>';
            $code          .= '<div class="comment_actions">';
            $code          .= '<a href="#delete_comment" id="delete_comment_' .$cid. '_' .$oid. '">Delete</a> <strong>&middot;</strong>';
            $code          .= '<span id="#reported_spam_' .$cid. '_' .$oid. '"><a href="#report_spam" id="report_spam_wall' .$cid. '_' .$oid. '">Report Spam</a></span>';
            $code          .= '</div>';                                                                                          
            $code          .= '</div>';
            $code          .= '<div class="clear"></div>';        
            $code          .= '</div>';
            $code          .= '</div>';        
            $data['code']   = $code;
            $data['cid']    = $cid;
            $data['wid']    = $oid;
			$data['status'] = 1;
			$data['msg'] 	= $lang['global.comment_success'];
            $_SESSION['w_comment_added'] = time();
                        
            $sql    = "SELECT s.username, s.email, u.wall_write
                       FROM signup AS s, users_prefs AS u
                       WHERE s.UID = " .$oid. "
                       AND s.UID = u.UID
                       LIMIT 1";
            $rs     = $conn->execute($sql);
            if ( $conn->Affected_Rows() === 1 ) {
                $prefs_w_comment = $rs->fields['wall_write'];
                if ( $prefs_w_comment == '1' ) {
                    $email          = $rs->fields['email'];
                    $username       = $rs->fields['username'];
                    require $config['BASE_DIR']. '/classes/file.class.php';
                    require $config['BASE_DIR']. '/classes/email.class.php';
                    $wall_link      = $config['BASE_URL']. '/user/' .$username. '/wall';
                    $search         = array('{$username}', '{$site_title}', '{$site_name}', '{$baseurl}', '{$video_link}');
                    $replace        = array($_SESSION['username'], $config['site_title'], $config['site_name'], $config['BASE_URL'], $wall_link);
                    $mail           = new VMail();
                    $mail->sendPredefined($email, 'wall_comment', $search, $replace);
                }
            }
        }
    } else {
        $data['msg'] = $lang['ajax.wall_comment_login'];
    }
}

echo json_encode($data);
die();
?>
