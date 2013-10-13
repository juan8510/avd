<?php
define('_VALID', true);
require 'include/config.php';
require 'include/function_global.php';
require 'include/function_smarty.php';

$error_type = 'default';
$request    = ( isset($_SERVER['REQUEST_URI']) ) ? $_SERVER['REQUEST_URI'] : NULL;
$query      = explode('/', $request);
if ( is_array($query) ) {
    foreach ( $query as $key => $value ) {
        if ( $value == 'error' ) {
            $error_type = ( isset($query[$key+1]) ) ? $query[$key+1] : NULL;
        }
    }
}

switch ( $error_type ) {
    case 'video_private':
        $message = 'This video is private. You must be friends with the owner to view this video!';
        break;
    case 'album_private':
        $message = 'This album is private. You must be friends with the owner to view this album!';
        break;
    case 'photo_private':
        $message = 'This photo is private. You must be friends with the owner to view this photo!';
        break;
    case 'user_missing':
        $message = 'This user does not exist. Please make sure the username belongs to a user registered on our site!';
        break;
    case 'video_missing':
        $message = 'This video cannot be found. Are you sure you typed in the correct url?';
        break;
    case 'album_missing':
        $message = 'This album cannot be found. Are you sure you typed in the correct url?';
        break;
    case 'photo_missing':
        $message = 'This photo cannot be found. Are you sure you typed in the correct url?';
        break;
    case 'registration_disabled':
        $message = 'User registration is currently disabled. Please try again later!';
        break;
    case 'page_invalid':
        $message = 'This page cannot be found!';
        break;
    case 'invalid_notice':
        $message = 'Invalid ' .$config['site_name']. ' notice!';
        break;
    case 'blog_missing':
        $message = 'This blog cannot be found. Are you sure the url is correct!';
        break;
    case 'blog_private':
        $message = 'This blog is private. You must be friends with the owner to read this blog!';
        break;
    case 'album_permission':
        $message = 'You are not allowed to edit or add photo this album. You must be the owner of a album to add photos!';
        break;
    case 'private_messages_friends':
        $message = 'You can only send private messages to friends. Please invite some friends first!';
        break;
    case 'private_messages_disabled':
        $message = 'Private messages are currently disabled. Please try again later!';
        break;
    case 'mail_missing':
        $message = 'Private message could not be found!';
        break;
    case 'invalid_search_type':
        $message = 'Invalid search type. Allowed search types: videos, photos and users!';
        break;
    case 'game_missing':
        $message = 'This game cannot be found. Are you sure you typed in the correct url?';
        break;
    default:
        $message = 'Unexpected error! Please contact us and tell us more how you got to this page!';
        break;
}


$smarty->assign('message', $message);
$smarty->assign('menu', 'home');
$smarty->assign('categories', get_categories());
$smarty->display('header.tpl');
$smarty->display('errors.tpl');
$smarty->display('messages.tpl');
$smarty->display('error.tpl');
$smarty->display('footer.tpl');
$smarty->gzip_encode();
?>
