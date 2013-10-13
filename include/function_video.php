<?php
defined('_VALID') or die('Restricted Access!');

function get_video_duration($video_path, $video_id)
{
    global $config;
    $cmd = $config['mplayer']. ' -quiet -nolirc -vo null -ao null -frames 0 -identify "' .$video_path. '"';
    log_conversion($config['LOG_DIR']. '/' .$video_id. '.log', $cmd);
    exec($cmd, $output);
    log_conversion($config['LOG_DIR']. '/' .$video_id. '.log', implode("\n", $output));
    while ( list($k,$v) = each($output) ) {
        if ( $length = strstr($v, 'ID_LENGTH=') ) {
            break;
        }
    }
    
    if ( isset($length) ) {
        $lx = explode('=', $length);
        
        return $lx['1'];
    }
    
    return '0';
}

function extract_video_thumbs($video_path, $video_id)
{
    global $config;
    
    $duration   = get_video_duration($video_path, $video_id);
    if ( $duration > 180 ) {
        $ss     = 60;
        $step   = 5;
    } elseif ( $duration > 120 ) {
        $ss     = 15;
        $step   = 5;
    } elseif ( $duration > 60 ) {
        $ss     = 10;
        $step   = 2;
    } else {
        $ss     = 1;
        $step   = 1;
    }
    
    $i = 0;
    mkdir($config['TMP_DIR']. '/thumbs/' .$video_id);
    mkdir($config['TMB_DIR']. '/' .$video_id);
    while($i <= 20 ) {
		$width  = $config['img_max_width'];
		$height = $config['img_max_height'];
		if ($i == 0) {
			$width  = 320;
			$height = 240;
		}
	
        if ( $config['thumbs_tool'] == 'ffmpeg' ) {
            $cmd    = $config['ffmpeg']. ' -i ' .$video_path. ' -f image2 -ss ' .$ss. ' -s ' .$width. 'x' .$height. ' -vframes 2 -y ' .$config['TMP_DIR']. '/thumbs/' .$video_id. '/%08d.jpg';
        } else {
            $cmd    = $config['mplayer']. ' ' .$video_path. ' -ss ' .$ss. ' -nosound -vop scale='.$width.':'.$height.' -vo jpeg:outdir=' .$config['TMP_DIR']. '/thumbs/' .$video_id. ' -frames 2';
        }
        
        log_conversion($config['LOG_DIR']. '/' .$video_id. '.log', $cmd);
        exec($cmd. ' 2>&1', $output);
        log_conversion($config['LOG_DIR']. '/' .$video_id. '.log', implode("\n", $output));
        
        if ( file_exists($config['TMP_DIR']. '/thumbs/' .$video_id. '/00000002.jpg') ) {
            $src    = $config['TMP_DIR']. '/thumbs/' .$video_id. '/00000002.jpg';
        } else {
            $src    = $config['TMP_DIR']. '/thumbs/' .$video_id. '/00000001.jpg';
        }
        $dst    = ( $i == 0 ) ? $config['TMB_DIR']. '/' .$video_id. '/default.jpg' : $config['TMB_DIR']. '/' .$video_id. '/' .$i. '.jpg';
        log_conversion($config['LOG_DIR']. '/' .$video_id. '.log', $src. "\n" .$dst);
        copy($src, $dst);
        
        $ss = $ss+$step;
        if ( $ss > $duration ) {
            $ss = $ss-$step;
        }
        
        ++$i;
    }
    @unlink($config['TMP_DIR']. '/thumbs/' .$video_id);
}

function log_conversion($file_path, $text)
{   
    $file_dir = dirname($file_path);
    if( !file_exists($file_dir) or !is_dir($file_dir) or !is_writable($file_dir) ) {
        return false;
    }
                    
    $write_mode = 'w';
    if( file_exists($file_path) && is_file($file_path) && is_writable($file_path) ) {
        $write_mode = 'a';
    }
                                
    if( !$handle = fopen($file_path, $write_mode) ) {
        return false;
    }
                                                
    if( fwrite($handle, $text. "\n") == FALSE ) {
        return false;
    }
                                                            
    @fclose($handle);
}                                                        
?>
