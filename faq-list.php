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
      <div class="main-content" id="knowledge-base-body">
        <?php
        switch ((isset($_GET['view']) ? $_GET['view'] : ''))
        {
          case ("technicals"):
          $catname = "Technicals";
          break;

          case ("access"):
          $catname = "Access";
          break;

          case ("network"):
          $catname = "Network";
          break;
        }?>
        <div class="col s12 m12 l12 table-header">
          <span class="table-title"><?php echo $catname?> FAQs</span>
          <div class="col s12" id="breadcrumb">
            <a href="home.php" class="breadcrumb">Knowledge Base</a>
            <a href="#!" class="breadcrumb"><?php echo $catname?> FAQs</a>
          </div>
        </div>
          <div id="knowledge-base-body" class="row">
            <div id="faq">
              <?php
              $query2 = "SELECT * FROM faq_subcategory_t WHERE category = '$catname'";
              $result2 = mysqli_query($db, $query2);
              while($row2 = mysqli_fetch_assoc($result2)){
                $subcatname = $row2['subcategory_name'];?>
                <div id="instance">
                  <h6><i class="material-icons">question_answers</i><?php echo $row2['subcategory_name']?></h6>
                  <?php include 'templates/faq-sorter.php'?>
                  <?php while($row = mysqli_fetch_assoc($result)){?>
                  <a href="faq-article.php?id=<?php echo $row['article_id']?>" id="articleTitle"><?php echo $row['article_title'] ?></a><br>
                <?php } ?>
                </div>
              <?php }; ?>
            </div>
          </div>
        </div>
        <?php include 'templates/ticketforms.php'; ?>
        <?php include 'templates/mobile-ticket-buttons.php' ?>
        <?php include 'templates/js_resources.php'; ?>
      </div>

  </body>
</html>