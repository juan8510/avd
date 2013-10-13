<?php
define('_VALID', true);
require 'include/config.php';
require 'include/function_global.php';
require 'include/function_smarty.php';

if (isset($_SESSION['uid'])) {
    $vid = intval($_GET['id']);
    $sql = "SELECT VID FROM video WHERE VID = ".$vid." LIMIT 1";
    $conn->execute($sql);
    if ($conn->Affected_Rows()) {
		$file = $config['BASE_DIR']. '/media/videos/flv/'.$vid.'.flv';
		if (file_exists($file) && is_file($file) && is_readable($file)) {
	  		$conn->execute("UPDATE video SET download_num = download_num+1 WHERE VID = ".$vid." LIMIT 1");
	  		@ob_end_clean();
	  		if(ini_get('zlib.output_compression')) {
				ini_set('zlib.output_compression', 'Off');
	  		}
	    
	  		header('Content-Type: application/force-download');
	  		header('Content-Disposition: attachment; filename="'.basename($file).'"');
	  		header('Content-Transfer-Encoding: binary');
	  		header('Accept-Ranges: bytes');
	  		header('Cache-control: private');
	  		header('Pragma: private');
	  		header('Expires: Mon, 26 Jul 1997 05:00:00 GMT');
	  		header('Content-Length: ' .filesize($file));             
	  		readfile($file);
	  		exit();
		} else {
	  		VRedirect::go($config['BASE_URL']. '/error');
		}
    } else {
		VRedirect::go($config['BASE_URL']. '/error');
    }
} else {
    $_SESSION['error'] = $lang['download.error'];
    VRedirect::go($config['BASE_URL']. '/signup');
}

die();
?>
