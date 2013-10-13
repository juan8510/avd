<?php
defined('_VALID') or die('Restricted Access!');
require $config['BASE_DIR']. '/classes/auth.class.php';
require $config['BASE_DIR']. '/classes/filter.class.php';

if ( $config['blog_module'] == '0' ) {
    VRedirect::go($config['BASE_URL']. '/error/page_invalid');
}

$auth       = new Auth();
$auth->check();

$uid            = intval($_SESSION['uid']);
$username       = $_SESSION['username'];
$blog_title     = NULL;
$blog_content   = NULL;
if ( isset($_POST['blog_add_submit']) ) {
    $filter     = new VFilter();
    $title      = $filter->get('blog_title');
    $content    = $filter->get('blog_content');
    
    if ( $title == '' ) {
        $errors[]   = 'Blog title field cannot be blank!';
    } elseif ( strlen($title) > 99 ) {
        $errors[]   = 'Blot title cannot contain more then 99 characters!';
    } else {
        $blog_title = $title;
    }
    
    if ( $content == '' ) {
        $errors[]       = 'Blog content textarea cannot be blank!';
    } elseif ( strlen($content) > 2999 ) {
        $errors[]       = 'Blog content cannot contain more then 2999 characters!';
    } else {
        $blog_content   = $content;
    }
    
    if ( !$errors ) {    
        $search     = array('/\[b\](.*?)\[\/b\]/ms', '/\[i\](.*?)\[\/i\]/ms', '/\[u\](.*?)\[\/u\]/ms',
                            '/\[img\](.*?)\[\/img\]/ms', '/\[email\](.*?)\[\/email\]/ms', '/\[url\="?(.*?)"?\](.*?)\[\/url\]/ms',
                            '/\[size\="?(.*?)"?\](.*?)\[\/size\]/ms', '/\[color\="?(.*?)"?\](.*?)\[\/color\]/ms', '/\[quote](.*?)\[\/quote\]/ms',
                            '/\[list\=(.*?)\](.*?)\[\/list\]/ms', '/\[list\](.*?)\[\/list\]/ms', '/\[\*\]\s?(.*?)\n/ms');
        $replace    = array('<strong>\1</strong>', '<em>\1</em>', '<u>\1</u>', '<img src="\1" alt="\1" />',
                            '<a href="mailto:\1">\1</a>', '<a href="\1">\2</a>', '<span style="font-size:\1%">\2</span>',
                            '<span style="color:\1">\2</span>', '<blockquote>\1</blockquote>', '<ol start="\1">\2</ol>',
                            '<ul>\1</ul>', '<li>\1</li>');
        $content    = preg_replace($search, $replace, $content);
		$content    = preg_replace('/\[photo=(.*?)\]/ms', '<img src="' .$config['BASE_URL']. '/media/photos/tmb/\1.jpg" alt="" class="blog_image" />', $content);
		$content    = preg_replace('/\[video=(.*?)\]/ms', '<div class="blog_video"><div id="blog_video_\1"><embed src="' .$config['BASE_URL'].'/media/player/player.swf?f='.$config['BASE_URL']. '/media/player/config_blog.php?vkey=\1" quality="high" bgcolor="#000000" width="510" height="390" name="/AVS_video/avs" align="middle" allowFullScreen="true" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" /></div></div>', $content);
        $content    = str_replace("\r", "", $content);
        $content    = "<p>".ereg_replace("(\n){2,}", "</p><p>", $content)."</p>";
		$status     = ($config['approve_blogs'] == '1') ? 0 : 1;
        $sql        = "INSERT INTO blog (UID, title, content, addtime, adddate, status)
                       VALUES (" .$uid. ", '" .mysql_real_escape_string($title). "', '" .mysql_real_escape_string($content). "',
                               " .time(). ", '" .date('Y-m-d'). "', '".$status."')";
        $conn->execute($sql);
        $bid        = mysql_insert_id();
        $sql        = "UPDATE signup SET total_blogs = total_blogs+1, points = points+2 WHERE UID = " .$uid. " LIMIT 1";
        $conn->execute($sql);
        
        if ($config['approve_blogs'] == '1') {
    	    $messages[] = 'Created! Thank you for contributing ' .$config['site_name']. '. You will receive an email once your blog is published!';
        } else {
    	    $messages[] = 'Created! Thank you for contributing ' .$config['site_name']. '.
	    Check out your blog at <a href="' .$config['BASE_URL']. '/blog/'.$bid.'">' .htmlspecialchars($title, ENT_QUOTES, 'UTF-8'). '</a> in a minute!';    	                  
        }
        $blog_title = '';
        $blog_content = '';
    }                                                                                                                                       
}

$sql        = "SELECT * FROM signup WHERE UID = " .$uid. " LIMIT 1";
$rs         = $conn->execute($sql);
$user       = $rs->getrows();
$user       = $user['0'];

$smarty->assign('editor', true);
$smarty->assign('blog_title', $blog_title);
$smarty->assign('blog_content', $blog_content);
?>
