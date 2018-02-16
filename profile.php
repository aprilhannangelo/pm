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
  <script>
  function deleteUser($id){
          //get the input value
          $.ajax({
              //the url to send the data to
              url: "php_processes/delete-user.php",
              //the data to send to
              data: {id : $id},
              //type. for eg: GET, POST
              type: "POST",
              success: function()
               {
                 swal({
                    title: "User deleted",
                    type: "success",
                    icon: "success"
                }).then(function(){
                  window.location="manageUsers.php";
                });
               }
          });
      }

  </script>
  </head>

  <body>
    <?php include 'templates/navheader.php'; ?>
    <?php include 'templates/sidenav.php'; ?>

    <!-- ****************************************************** -->

    <!--body-->
      <div class="col s12 m12 l10">
        <div class="wrapper">
          <div class="main-container">
            <?php echo "<input class=\"material-icons\" alt=\"Go back\" type=\"submit\" id=\"details-back\" value=\"arrow_back\" onclick=\"window.history.go(-1); return false;\">"?>
            <div class="main-body">
              <?php
              $db = mysqli_connect("localhost", "root", "", "eei_db");
              $id = $_GET["id"];

              $query1 = "SELECT * from user_t where user_id = $id";

              if (!mysqli_query($db, $query1))
              {
                die('Error' . mysqli_error($db));
              }

              $result = mysqli_query($db, $query1);
              $row=mysqli_fetch_array($result,MYSQLI_ASSOC);

              mysqli_close($db);
               ?>

              <input class="waves-effect waves-light submit edit-button" id="request-form" name="submit" type="submit" value="Edit">
              <input onclick="deleteUser(<?php echo $row['user_id']?>)" class="waves-effect waves-light submit edit-button" id="request-form" name="submit" type="button" value="Delete">
              <!-- <img src="<?php echo $avatar ?>"></img> -->

              <h4 class="body-header"><b><?php echo $row['first_name'] . ' ' . $row['last_name'] ?></b></h4>
              <h6 class="body-header" id="line2"><b><?php echo $row['user_type'] ?></b></h6>

              <hr>
              <br>
              <table id="profile">
                <tbody>
                  <tr>
                    <td>First Name</td>
                    <td class = "pflBody" contenteditable="false"><?php echo $row['first_name']?></td>
                  </tr>
                  <tr>
                    <td>Last Name</td>
                    <td class = "pflBody" contenteditable="false"><?php echo $row['last_name']?></td>
                  </tr>
                  <tr>
                    <td>Userid</td>
                    <td class = "pflBody" contenteditable="false"><?php echo $row['userid']?></td>
                  </tr>
                  <tr>
                    <td>E-mail Address</td>
                    <td class = "pflBody" contenteditable="false"><?php echo $row['email_address']?></td>
                  </tr>
                  <tr>
                    <td>User Type</td>
                    <td class = "pflBody" contenteditable="false" ><?php echo $row['user_type']?></td>
                  </tr>

                </tbody>
              </table>
            </div>

            <!-- ****************************************************** -->
            <!-- HIDDEN FORMS -->
            <?php include 'templates/ticketforms.php'; ?>
          </div> <!-- End of main container of col 10 -->
        </div> <!-- End of wrapper of col l10 -->
      </div>
    <!-- END OF COL l10 -->

    <?php include 'templates/js_resources.php' ?>
  </body>
</html>
