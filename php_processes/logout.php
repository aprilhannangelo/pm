<?php
session_start();
session_destroy();
header('location: \eei_merged\index.php');
exit;
?>
