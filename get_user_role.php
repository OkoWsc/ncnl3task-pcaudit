<?php
require_once('config.php');

if ($_SESSION['loggedin']=="1") {
	    $sql = "SELECT user_role_id FROM users WHERE userid='$userid' limit 1";
            $result2 = $conn->query($sql);
            $row2 = $result2->fetch_assoc();
            $userrole=$row2['user_role_id'];
	    $smarty->assign("userrole",$userrole);
} else {
            $userrole=0;
	    $smarty->assign("userrole",$userrole);
}
