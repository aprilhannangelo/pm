<!DOCTYPE html>
<html>
<head>
  <link rel="shortcut icon" type="image/x-icon" href="img/eei-black.png" />
  <title>EEI Service Desk</title>
  <?php include 'templates/css_resources.php' ?>
</head>


  <body id="login-page" class="valign-wrapper">
  <div class="container">
      <div class="valign-wrapper">
          <div class="card-panel" id="login" class="row">
            <div class="card-content white-text">
              <div class="row">
              <img src="img/EEI.png" class="login-logo">
            </div>
                <span class="card-title"><h5>EEI Corporation's Service Desk</h5></span>
            </div>
            <form id="reset-password" name="reset-password" method="post">
              <div class="row">
                <div class="input-field col s12" id="login">
                  <input id="password" name="password" type="text" class="validate">
                       <input  id="token" name = "token" type="hidden" value="<?php $id = $_GET['token']; echo $id?>">
                  <label for="new-password" id="new-password">New Password</label>
                </div>
              </div>
              <div class="row">
                 <input class="waves-effect waves-light btn-login" id="button-login" name="submit" type="submit" value="Update Password">
                 <br>
              </div>
              </form>
            </div>
        </div>
    </div>
    <?php include 'templates/js_resources.php' ?>
  </body>
</html>
