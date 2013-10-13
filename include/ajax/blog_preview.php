<?php
defined('_VALID') or die('Restricted Access!');

if ( $config['blog_module'] == '0' ) {
    die();
}

require $config['BASE_DIR']. '/classes/filter.class.php';

$preview    = array();
$preview[]  = '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">';
$preview[]  = '<html xmlns="http://www.w3.org/1999/xhtml">';
$preview[]  = '<head>';
$preview[]  = '<title>Blog Preview</title>';
$preview[]  = '<link rel = "stylesheet" href = "' .$config['BASE_URL']. '/css/style_preview.css" type = "text/css" />';
$preview[]  = '<script type="text/javascript" src="{$relative}/js/jquery-1.2.6.pack.js"></script>';
$preview[]  = '<script type="text/javascript" src="' .$config['BASE_URL']. '/js/flashembed.min.js"></script>';
$preview[]  = '</head>';
$preview[]  = '<body';
$preview[]  = '<div class="box" style="width: 98%; margin: 0 auto;">';
$preview[]  = '<div class="bsub">&nbsp;</div>';
$preview[]  = '<div class="btitle"><h2>'.$lang['blog.title_here'].'</h2></div>';
$preview[]  = '<div class="blog_message">';

$html       = NULL;
if ( isset($_POST['data']) ) {
    $filter     = new VFilter();
    $html       = $filter->get('data');
    
    $search     = array('/\[b\](.*?)\[\/b\]/ms', '/\[i\](.*?)\[\/i\]/ms', '/\[u\](.*?)\[\/u\]/ms',
                        '/\[img\](.*?)\[\/img\]/ms', '/\[email\](.*?)\[\/email\]/ms', '/\[url\="?(.*?)"?\](.*?)\[\/url\]/ms',
                        '/\[size\="?(.*?)"?\](.*?)\[\/size\]/ms', '/\[color\="?(.*?)"?\](.*?)\[\/color\]/ms', '/\[quote](.*?)\[\/quote\]/ms',
                        '/\[list\=(.*?)\](.*?)\[\/list\]/ms', '/\[list\](.*?)\[\/list\]/ms', '/\[\*\]\s?(.*?)\n/ms');
    $replace    = array('<strong>\1</strong>', '<em>\1</em>', '<u>\1</u>', '<img src="\1" alt="\1" />',
                        '<a href="mailto:\1">\1</a>', '<a href="\1">\2</a>', '<span style="font-size:\1%">\2</span>',
                        '<span style="color:\1">\2</span>', '<blockquote>\1</blockquote>', '<ol start="\1">\2</ol>',
                        '<ul>\1</ul>', '<li>\1</li>');
    $html       = preg_replace($search, $replace, $html);
    $html       = preg_replace('/\[photo=(.*?)\]/ms', '<img src="' .$config['BASE_URL']. '/media/photos/tmb/\1.jpg" alt="" class="blog_image" />', $html);
    $html       = preg_replace('/\[video=(.*?)\]/ms', '<div class="blog_video"><div id="blog_video_\1"></div></div><script type="text/javascript">flashembed("blog_video_\1", {src:\'' .$config['RELATIVE']. '/media/players/FlowPlayerDark.swf\', width: 530, height: 400}, {config: { autoPlay: false, initialScale: \'scale\', videoFile: \'' .$config['BASE_URL']. '/media/videos/flv/\1.flv\'}});</script>', $html);
    $html       = str_replace("\r", "", $html);
    $html       = "<p>".ereg_replace("(\n){2,}", "</p><p>", $html)."</p>";
}

$preview[]  = $html;
$preview[]  = '</div>';
$preview[]  = '</div>';
$preview[]  = '</body>';
$preview[]  = '</html>';

echo implode("\n", $preview);
die();
?>
