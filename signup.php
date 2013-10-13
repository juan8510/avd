<?php
define('_VALID', true);
require 'include/config.php';
require 'include/function_global.php';
require 'classes/filter.class.php';
require 'classes/validation.class.php';
require 'include/function_smarty.php';
require 'classes/email.class.php';

if ( $config['user_registration'] == '0' ) {
    VRedirect::go($config['BASE_URL']. '/error/registration_disabled');
}

$signup     = array('username' => '', 'email' => '', 'age' => '', 'terms' => '', 'gender' => '');
if ( isset($_POST['submit_signup']) ) {
    $filter             = new VFilter();
    $valid              = new VValidation();
    $username           = $filter->get('username');
    $password           = $filter->get('password');
    $password_confirm   = $filter->get('password_confirm');
    $email              = $filter->get('email');
    $vcode              = $filter->get('verification');
    $age                = $filter->get('age');
    $terms              = $filter->get('terms');
    $gender             = $filter->get('gender');
    
    if ( $username == '' ) {
        $errors[]               = $lang['signup.username_empty'];
    } elseif ( strlen($username) > 15 ) {
        $errors[]               = $lang['signup.username_length'];
    } elseif ( !$valid->username($username) ) {
        $errors[]               = $lang['signup.username_invalid'];
    } elseif ( $valid->usernameExists($username) ) {
        $errors[]               = $lang['signup.username_exists'];
    } else {
        $signup['username']     = $username;
    }
    
    if ( $email == '' ) {
        $errors[]               = $lang['signup.email_empty'];
    } elseif ( !$valid->email($email) ) {
        $errors[]               = $lang['signup.email_invalid'];
    } elseif ( $valid->emailExists($email) ) {
        $errors[]               = $lang['signup.email_exists'];
    } else {
        $signup['email']        = $email;
    }
    
    if ( $password == '' ) {
        $errors[]               = $lang['signup.password_empty'];
    } elseif ( $password_confirm == '' ) {
        $errors[]               = $lang['signup.passwordc_empty'];
    } elseif ( $password != $password_confirm ) {
        $errors[]               = $lang['signup.password_mismatch'];
    }
    
    if ( $config['captcha'] == '1' ) {
        if ( $_SESSION['captcha_code'] != strtoupper($vcode) ) {
            $errors[]               = $lang['signup.captcha'];
        }
    }
    
    if ( $age == '' ) {
        $errors[]               = $lang['signup.age_err'];
    } else {
        $signup['age']          = 'on';
    }
    
    if ( $terms == '' ) {
        $errors[]               = $lang['signup.terms_err'];
    } else {
        $signup['terms']        = 'on';
    }
    
    if ( $gender == '' ) {
        $errors[]               = $lang['signup.gender_err'];
    } else {
        $gender                 = ( $gender == 'Male' ) ? 'Male' : 'Female';
        $signup['gender']       = $gender;
    }
    
    if ( !$errors ) {
        require 'classes/random.class.php';
		$password_clear = $password;
        $password       = md5($password);
        $sql            = "INSERT INTO signup SET email = '" .mysql_real_escape_string($email). "', username = '" .mysql_real_escape_string($username). "',
                                              pwd = '" .mysql_real_escape_string($password). "', gender = '" .$gender. "',
                                              addtime = '" .time(). "', logintime = '" .time(). "'";                  
        $conn->execute($sql);
        $uid            = mysql_insert_id();
        $sql            = "INSERT INTO users_prefs (UID) VALUES (" .$uid. ")";
        $conn->execute($sql);
        $sql            = "INSERT INTO users_online (UID, online) VALUES (" .$uid. ", " .time(). ")";
        $conn->execute($sql);
        $code           = VRandom::generate(10, 'confirmation');
        $sql            = "INSERT INTO confirm (UID, code) VALUES (" .$uid. ",'" .mysql_real_escape_string($code). "')";
        $conn->execute($sql);
        $sql            = "SELECT email_subject, email_path FROM emailinfo
                           WHERE email_id = 'verify_email' LIMIT 1";
        $rs             = $conn->execute($sql);
        $email_subject  = str_replace('{$site_name}', $config['site_name'], $rs->fields['email_subject']);
        $email_path     = $config['BASE_DIR'].'/templates/'.$rs->fields['email_path'];
        $smarty->assign('username', $username);
		$smarty->assign('password', $password_clear);
        $smarty->assign('uid', $uid);
        $smarty->assign('code', $code);
        $body           = $smarty->fetch($email_path);
        $mail           = new VMail();
        $mail->setNoReply();
        $mail->Subject  = $email_subject;
        $mail->AltBody  = $body;
        $mail->Body     = nl2br($body);
        $mail->AddAddress($email);
        $mail->Send();
        
        $mail->ClearAddresses();
        $sql            = "SELECT email_subject, email_path FROM emailinfo
                           WHERE email_id = 'welcome' LIMIT 1";
        $rs             = $conn->execute($sql);
        $email_subject  = str_replace('{$site_title}', $config['site_title'], $rs->fields['email_subject']);
        $email_path     = $rs->fields['email_path'];
        $body           = $smarty->fetch($config['BASE_DIR'].'/templates/'.$email_path);
        $mail->Subject  = $email_subject;
        $mail->AltBody  = $body;
        $mail->Body     = nl2br($body);
        $mail->AddAddress($email);
        $mail->Send();
                        
        $_SESSION['message']   = $lang['signup.msg'];
        VRedirect::go($config['BASE_URL']);
    }
}

$smarty->assign('errors',$errors);
$smarty->assign('messages',$messages);
$smarty->assign('menu', 'home');
$smarty->assign('signup', $signup);
$smarty->assign('self_title', $seo['signup_title']);
$smarty->assign('self_description', $seo['signup_desc']);
$smarty->assign('self_keywords', $seo['signup_keywords']);
$smarty->display('header.tpl');
$smarty->display('errors.tpl');
$smarty->display('messages.tpl');
$smarty->display('signup.tpl');
$smarty->display('footer.tpl');
$smarty->gzip_encode();
?>
