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
      <span class="table-title">Manage Users</span>
      <div class="count">
        <!-- Badge Counter -->
        <?php
          $query = "SELECT COUNT(*) AS count FROM user_t";
          $result = mysqli_query($db,$query); ?>
          <?php while($row = mysqli_fetch_assoc($result)){ ?>
            <span class="badge main-count"> <?php echo $row['count'] . " users" ?></span>
          <?php }
        ?>
      </div>
      <div class="col s12" id="breadcrumb">
        <a href="#!" class="breadcrumb">First</a>
        <a href="#!" class="breadcrumb">Second</a>
        <a href="#!" class="breadcrumb">Third</a>
      </div>
    </div>
      <div class="material-table" id="manage">
        <div class="actions">
          <div class="sorter">
            <!-- Button for Removing Filter -->
            <a href="#" class="modal-trigger waves-effect btn-newuser requestor">Add New User</a>
            <a href="#" class="modal-trigger waves-effect btn-newuser batch">Batch Upload</a>
          </div>

        </div>
        <table id="datatable" class="manageUsers">
          <thead>
            <tr>
              <th>Requestor Name</th>
              <th>User ID</th>
              <th>Email Address</th>
              <th>User Type</th>
            </tr>
          </thead>
          <tbody>
            <?php
            $query = "SELECT * FROM user_t";
            $result = mysqli_query($db,$query);
            while ($row = mysqli_fetch_assoc($result)){
            ?>
              <tr class='clickable-row' data-href="profile.php?id=<?php echo $row['user_id']?>">
                    <td class = 'user-row'> <?php echo $row['first_name'] . ' ' . $row['last_name']?>  </td>
                    <td class = 'user-row'> <?php echo $row['userid']?>   </td>
                    <td class = 'user-row'> <?php echo $row['email_address']?>  </td>
                    <td class = 'user-row'> <?php echo $row['user_type']?> </td>
                  </tr>
                <?php }?>
          </tbody>
        </table>
      </div>
    </div>
  <!-- end of main body div -->
    <!-- New User Form -->
    <form id="new-requestor" name="requestor" method="post">
      <div id="requestor" class="requestort">
        <span class="table-title" id="form">Add New User</span>
          <!-- Preloader and it's background. -->
          <div class="preloader-background">
            <div class="preloader-wrapper big active">
              <div class="spinner-layer spinner-blue-only">
                <div class="circle-clipper left">
                  <div class="circle"></div>
                </div><div class="gap-patch">
                  <div class="circle"></div>
                </div><div class="circle-clipper right">
                  <div class="circle"></div>
                </div>
              </div>
            </div>
          </div>
          <!-- End of preloader -->
          <div class="row">
              <div class="col s12">
                <div class="row">
                    <div class="col s12 l6" id="form">
                      <h6>User Details</h6>
                      <div class="row" id="request-form-row">
                        <div class="col s12">
                          <div class="input-field" id="request-form">
                            <input placeholder=" " class="userid" name="userid" type="text" required>
                            <label for="title">User ID</label>
                          </div>
                        </div>
                      </div>
                      <div class="row" id="request-form-row">
                        <div class="col s12">
                          <div class="input-field" id="request-form">
                            <input placeholder=" " class="fname" name="fname" type="text" required>
                            <label for="title">First Name</label>
                          </div>
                        </div>
                      </div>
                      <div class="row" id="request-form-row">
                        <div class="col s12">
                          <div class="input-field" id="request-form">
                            <input placeholder=" " class="lname" name="lname" type="text" required>
                            <label for="title">Last Name</label>
                          </div>
                        </div>
                      </div>

                      <div class="row" id="request-form-row">
                        <div class="col s12">
                          <div class="input-field" id="request-form">
                            <input placeholder=" " class="email" name="email" type="text" required>
                            <label for="title">Email Address</label>
                          </div>
                        </div>
                      </div>
                      <div class="row" id="request-form-row">
                        <div class="col s12">
                          <div class="input-field" id="request-form">
                            <input  class="password" value="usr@EEI1" name="password" type="text" placeholder="usr@EEI1" disabled>
                            <label for="title">Password</label>
                          </div>
                        </div>
                      </div>
                      <div class="row" id="request-form-row">
                        <div class="col s12">
                          <div class="input-field" id="request-form">
                            <?php
                              $db = mysqli_connect("localhost", "root", "", "eei_db");?>

                              <select name = "type" required>
                              <option value= "">Select</option>
                              <?php $get_user_type = mysqli_query($db, "SELECT column_type FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'user_t' AND COLUMN_NAME = 'user_type'");
                              $row = mysqli_fetch_array($get_user_type);
                              $enumList = explode(",", str_replace("'", "", substr($row['column_type'], 5, (strlen($row['column_type'])-6))));
                              foreach($enumList as $value){?>
                              <option value='<?php echo $value?>'> <?php echo $value?> </option>
                                  <?php } ?>
                              </select>

                          <label for="title">User Type</label>
                          </div>
                        </div>
                      </div>
                      <div class="row" id="request-form-controls">
                        <input class="waves-effect waves-light" id="btn-cancel" name="submit" type="submit" value="Cancel">
                        <input class="waves-effect waves-light" id="btn-submit" name="submit" type="submit" value="Submit">
                      </div>
                    </div>

                </div>
              </div>
          </div>
        </div>
      </form>
      <!-- batch upload form -->
                <form id="batch-upload"  name="batch" method="post"  enctype="multipart/form-data">
                  <div id="batch" class="batcht">
                    <div class="search-bar"><h5 class="body-header"><b>Add New User (Batch Upload)</b></h5></div>
                    <hr>
                      <div class="row">
                          <div class="col s12">
                            <div class="row">
                                <div class="col s12 l6" id="form">
                                  <h6>Import CSV File</h6>
                                  <div class="row" id="request-form-row">
                                    <div class="col s12">
                                      <div class="input-field" id="request-form">
                                        <input type="file" name="file">
                                        <br />
                                      </div>
                                    </div>
                                  </div>

                                    <div class="row">
                                      <input class="waves-effect waves-light submit upload" id="request-form" name="submit" type="submit" value="Submit">
                                      <input class="waves-effect waves-light cancel" id="request-form" name="cancel" type="submit" value="Cancel">
                                    </div>
                                </div>

                            </div>
                          </div>
                      </div>
                    </div>
                    <?php
                    $db = mysqli_connect("localhost", "root", "", "eei_db");


                    if (isset($_POST['submit'])){
                    $file = $_FILES['file']['tmp_name'];

                    $handle = fopen($file, "r");
                    $c = 0;
                    $password = "usr@EEI1";
                    fgetcsv($handle);
                    while(($filesop = fgetcsv($handle, 8192, ",")) !== false)
                      {
                        $userid = $filesop[0];
                        $fname = $filesop[1];
                        $lname = $filesop[2];
                        $email = $filesop[3];
                        $type = $filesop[4];

                           $sql ="INSERT INTO user_t (user_id,userid,first_name,last_name,password,email_address,user_type) VALUES (DEFAULT,'$userid','$fname','$lname',MD5('$password'),'$email','$type')";
                           if (!mysqli_query($db, $sql))
                           {
                             die('Error' . mysqli_error($db));
                             echo "Sorry! A problem was encountered.";
                           }

                    }?>
                      <script>window.location='manageUsers.php'</script>
                      <?php
                    }

                    ?>

                  </form>


      <!-- ****************************************************** -->
            <!-- HIDDEN FORMS -->
            <?php include 'templates/ticketforms.php'; ?>
            <?php include 'templates/js_resources.php'; ?>

          </div> <!-- End of main container of col 10 -->
        </div> <!-- End of wrapper of col l10 -->
      </div>
    <!-- END OF COL l10 -->


  </body>
</html>
