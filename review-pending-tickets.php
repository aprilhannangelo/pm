<?php
  session_start();
  if(!isset($_SESSION['userid'])){
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
    <!--body-->
    <div class="col s12 m12 l12" id="content">
      <div class="main-content">
        <div class="col s12 m12 l12 table-header">
          <span class="table-title">Reviewed Pending Tickets</span>
          <div class="count">
            <!-- Badge Counter -->
            <?php
              if($_SESSION['user_type'] == "Administrator"){
                $query = "SELECT COUNT(*) as count FROM ticket_t WHERE ticket_status=5";
              }
              else if ($_SESSION['user_type'] == "Access Group Manager"){
                $query = "SELECT COUNT(*) as count FROM ticket_t WHERE ticket_category='Access' AND ticket_status=5";
              }
              else if ($_SESSION['user_type'] == "Technicals Group Manager"){
                $query = "SELECT COUNT(*) as count FROM ticket_t WHERE ticket_category='Technicals' AND ticket_status=5";
              }
              else if ($_SESSION['user_type'] == "Network Group Manager"){
                $query = "SELECT COUNT(*) as count FROM ticket_t WHERE ticket_category='Network' AND ticket_status=5";
              }
              else if ($_SESSION['user_type'] == "Technician"){
                $query = "SELECT COUNT(*) as count FROM ticket_t WHERE ticket_status=5 AND ticket_agent_id = '".$_SESSION['user_id']."'";
              }
              else if ($_SESSION['user_type'] == "Network Engineer"){
                $query = "SELECT COUNT(*) as count FROM ticket_t WHERE ticket_status=5 AND ticket_agent_id = '".$_SESSION['user_id']."'";
              }

              $result = mysqli_query($db,$query);
              while($row = mysqli_fetch_assoc($result)) { ?>
                <span class="badge main-count"> <?php echo $row['count'] . " tickets" ?></span>
              <?php } ?>
          </div>
          <div class="col s12" id="breadcrumb">
            <a href="#!" class="breadcrumb">Tickets for Review</a>
            <a href="#!" class="breadcrumb">Pending Tickets Reviewed</a>
          </div>
        </div>
        <div class="material-table" id="my-tickets">
          <div class="actions">
            <div class="sorter">
              <!-- Button for Removing Filter -->
              <a href="review-closed-tickets.php" class="waves-effect btn-sort">Remove Filter <i id="removefilter" class="material-icons">remove_circle</i></a>

              <!-- Dropdown Trigger for Category Sorter -->
              <a class="dropdown-button btn-sort" data-activates="categories" data-beloworigin="true">Category<i id="sort" class="material-icons">arrow_drop_down</i></a>
              <!-- Dropdown Structure -->
              <ul id="categories" class="dropdown-content collection">
                <li><a href="?view=technicals" class="technicals">Technicals</a></li>
                <li><a href="?view=access" class="accesstickets">Access</a></li>
                <li><a href="?view=network" class="network">Network</a></li>
              </ul>

              <!-- Dropdown Trigger for Severity Sorter -->
              <a class="dropdown-button btn-sort" data-activates="sevlevels" data-beloworigin="true">Severity<i id="sort" class="material-icons">arrow_drop_down</i></a>
              <!-- Dropdown Structure -->
              <ul id="sevlevels" class="dropdown-content collection">
                <li><a href="?view=sev1">SEV1</a></li>
                <li><a href="?view=sev2">SEV2</a></li>
                <li><a href="?view=sev3">SEV3</a></li>
                <li><a href="?view=sev4">SEV4</a></li>
                <li><a href="?view=sev5">SEV5</a></li>
              </ul>
            </div>
          </div>
              <!-- MAIN TABLE -->
              <?php if ($_SESSION['user_type']=='Administrator') {?>
                <table id="datatable" class="striped">
                    <thead>
                        <tr>
                          <th></th>
                          <th>Ticket No.</th>
                          <th>Notes</th>
                          <th>Date Created</th>
                          <th>Remarks</th>
                        </tr>
                      </thead>
                    <tbody>
                      <?php
                     include 'templates/review-tickets-sorter.php';
                     $stat = 'Pending';
                     $query = "SELECT * FROM ticket_t LEFT JOIN service_ticket_t USING (ticket_id) LEFT JOIN user_access_ticket_t USING (ticket_id) LEFT JOIN sla_t sev ON sev.id = ticket_t.severity_level LEFT JOIN ticket_status_t stat ON stat.status_id = ticket_t.ticket_status WHERE ticket_t.ticket_status=5";

                     $result = mysqli_query($db,$query);?>
                      <?php while($row = mysqli_fetch_assoc($result)){
                        switch($row['ticket_category'])
                         {
                             case("Technicals"):
                                 $class = 'ticket_cat_t';
                                 break;
                             case("Access"):
                                $class = 'ticket_cat_a';
                                break;
                             case("Network"):
                               $class = 'ticket_cat_n';
                               break;
                             case(""):
                               $class = 'ticket_cat_blank';
                               break;
                         }
                        ?>
                         <tr class='clickable-row' data-href="details.php?id=<?php echo $row['ticket_id']?>">
                           <td id="type"><span class="<?php echo $class?>"> <?php echo $row['ticket_category'][0]?></span><p style="margin-top:25px;margin-bottom:-5px;font-size:8pt;"><?php echo $row['severity_level']?></p></td>
                           <td> <?php echo $row['ticket_number']?>  </td>
                           <td> <?php echo $row['ticket_title']?>   </td>
                           <td> <?php echo $row['date_prepared']?>  </td>
                           <td> <?php echo $row['remarks'] ?>       </td>
                         </tr>
                       <?php } ?>
                       </tbody>
                </table>


              <?php } elseif ($_SESSION['user_type']=='Access Group Manager') {?>
                <table id="datatable" class="striped">
                  <thead>
                    <tr>
                      <th></th>
                      <th>Ticket No.</th>
                      <th>Date Created</th>
                      <th>Time Left</th>
                      <th>Department/Project</th>
                      <th>Application Access</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php include 'templates/review-tickets-sorter.php';
                    $stat = 'Pending';
                    $query = "SELECT * FROM ticket_t LEFT JOIN user_access_ticket_t USING (ticket_id) LEFT JOIN sla_t sev ON sev.id = ticket_t.severity_level LEFT JOIN ticket_status_t stat ON stat.status_id = ticket_t.ticket_status WHERE ticket_t.ticket_category='Access' AND ticket_t.ticket_status=5";
                    $result = mysqli_query($db,$query);
                    ?>

                    <?php while($row = mysqli_fetch_assoc($result)){
                      switch($row['ticket_category'])
                       {
                           case("Technicals"):
                               $class = 'ticket_cat_t';
                               break;
                           case("Access"):
                              $class = 'ticket_cat_a';
                              break;
                           case("Network"):
                             $class = 'ticket_cat_n';
                             break;
                           case(""):
                             $class = 'ticket_cat_blank';
                             break;
                       }
                      ?>
                      <?php $date_required = $row['date_required'];
                      date_default_timezone_set('Asia/Manila');
                      $date1 = new DateTime(date('Y-m-d H:i:s'));
                      $date2 = new DateTime($date_required);
                      $interval = $date1->diff($date2);
                       ?>
                       <tr class='clickable-row' data-href="details.php?id=<?php echo $row['ticket_id']?>">
                         <td id="type">
                           <?php if ($date1<$date2) {?>
                           <span class="<?php echo $class?>"> <?php echo $row['ticket_category'][0]?></span><p style="margin-top:25px;margin-bottom:-5px;font-size:8pt;"><?php echo $row['severity_level']?></p>
                         <?php } else{?>
                          <i id= "warning" class="material-icons">report</i> <p style="margin-top:25px;margin-bottom:-5px;font-size:8pt;"><?php echo $row['severity_level']?></p> <?php }?>
                         </td>
                         <td> <?php echo $row['ticket_number']?>  </td>
                         <td> <?php echo $row['date_prepared'] ?>  </td>
                         <td>
                           <?php if ($date1<$date2) {echo $interval->days . " days" . $interval->format(" %h hours");} else{echo "Overdue by" . "<br>" . $interval->days . " days" . $interval->format(" %h hours");} ?>
                          </td>
                         <td> <?php echo $row['dept_proj']?>   </td>
                         <td> <?php echo $row['application_name']?>  </td>
                       </tr>
                     <?php } ?>
                   </tbody>
                </table>

              <?php } elseif ($_SESSION['user_type']=='Technicals Group Manager') {?>
                <table id="datatable" class="striped">
                  <thead>
                    <tr>
                      <th></th>
                      <th>Ticket No.</th>
                      <th>Status</th>
                      <th>Notes</th>
                      <th>Date Created</th>
                      <th>Time Left</th>
                      <th>Remarks</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php
                    include 'templates/review-tickets-sorter.php';
                    $stat = 'Pending';
                    $query = "SELECT * FROM ticket_t LEFT JOIN service_ticket_t USING (ticket_id) LEFT JOIN sla_t sev ON sev.id = ticket_t.severity_level LEFT JOIN ticket_status_t stat ON stat.status_id = ticket_t.ticket_status WHERE ticket_t.ticket_category='Technicals' AND ticket_t.ticket_status=5";
                    $result = mysqli_query($db,$query);?>

                    <?php while($row = mysqli_fetch_assoc($result)){
                      switch($row['ticket_category']) {
                           case("Technicals"):
                               $class = 'ticket_cat_t';
                               break;
                           case("Access"):
                              $class = 'ticket_cat_a';
                              break;
                           case("Network"):
                             $class = 'ticket_cat_n';
                             break;
                           case(""):
                             $class = 'ticket_cat_blank';
                             break;
                       }

                      $date_required = $row['date_required'];
                      date_default_timezone_set('Asia/Manila');
                      $date1 = new DateTime(date('Y-m-d H:i:s'));
                      $date2 = new DateTime($date_required);
                      $interval = $date1->diff($date2); ?>

                      <tr class='clickable-row' data-href="details.php?id=<?php echo $row['ticket_id']?>">
                         <td id="type">
                           <?php if ($date1<$date2) {?>
                           <span class="<?php echo $class?>"> <?php echo $row['ticket_category'][0]?></span><p style="margin-top:25px;margin-bottom:-5px;font-size:8pt;"><?php echo $row['severity_level']?></p>
                         <?php } else{?>
                          <i id= "warning" class="material-icons">report</i> <p style="margin-top:25px;margin-bottom:-5px;font-size:8pt;"><?php echo $row['severity_level']?></p> <?php }?>
                         </td>
                         <td> <?php echo $row['ticket_number']?>  </td>
                         <td> <?php echo $row['ticket_status']?>  </td>
                         <td> <?php echo $row['ticket_title']?>   </td>
                         <td> <?php echo $row['date_prepared']?>  </td>
                         <td>
                           <?php if ($date1<$date2) {echo $interval->format('%d days %h hours %i minutes');} else{echo "Overdue by" . "<br>" . $interval->format('%d days %h hours %i minutes');} ?>
                          </td>
                         <td> <?php echo $row['remarks'] ?>       </td>
                      </tr>
                    <?php } ?>
                    </tbody>
                  </table>

              <?php } elseif ($_SESSION['user_type']=='Network Group Manager') {?>
                <table id="datatable" class="striped">
                  <thead>
                    <tr>
                      <th></th>
                      <th>Ticket No.</th>
                      <th>Status</th>
                      <th>Notes</th>
                      <th>Date Created</th>
                      <th>Time Left</th>
                      <th>Remarks</th>
                    </tr>
                  </thead>
                  <tbody>
                      <?php
                        include 'templates/review-tickets-sorter.php';
                        $stat = 'Pending';
                        $query = "SELECT * FROM ticket_t LEFT JOIN service_ticket_t USING (ticket_id) LEFT JOIN sla_t sev ON sev.id = ticket_t.severity_level LEFT JOIN ticket_status_t stat ON stat.status_id = ticket_t.ticket_status WHERE ticket_t.ticket_category='Network' AND ticket_t.ticket_status=5";
                        $result = mysqli_query($db,$query);?>

                        <?php while($row = mysqli_fetch_assoc($result)){
                          switch($row['ticket_category'])
                           {
                               case("Technicals"):
                                   $class = 'ticket_cat_t';
                                   break;
                               case("Access"):
                                  $class = 'ticket_cat_a';
                                  break;
                               case("Network"):
                                 $class = 'ticket_cat_n';
                                 break;
                               case(""):
                                 $class = 'ticket_cat_blank';
                                 break;
                           }
                          ?>
                          <?php $date_required = $row['date_required'];
                          date_default_timezone_set('Asia/Manila');
                          $date1 = new DateTime(date('Y-m-d H:i:s'));
                          $date2 = new DateTime($date_required);
                          $interval = $date1->diff($date2);
                           ?>

                           <tr class='clickable-row' data-href="details.php?id=<?php echo $row['ticket_id']?>">
                             <td id="type">
                               <?php if ($date1<$date2) {?>
                               <span class="<?php echo $class?>"> <?php echo $row['ticket_category'][0]?></span><p style="margin-top:25px;margin-bottom:-5px;font-size:8pt;"><?php echo $row['severity_level']?></p>
                             <?php } else{?>
                              <i id= "warning" class="material-icons">report</i> <p style="margin-top:25px;margin-bottom:-5px;font-size:8pt;"><?php echo $row['severity_level']?></p> <?php }?>
                             </td>
                             <td> <?php echo $row['ticket_number']?>  </td>
                             <td> <?php echo $row['ticket_status']?>  </td>
                             <td> <?php echo $row['ticket_title']?>   </td>
                             <td> <?php echo $row['date_prepared']?>  </td>
                             <td>
                               <?php if ($date1<$date2) {echo $interval->days . " days" . $interval->format(" %h hours");} else{echo "Overdue by" . "<br>" . $interval->days . " days" . $interval->format(" %h hours");} ?>
                              </td>
                             <td> <?php echo $row['remarks'] ?>       </td>
                         </tr>
                       <?php } ?>
                     </tbody>
                 </table>

              <?php } elseif ($_SESSION['user_type']=='Requestor') {?>
                <table id="datatable" class="striped">
                  <thead>
                    <tr>
                      <th></th>
                      <th>Ticket No.</th>
                      <th>Status</th>
                      <th>Department/Project</th>
                      <th>Access Requested</th>
                      <th>Date Created</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php
                    $id = $_SESSION['user_id'];
                    $query = "SELECT * FROM ticket_t LEFT JOIN service_ticket_t USING (ticket_id) LEFT JOIN user_access_ticket_t USING (ticket_id) LEFT JOIN sla_t sev ON sev.id = ticket_t.severity_level LEFT JOIN ticket_status_t stat ON stat.status_id = ticket_t.ticket_status WHERE (user_access_ticket_t.checker = $id AND ticket_t.ticket_status=5) OR (user_access_ticket_t.approver=$id AND ticket_t.ticket_status=5)";
                    include 'templates/review-tickets-sorter.php';
                    $stat = 'Pending';
                    $result = mysqli_query($db,$query);?>
                    <?php while($row = mysqli_fetch_assoc($result)){
                      switch($row['ticket_category'])
                       {
                           case("Technicals"):
                               $class = 'ticket_cat_t';
                               break;
                           case("Access"):
                              $class = 'ticket_cat_a';
                              break;
                           case("Network"):
                             $class = 'ticket_cat_n';
                             break;
                           case(""):
                             $class = 'ticket_cat_blank';
                             break;
                       } ?>
                   <tr class='clickable-row' data-href="details.php?id=<?php echo $row['ticket_id']?>">
                     <td id="type"><span class="<?php echo $class?>"> <?php echo $row['ticket_category'][0]?></span><p style="margin-top:25px;margin-bottom:-5px;font-size:8pt;"><?php echo $row['severity_level']?></p></td>
                     <td> <?php echo $row['ticket_number']?>  </td>
                     <td> <?php echo $row['ticket_status']?>  </td>
                     <td> <?php echo $row['ticket_title']?>   </td>
                     <td> <?php echo $row['date_prepared']?>  </td>
                     <td> <?php echo $row['remarks'] ?>       </td>
                   </tr>
                 <?php } ?>
                 </tbody>
                </table>

              <?php } ?>
            </div>
          </div>
          <?php include 'templates/ticketforms.php'; ?>
        </div>
        <?php include 'templates/mobile-ticket-buttons.php' ?>
        <?php include 'templates/js_resources.php' ?>
      </body>
    </html>
