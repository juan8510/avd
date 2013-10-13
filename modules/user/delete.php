<?php
defined('_VALID') or die('Restricted Access!');

if ( isset($_POST['delete_yes']) && isset($_POST['confirm_delete']) ) {
    $sql        = "SELECT UID FROM signup WHERE username = 'anonymous' LIMIT 1";
    $rs         = $conn->execute($sql);
    $anon_uid   = intval($rs->fields['UID']);
    $sql        = "UPDATE video SET UID = " .$anon_uid. " WHERE UID = " .$uid;
    $conn->execute($sql);
    $sql        = "UPDATA albums SET UID = " .$anon_uid. " WHERE UID = " .$uid;
    $conn->execute($sql);
    $sql        = "DELETE FROM signup, users_blocks, users_flags, users_online, users_prefs
                   WHERE UID = " .$uid;
    $conn->execute($sql);
    unset($_SESSION['uid']);
    unset($_SESSION['username']);
    unset($_SESSION['email']);
    unset($_SESSION['emailverified']);
    unset($_SESSION['photo']);
    unset($_SESSION['fname']);
    unset($_SESSION['gender']);
    $_SESSION['error'] = $lang['user.delete_success'];
    VRedirect::go($config['BASE_URL']);
}

if ( isset($_POST['delete_no']) ) {
    $_SESSION['message'] = $lang['user.delete_keep'];
    VRedirect::go($config['BASE_URL']. '/user');
}

$self_title = $lang['user.delete_self'];
?>