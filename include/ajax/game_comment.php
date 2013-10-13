<?php
defined('_VALID') or die('Restricted Access!');

if ( $config['game_module'] == '0' ) {
    die();
}

require $config['BASE_DIR']. '/classes/filter.class.php';
require $config['BASE_DIR']. '/include/adodb/adodb.inc.php';
require $config['BASE_DIR']. '/include/compat/json.php';
require $config['BASE_DIR']. '/include/dbconn.php';

$data   = array('msg' => '', 'status' => 0, 'code' => '', 'vid' => 0, 'cid' => 0);
if ( isset($_POST['game_id']) && isset($_POST['comment']) ) {
    if ( $config['game_comments'] == '0' ) {
        $data['msg'] = $lang['ajax.game_comment_disabled'];
    } elseif ( isset($_SESSION['uid']) ) {
        $spam   = false;
        if ( isset($_SESSION['g_comment_added']) ) {
            $delay  = intval($_SESSION['g_comment_added'])+30;
            if ( time() < $delay ) {
                $spam = true;
                $_SESSION['g_comment_added'] = time();
            }
        }
		
        if ( $spam ) {
            $data['msg'] = $lang['ajax.dont_spam'];
        } else {
            $filter         = new VFilter();
            $uid            = intval($_SESSION['uid']);
            $gid            = $filter->get('game_id', 'INTEGER');
            $comment        = $filter->get('comment');
            $sql            = "INSERT INTO game_comments ( GID, UID, comment, addtime )
                               VALUES (" .$gid. ", " .$uid. ", '" .mysql_real_escape_string($comment). "', '" .time(). "')";
            $conn->execute($sql);
            $cid            = mysql_insert_id();
            $sql            = "UPDATE game SET total_comments = total_comments+1 WHERE GID = " .$gid. " LIMIT 1";
            $conn->execute($sql);
        
            $username       = $_SESSION['username'];
            $photo          = ( $_SESSION['photo'] == '' ) ? 'nopic-'.$_SESSION['gender'].'.gif' : $_SESSION['photo'];                
            $code           = '<div id="game_comment_' .$gid. '_' .$cid. '">';
            $code          .= '<div id="delete_response_' .$cid. '" class="response" style="display: none;"></div>';
            $code          .= '<div class="comment">';
            $code          .= '<div class="comment_left">';
            $code          .= '<a href="' .$config['BASE_URL']. '/user/' .$username. '"><img src="' .$config['BASE_URL']. '/media/users/' .$photo. '" width="60" title="' .$username. '" alt="' .$username. '" />';
            $code          .= '</div>';
            $code          .= '<div class="comment_right_video">';
            $code          .= '<div class="comment_info_video">';
            $code          .= '<a href="' .$config['BASE_URL']. '/user/' .$username. '">' .$username. '</a>&nbsp;<strong>-</strong>&nbsp;<span class="font-10">right now</span>';
            $code          .= '</div>';
            $code          .= '<p class="comment_body_video">' .nl2br(htmlspecialchars($comment, ENT_QUOTES, 'UTF-8')). '</p>';
            $code          .= '<div class="comment_actions_video">';
            $code          .= '<a href="#delete_comment" id="delete_comment_game_' .$cid. '_' .$gid. '">'.$lang['global.delete'].'</a> <strong>&middot;</strong>';
            $code          .= '<span id="reported_spam_' .$cid. '_' .$gid. '"><a href="#report_spam" id="report_spam_game_' .$cid. '_' .$gid. '">'.$lang['global.report_spam'].'</a></span>';
            $code          .= '</div>';
            $code          .= '</div>';
            $code          .= '<div class="clear"></div>';        
            $code          .= '</div>';
            $code          .= '</div>';
			$data['status'] = 1;   
            $data['code']   = $code;
            $data['cid']    = $cid;
            $data['gid']    = $gid;
			$data['msg']    = $lang['global.comment_success'];
            $_SESSION['g_comment_added'] = time();
            
            $sql    = "SELECT g.title, s.username, s.email, u.game_comment
                       FROM game AS g, signup AS s, users_prefs AS u 
                       WHERE g.GID = " .$gid. "
                       AND g.UID = s.UID
                       AND s.UID = u.UID 
                       LIMIT 1";
            $data['debug'] = $sql;
            $rs     = $conn->execute($sql);
            if ( $conn->Affected_Rows() === 1 ) {
                $prefs_g_comment = $rs->fields['game_comment'];
                if ( $prefs_g_comment == '1' ) {
                    $email          = $rs->fields['email'];
                    $username       = $rs->fields['username'];
                    $title          = $rs->fields['title'];
                    require $config['BASE_DIR']. '/classes/file.class.php';
                    require $config['BASE_DIR']. '/classes/email.class.php';
                    $game_link      = $config['BASE_URL']. '/game/' .$gid. '/' .prepare_string($title);
                    $search         = array('{$username}', '{$site_title}', '{$site_name}', '{$baseurl}', '{$game_link}');
                    $replace        = array($_SESSION['username'], $config['site_title'], $config['site_name'], $config['BASE_URL'], $game_link);
                    $mail           = new VMail();
                    $mail->sendPredefined($email, 'game_comment', $search, $replace);
                }
            }

        }
    } else {
        $data['msg'] = $lang['ajax.game_comment_login'];
    }
}

echo json_encode($data);
die();
?>
