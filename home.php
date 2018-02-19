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
    <!-- ****************************************************** -->

    <!-- COL L10-->
    <div class="col s12 m12 l12" id="content">
      <div class="main-content">
          <?php if($_SESSION['user_type'] == 'Administrator' OR $_SESSION['user_type'] == "Access Group Manager"){?>
              <?php include 'templates/dashboard.php'; ?>
              <!-- <a class="btn-floating btn-large waves-effect waves-light red dropdown-button button-collapse" data-activates="dropdown2"><i class="material-icons">add</i></a>
              <ul id="dropdown2" class="dropdown-content collection">
                  <li><a class="service"> Service Request</a></li>
                  <li><a class="access">Access Request</a></li>
              </ul> -->
              <div class="fixed-action-btn vertical click-to-toggle">
                <a class="btn-floating btn-large blue darken-2">
                  <i class="material-icons">add</i>
                </a>
                <ul>
                  <li><a class="btn-floating blue lighten-2 service">Service Request</a></li>
                  <li><a class="btn-floating blue lighten-2 access">Access Request</i></a></li>
                </ul>
              </div>
          <?php } else { ?>
            <?php include 'templates/knowledge-base.php'; ?>
          <?php } ?>
          <?php include "templates/ticketforms.php"; ?>
      </div>
      <?php include "templates/ticketforms.php"; ?>

    </div>

    <?php include 'templates/js_resources.php'; ?>


    </body>
</html>
