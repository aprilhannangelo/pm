<!-- SERVICE REQUEST FORM -->
<form id="service" action="php_processes/service_ticket_process.php" name="service" method="post" enctype="multipart/form-data">
  <div id="service" class="servicet">
      <span class="table-title" id="form">New Service Request</span>
      <div class="row">
        <div class="col s12 m12 l6" id="form">
          <div class="row" id="request-form-row3">
            <div class="col s12">
              <div class="input-field" id="request-form">
                <input placeholder="<?php echo $_SESSION['first_name'] . ' '. $_SESSION['last_name'] ?>" name="rname" type="text" disabled>
                <label for="rname">Requestor's Name</label>
              </div>
            </div>
          </div>
          <div class="row" id="request-form-row2">
            <div class="col s12">
              <!-- <i class="tiny material-icons" id="form">event</i>Date Prepared: -->
              <div class="input-field" id="request-form">
                <input type="text"  id="date_prepared" name="date_prepared" disabled>
                <label for="date_prepared">Date Prepared (YYYY/MM/DD)</label>
              </div>
            </div>
          </div>
          <div class="row" id="request-form-row3">
            <div class="col s12">
              <div class="input-field" id="request-form">
                <input placeholder=" " class="title" name="title" type="text" data-length="40" class="validate" required>
                <label for="title">Request Title</label>
              </div>
            </div>
          </div>
          <div class="row" id="request-form-row">
            <div class="input-field">
              <textarea id="textarea1" placeholder=" " class="materialize-textarea" name="request_details" required></textarea>
              <label for="textarea1" required>Details</label>
            </div>
          </div>
          <div class="row" id="request-form-row2">
            <!-- ATTACH FILE -->
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
          <div class="row" id="request-form-controls">
            <input class="waves-effect waves-light" id="btn-cancel" name="submit" type="submit" value="Cancel">
            <input class="waves-effect waves-light" id="btn-submit" name="submit" type="submit" value="Submit">
          </div>

        </div>
      </div>
     </div>

</form> <!-- End of Service Request Form -->

