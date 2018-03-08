
<?php
$query4 = "SELECT column_type as type FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'user_access_ticket_t' AND COLUMN_NAME = 'access_type'";
$db = mysqli_connect("localhost", "root", "", "eei_db");

$response = array();
$type = array();
$result=mysqli_query($db, $query4);
while($row=mysqli_fetch_array($result)) {
  $coltype=$row['type'];
  $enumList = explode(",", str_replace("'", "", substr($row['type'], 5, (strlen($row['type'])-6))));
  foreach($enumList as $value){
    $type[] = array('type'=> $value);
  }
}

$response= $type;

$fp = fopen('results.json', 'w');
fwrite($fp, json_encode($response));
fclose($fp);


?>
