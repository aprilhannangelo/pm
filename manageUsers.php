<?php
  session_start();
  if(!isset($_SESSION['user_id'])){
    header('location: index.php');
  }
?>
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
    </div>
      <div class="material-table" id="manage">
        <div class="actions">
          <div class="sorter">
            <!-- Button for Removing Filter -->
            <a href="#" class="waves-effect btn-newuser requestor">Add New User</a>
            <a class="modal-trigger btn-batchupload" href="#modal-batch-upload">Batch Upload</a>
          </div>
        </div>

        <!-- Batch Upload Modal -->
        <div id="modal-batch-upload" class="modal modal-fixed-footer">
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

          <div class="modal-content">
            <h5>Batch Upload New Users</h5>
            <form method='post' name="batch" action="php_processes/batch-upload.php"  enctype="multipart/form-data">
            <br>
            <div class="file-field input-field">
              <div class="btn-attach">
                <span>SELECT File</span>
                <input type="file" id="file" name="file"/>
              </div>
              <div class="file-path-wrapper">
                <input class="file-path validate" type="text">
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <input class="waves-effect waves-light modal-action modal-close" id="btn-cancel" name="submit" type="submit" value="Cancel">
            <!-- <input class="waves-effect waves-light" id="btn-submit" name="submit" type="submit" value="Submit"> -->

            <button class="btn" type="submit" name="submit">Upload</button>
            </form>
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
    </div>
    <!-- HIDDEN FORMS -->
    <?php include 'templates/ticketforms.php'; ?>
    <?php include 'templates/js_resources.php'; ?>
  </body>
</html>
