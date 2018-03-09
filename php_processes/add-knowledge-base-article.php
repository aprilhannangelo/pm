<?php
// include "../templates/dbconfig.php";
session_start();
$db = mysqli_connect("localhost", "root", "", "eei_db");

$article = mysqli_real_escape_string($db, $_POST['article']);
$category = mysqli_real_escape_string($db, $_POST['category']);
$subcategory = mysqli_real_escape_string($db, $_POST['subcategory']);
$title = mysqli_real_escape_string($db, $_POST['title']);

// // // $query = "SELECT subcategory_id FROM faq_subcategory_t WHERE subcategory_name = '$subcategory'";
// // $result=mysqli_query($db, $query);
// $row = mysqli_fetch_array($result,MYSQLI_ASSOC);

$sql = "INSERT INTO faq_article_t (article_id,article_title, article_body,subcategory_id,category) VALUES(DEFAULT,'$title', '$article','$subcategory','$category')";
if (!mysqli_query($db, $sql))
{
  die('Error' . mysqli_error($db));
}

mysqli_close($db);
?>
