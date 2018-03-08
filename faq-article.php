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
          <span id="faq-title"><i class="material-icons">storage</i><span class="table-title">Technicals FAQ</span></span>
          <div class="col s12" id="breadcrumb">
            <a href="home.php" class="breadcrumb">Knowledge Base</a>
            <a href="#!" class="breadcrumb">Technicals FAQ</a>
          </div>
        </div>

        <div id="knowledge-base-body" class="row">
          <div class="col s12 m4 l3" id="faq-nav">
            <ul>
              <h6>Subcategories</h6>
              <li class="collapsible"><a class="all" href="my-tickets.php">All Tickets</a></li>
              <li class="collapsible"><a class="inprogress" href="my-assigned-tickets.php">In Progress</a></li>
              <li class="collapsible"><a class="pending" href="my-pending-tickets.php">Pending</a></li>
              <li class="collapsible"><a class="resolved" href="my-resolved-tickets.php">Resolved</a></li>
              <li class="collapsible"><a class="all" href="my-closed-tickets.php">Closed</a></li>
            </ul>

          </div>
          <div class="col l9" id="faq-body">
          <h6>Add FAQ article</h6>
          <textarea name="area1" cols="40"></textarea><br/>
          </div>
        </div>
      </div>
    </div>
      <?php include 'templates/ticketforms.php'; ?>
    <?php include 'templates/js_resources.php'; ?>
  </body>
</html>
