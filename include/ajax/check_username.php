<?php
defined('_VALID') or die('Restricted Access!');

require $config['BASE_DIR']. '/classes/filter.class.php';
require $config['BASE_DIR']. '/include/adodb/adodb.inc.php';
require $config['BASE_DIR']. '/include/dbconn.php';

disableRegisterGlobals();

if ( isset($_POST['username']) ) {
    $filter     = new VFilter();
    $username   = $filter->get('username');
    $response   = $lang['ajax.username_empty'];
    if ( $username != '' ) {
        $sql = "SELECT UID FROM signup WHERE username = '" .mysql_real_escape_string($username). "' LIMIT 1";
        $conn->execute($sql);
        if ( $conn->Affected_Rows() == 1 ) {
            $response = $lang['ajax.username_used'];
        } else {
            $response = $lang['ajax.username_available'];
        }
    }
    
    echo htmlspecialchars($response);
}
?>