<!-- USER ACCESS FORM  -->
<form id="access" name="access" method="post">
  <div id="access" class="accesst">
    <span class="table-title" id="form">New User Access Request</span>
    <!-- Preloader and it's background. -->
    <div class="preloader-background">
      <div class="activity">
        <h6>Sending e-mail to checker...</h6>
        <p>This may take a few seconds</p>
      </div>
      <div class="progress">
       <div class="indeterminate">
       </div>
     </div>
    </div>
    <!-- End of preloader -->
        <div class="row">
          <!-- Start of LEFT column -->
          <div class="col s12 m12 l6" id="form">
            <h6>Requestor Details</h6>
            <div class="col s12 m12 l6">
              <div class="row" id="request-form-row4">
                <div class="col s12">
                  <!-- <i class="tiny material-icons" id="form">event</i>Date Prepared: -->
                  <div class="input-field" id="request-form">
                    <input type="text"  id="date_prepared2" name="date_prepared2" disabled>
                    <label for="date_prepared2">Date Prepared (YYYY/MM/DD)</label>
                  </div>
                </div>
              </div>
            </div>
            <div class="col s12 m12 l6">
              <div class="row" id="request-form-row4">
                <div class="col s12">
                  <div class="input-field" id="request-form">
                    <input placeholder="Project Number" name="rc_no" type="number" required>
                    <label for="rc_no">R.C. Number</label>
                  </div>
                </div>
              </div>
            </div>
            <div class="row" id="request-form-row2">
              <div class="col s12">
                <div class="input-field" id="request-form">
                  <input placeholder=" " name="company" type="text" required>
                  <label for="company">Company</label>
                </div>
              </div>
            </div>
            <div class="row" id="request-form-row2">
              <div class="col s12">
                <div class="input-field" id="request-form">
                  <input placeholder=" " name="dp" type="text" required>
                  <label for="Department/Project">Department/Project</label>
                </div>
              </div>
            </div>
          </div> <!-- End of LEFT column -->


          <!-- Start of RIGHT column -->
          <div class="col s12 m12 l6" id="form">
            <div class="row" id="request-form-row">
              <div class="col s12 l12">
                <div class="input-field" id="request-form">
                  <input placeholder=" " class="title" name="title" type="text" data-length="40" required>
                  <label for="title">Request Title</label>
                </div>
              </div>
            </div>
              <br>
            <h6>Reviewed By:</h6>
            <div class="col s12 m12 l12">
              <div class="row" id="request-form-row4">
                  <div class="input-field search-box" id="request-form">
                    <input placeholder=" " name="checker" autocomplete="off" type="text" validate required>
                    <div class="result"></div>
                      <label for="approver">Checker *<i>optional</i></label>
                  </div>
              </div>
            </div>
            <div class="col s12 m12 l12">
              <div class="row" id="request-form-row3">
                  <div class="input-field search-box" id="request-form">
                    <input placeholder="Department's or Group's PM or Person-In-Charge" name="approver" autocomplete="off" type="text"  required>
                    <div class="result"></div>
                    <label for="approver">Approver *<i>optional</i></label>
                  </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col s12 m12 l12" id="form">
          <span id="rdetails"><h6>Request Details</h6>
            <!-- <input type="button" id="add-row" value="Add Row" onClick="addRow('dynamic_field')" />-->
          </span>
            <table id="dynamic_field">
              <thead>
                <tr>
                <div class="col s12 m12 l3">
                  <th>Application Name</th>
                </div>
                <div class="col s12 m12 l3">
                  <th>Request Type</th>
                </div>
                <div class="col s12 m12 l3">
                  <th>Full Name of User</th>
                </div>
                <div class="col s12 m12 l2">
                  <th></th>
                </div>
              </tr>
              </thead>
              <tbody>
                  <tr>
                     <div class="col s12 m12 l3">
                       <td>
                         <div class="input-field">
                           <input placeholder=" " name="app_name" type="text" required>
                         </div>
                       </td>
                     </div>
                     <div class="col s12 m12 l3">
                       <td>
                         <div class="input-field">
                           <select name = "status" required>
                             <option disabled selected >Select:</option>
                             <?php $get_types = mysqli_query($db, "SELECT column_type FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'user_access_ticket_t' AND COLUMN_NAME = 'access_type'");
                             $row2 = mysqli_fetch_array($get_types);
                             $enumList = explode(",", str_replace("'", "", substr($row2['column_type'], 5, (strlen($row2['column_type'])-6))));
                             foreach($enumList as $value){?>
                               <option value='<?php echo $value?>'> <?php echo $value?> </option>
                             <?php  }?>
                           </select>
                         </div>
                       </td>
                     </div>
                   <div class="col s12 m12 l3">
                     <td>
                       <div class="input-field">
                         <input placeholder=" " name="names" type="text" class="validate" required>
                       </div>
                     </td>
                   </div>
                   <div class"col s12 m12 l2">
                     <td>
                        <input type="button" name="add" id="add" value="+">
                     </td>
                  </div>
                  </tr>
                </tbody>

             </table>

          </div>  <!-- End of RIGHT column -->
          <div class="row" id="request-form-controls">
            <input class="waves-effect waves-light" id="btn-cancel" name="cancel" type="submit" value="Cancel">
            <input class="waves-effect waves-light" id="btn-submit" name="submit" type="submit" value="Submit">
          </div>

        </div> <!-- End of row -->
</form> <!-- End of User Access Request Form -->
<!-- END OF HIDDEN FORMS  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
<script>
// function addRow(tableID) {
//   var table = document.getElementById(tableID);
//   var rowCount = table.rows.length;
//   var row = table.insertRow(rowCount);
//   var colCount = table.rows[0].cells.length;
//   for(var i=0; i <colCount; i++) {
//   var newcell = row.insertCell(i);
//   newcell.innerHTML = table.rows[1].cells[i].innerHTML;
//   }
// };
// function deleteRow(tableID) {
// 	var table = document.getElementById(tableID);
// 	var rowCount = table.rows.length;
// 	for(var i=0; i<rowCount; i++) {
// 			table.deleteRow(i);
// 			rowCount--;
// 			i--;
// 	}
// };
$(document).ready(function(){
     var i=1;
     $('#add').click(function(){
          i++;
          $('#dynamic_field').append('<tr id="row'+i+'"><td><input placeholder=" " name="app_name" type="text" required /></td><td><input placeholder=" " name="names" type="text" class="validate" required></td><td></td><td><button type="button" name="remove" class="btn_remove" id="'+i+'"><i class="material-icons">clear</i></button></td></tr>');
     });
     $(document).on('click', '.btn_remove', function(){
          var button_id = $(this).attr("id");
          $('#row'+button_id+'').remove();
     });
   });
</script>
