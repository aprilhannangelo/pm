<?php
  session_start();
  if(!isset($_SESSION['user_id'])){
    header('location: index.php');
  }
?>
<!DOCTYPE html>
<html>
  <head>
    <link rel="shortcut icon" type="image/x-icon" href="img/eei-black.png" />
    <title>EEI Service Desk</title>
    <?php include 'templates/css_resources.php' ?>
  </head>

  <body>
    <?php include 'templates/navheader.php'; ?>
    <?php include 'templates/sidenav.php'; ?>
    <div class="col s12 m12 l12" id="content">
      <div class="main-content">
        <div class="col s12 m12 l12 table-header">
          <span id="faq-title"><i class="material-icons">network_check</i><span class="table-title">Network FAQ</span></span>
          <div class="col s12" id="breadcrumb">
            <a href="home.php" class="breadcrumb">Knowledge Base</a>
            <a href="#!" class="breadcrumb">Network FAQ</a>
          </div>
        </div>
      </div>
      <?php include 'templates/ticketforms.php'; ?>
    </div>
    <?php include 'templates/js_resources.php'; ?>
  </body>
</html>
