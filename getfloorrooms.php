<?php

if ($_SESSION['loggedin']=="1") {
  $username=$_SESSION['username'];
  $userid=$_SESSION['userid'];
  $first_name=$_SESSION['first_name'];
  $last_name=$_SESSION['last_name'];
  $userid=$_SESSION['userid'];
  $authkey=$_SESSION['authkey'];
  $smarty->assign("username", $username);
    $smarty->assign("userid", $userid);
  $smarty->assign("authkey", $authkey);
  $smarty->assign("first_name", $first_name);
  $smarty->assign("last_name", $last_name);



  $sql = "SELECT * FROM floors";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
        unset($rooms);
        $floorid=$row['floorid'];
        $sql_room = "SELECT * FROM rooms WHERE floorid='$floorid' ORDER BY roomname";
        $result_room = $conn->query($sql_room);
        if ($result_room->num_rows > 0) {
	   unset($rooms);
            // output data of each row
            while($row_room = $result_room->fetch_assoc()) {

                $roomid=$row_room['roomid'];
                $room['id']=$row_room['roomid'];
                $room['name']=$row_room['roomname'];
            $sql = "SELECT room_assign_id FROM room_assigns WHERE roomid='$roomid' AND userid='$userid' limit 1";
            $result2 = $conn->query($sql);

              
              if ($result2->num_rows > 0) {
                $rooms[$room['id']]=$room;
                $allrooms[$room['id']]=$room;
              }

            }
          }
$floor['id']=$floorid;
$floor['name']=$row['floor'];
$floor['rooms']=$rooms;
$floors[$floorid]=$floor;
}
}


$smarty->assign("floors", $floors);
} else {
  $smarty->assign("loginplease", "please");
}
