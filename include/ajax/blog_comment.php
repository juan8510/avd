<?php
defined('_VALID') or die('Restricted Access!');

if ( $config['blog_module'] == '0' ) {
    die();
}

require $config['BASE_DIR']. '/classes/filter.class.php';
require $config['BASE_DIR']. '/include/adodb/adodb.inc.php';
require $config['BASE_DIR']. '/include/compat/json.php';
require $config['BASE_DIR']. '/include/dbconn.php';

$data   = array('msg' => '', 'code' => '', 'bid' => 0, 'cid' => 0);
if ( isset($_POST['blog_id']) && isset($_POST['comment']) ) {
    if ( $config['blog_comments'] == '0' ) {    
        $data['msg'] = $lang['ajax.blog_comment_disabled'];
    } elseif ( isset($_SESSION['uid']) ) {
        $spam   = false;
        if ( isset($_SESSION['b_comment_added']) ) {
            $delay  = intval($_SESSION['b_comment_added'])+30;
            if ( time() < $delay ) {
                $spam                           = true;
                $_SESSION['b_comment_added']    = time();
            }
        }
        
        if ( $spam ) {
            $data['msg'] = $lang['ajax.dont_spam'];
        } else {    
            $filter         = new VFilter();
            $uid            = intval($_SESSION['uid']);
            $bid            = $filter->get('blog_id', 'INTEGER');
            $comment        = $filter->get('comment');
            $comment        = preg_replace('/\[photo=(.*?)\]/ms', '<img src="' .$config['BASE_URL']. '/media/photos/tmb/\1.jpg" alt="" class="blog_image" />', $comment);
            $sql            = "INSERT INTO blog_comments ( BID, UID, comment, addtime )
                               VALUES (" .$bid. ", " .$uid. ", '" .mysql_real_escape_string($comment). "', '" .time(). "')";
            $conn->execute($sql);
            $cid            = mysql_insert_id();
            $sql            = "UPDATE blog SET total_comments = total_comments+1 WHERE BID = " .$bid. " LIMIT 1";
            $conn->execute($sql);
        
            $username       = $_SESSION['username'];
            $photo          = ( $_SESSION['photo'] == '' ) ? 'nopic-' .$_SESSION['gender']. '.gif' : $_SESSION['photo'];
            $code           = '<div id="blog_comment_' .$bid. '_' .$cid. '">';
            $code          .= '<div id="delete_response_' .$cid. '" class="response" style="display: none;"></div>';
            $code          .= '<div class="comment">';
            $code          .= '<div class="comment_left">';
            $code          .= '<a href="' .$config['BASE_URL']. '/user/' .$username. '"><img src="' .$config['BASE_URL']. '/media/users/' .$photo. '" width="60" title="' .$username. '" alt="' .$username. '" />';
            $code          .= '</div>';
            $code          .= '<div class="comment_right">';
            $code          .= '<div class="comment_infi">';
            $code          .= '<a href="' .$config['BASE_URL']. '/user/' .$username. '">' .$username. '</a>&nbsp;<strong>-</strong>&nbsp;<span class="font-10">'.$lang['global.right_now'].'</span>';
            $code          .= '</div>';
            $code          .= '<p class="comment_body">' .nl2br($comment). '</p>';
            $code          .= '<div class="comment_actions">';
            $code          .= '<a href="#delete_comment" id="delete_comment_blog_' .$cid. '_' .$bid. '">'.$lang['global.delete'].'</a> <strong>&middot;</strong> ';
            $code          .= '<a href="#report_spam" id="report_spam_' .$cid. '">'.$lang['global.report_spam'].'</a>';
            $code          .= '</div>';                                                                                          
            $code          .= '</div>';
            $code          .= '<div class="clear"></div>';        
            $code          .= '</div>';
            $code          .= '</div>';        
            $data['code']   = $code;
            $data['cid']    = $cid;
            $data['bid']    = $bid;
            $_SESSION['b_comment_added'] = time();
            
            $sql    = "SELECT b.UID, b.title, s.email, u.blog_comment  
                       FROM blog AS b, users_prefs AS u, signup AS s 
                       WHERE b.BID = " .$bid. " 
                       AND b.UID = u.UID 
                       AND b.UID = s.UID 
                       LIMIT 1";
            $rs     = $conn->execute($sql);
            if ( $conn->Affected_Rows() === 1 ) {
                $prefs_b_comment = $rs->fields['blog_comment'];
                if ( $prefs_b_comment == '1' ) {
                    $email          = $rs->fields['email'];
                    $title          = $rs->fields['title'];
                    require $config['BASE_DIR']. '/classes/file.class.php';
                    require $config['BASE_DIR']. '/classes/email.class.php';
                    $blog_link      = '<a href="' .$config['BASE_URL']. '/blog/' .$bid . '/' .prepare_string($title). '">' .$config['BASE_URL']. '/blog/' .$bid . '/' .prepare_string($title). '</a>';
                    $search         = array('{$username}', '{$site_title}', '{$site_name}', '{$baseurl}', '{$blog_link}');
                    $replace        = array($_SESSION['username'], $config['site_title'], $config['site_name'], $config['BASE_URL'], $blog_link);
                    $mail           = new VMail();
                    $mail->sendPredefined($email, 'blog_comment', $search, $replace);
                }
            }

        }
    } else {
        $data['msg'] = $lang['ajax.comment_login'];
    }
}

echo json_encode($data);
die();
?>
