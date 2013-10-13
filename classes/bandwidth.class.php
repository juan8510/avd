<?php
defined('_VALID') or die('Restricted Access!');
class VBandwidth
{
    public static function check( $ip, $size )
    {
        global $config, $conn, $lang;
            
        $limit = $config['guest_bandwidth']*1024*1024;
        $sql   = "SELECT guest_id, bandwidth
                  FROM guests
                  WHERE guest_ip = " .$ip. "
                  LIMIT 1";
        $rs    = $conn->execute($sql);
        if ( $conn->Affected_Rows() === 1 ) {
            $guest_id           = $rs->fields['guest_id'];
            $guest_bandwidth    = $rs->fields['bandwidth'];
            if ( $guest_bandwidth > $limit ) {
				$_SESSION['error'] = $lang['guest.limit'];
                VRedirect::go($config['BASE_URL']. '/signup');
            } else {
                $sql = "UPDATE guests
                        SET bandwidth = bandwidth + " .$size. ",
                            last_login = '" .date('Y-m-d h:i:s'). "'
                        WHERE guest_id = " .$guest_id. "
                        LIMIT 1";
                $conn->execute($sql);
            }
        } else {
            $sql = "INSERT INTO guests (guest_ip, last_login, bandwidth)
                    VALUES (" .$ip. ", '" .date('Y-m-d h:i:s'). "', " .$size. ")";
            $conn->execute($sql);
        }
        
        return false;
    }
}
?>
