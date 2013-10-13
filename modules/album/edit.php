<?php
defined('_VALID') or die('Restricted Access!');

require $config['BASE_DIR']. '/classes/auth.class.php';
$auth   = new Auth();
$auth->check();

// we dont cache anything here...needed for the album avatar update!
header('Expires: Mon, 26 Jul 1997 05:00:00 GMT');
header('Cache-Control: no-store, no-cache, must-revalidate');
header('Cache-Control: post-check=0, pre-check=0', false);
header('Pragma: no-cache');

if ( isset($_SESSION['uid']) && $uid != $_SESSION['uid'] ) {
    VRedirect::go($config['BASE_URL']. '/error/album_permission');
}

if ( isset($_POST['submit_album_edit']) ) {
    require $config['BASE_DIR']. '/classes/filter.class.php';
    require $config['BASE_DIR']. '/classes/image.class.php';
    $filter     = new VFilter();
    $name       = $filter->get('album_name');
    $category   = $filter->get('album_category');
    $tags       = $filter->get('album_tags');
    $type       = $filter->get('album_type');
    $x          = $filter->get('x1', 'INTEGER');
    $y          = $filter->get('y1', 'INTEGER');
    $width      = $filter->get('width', 'INTEGER');
    $height     = $filter->get('height', 'INTEGER');
    $pid        = $filter->get('photo', 'INTEGER');
    $random     = $filter->get('random');
    
    if ( $name == '' ) {
        $errors[]   = $lang['album.name_empty'];
    }
    
    if ( $category == '0' ) {
        $errors[]   = $lang['album.category_empty'];
    }
    
    if ( $tags == '' ) {
        $errors[]   = $lang['album.tags_empty'];
	} else {
		$tags = prepare_string($tags, false);
	}
    
    if ( $type == '' ) {
        $errors[]   = $lang['album.type_empty'];
    }
    
    if ( !$errors ) {
        $src    = $config['BASE_DIR']. '/tmp/albums/' .$pid. '_' .$random. '.jpg';
        $dst    = $config['BASE_DIR']. '/media/albums/' .$aid. '.jpg';
        if ( file_exists($src) && is_file($src) ) {
            $image  = new VImageConv();
            $image->process($src, $dst, 'EXACT', 120, 140);
            $image->crop($x, $y, $width, $height, true);
            unlink($src);
        }
        
        $type   = ( $type == 'public' or $type == 'private' ) ? $type : 'public';
        $sql    = "UPDATE albums SET name = '" .mysql_real_escape_string($name). "', category = " .intval($category). ",
                                     tags = '" .mysql_real_escape_string($tags). "', type = '" .$type. "'
                   WHERE AID = " .$aid;
        $conn->execute($sql);
        $messages[] = $lang['album.edit_msg'];
    }
}

$sql        = "SELECT PID, caption FROM photos WHERE AID = " .$aid. " AND status = '1' ORDER BY PID ASC";
$rs         = $conn->execute($sql);
$photos     = $rs->getrows();

$smarty->assign('crop', true);
$smarty->assign('photos', $photos);
$smarty->assign('categories', get_categories());
?>
