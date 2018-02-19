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

  <!-- ****************************************************** -->

  <div class="col s12 m12 l12" id="content">
    <div class="main-content">
      <div class="col s12 m12 l12 table-header">
        <span class="table-title">My Resolved Tickets</span>
        <div class="count">
          <!-- Badge Counter -->
          <?php
            $db = mysqli_connect("localhost", "root", "", "eei_db");
            $query = "SELECT COUNT(t.ticket_id) AS count FROM ticket_t t LEFT JOIN user_t r ON t.user_id = r.user_id LEFT JOIN sla_t sev ON sev.id = t.severity_level LEFT JOIN ticket_status_t stat ON stat.status_id = t.ticket_status WHERE stat.ticket_status = 'Resolved' AND t.user_id = '".$_SESSION['user_id']."'";

            $result = mysqli_query($db,$query); ?>

            <?php while($row = mysqli_fetch_assoc($result)){ ?>
              <span class="badge main-count"> <?php echo $row['count'] . " tickets" ?></span>
            <?php } ?>
          </div>
          <div class="col s12" id="breadcrumb">
            <a href="#!" class="breadcrumb">My Tickets</a>
            <a href="#!" class="breadcrumb">Resolved Tickets</a>
          </div>
      </div>
      <div class="material-table" id="my-tickets">
        <div class="actions">
          <div class="sorter">
            <a href="my-tickets.php" class="waves-effect btn-sort">Remove Filter <i id="removefilter" class="material-icons">remove_circle</i></a>

            <!-- Dropdown Trigger for New Ticket -->
            <a class="dropdown-button btn-sort" data-activates="dropdown3" data-beloworigin="true">Category<i id="sort" class="material-icons">arrow_drop_down</i></a>
            <!-- Dropdown Structure -->
            <ul id="dropdown3" class="dropdown-content collection">
                <li><a href="?view=technicals" class="technicals">Technicals</a></li>
                <li><a href="?view=access" class="accesstickets">Access</a></li>
                <li><a href="?view=network" class="network">Network</a></li>
            </ul>
            <!-- Dropdown Trigger for New Ticket -->
              <a class="dropdown-button btn-sort" data-activates="dropdown4" data-beloworigin="true">Severity<i id="sort" class="material-icons">arrow_drop_down</i></a>
            <!-- Dropdown Structure -->
            <ul id="dropdown4" class="dropdown-content collection">
                <li><a href="?view=sev1">SEV1</a></li>
                <li><a href="?view=sev2">SEV2</a></li>
                <li><a href="?view=sev3">SEV3</a></li>
                <li><a href="?view=sev4">SEV4</a></li>
                <li><a href="?view=sev5">SEV5</a></li>
            </ul>
          </div>
        </div>
      <table id="datatable" class="striped">
        <thead>
          <tr>
            <th></th>
            <th>Ticket No.</th>
            <th>Status</th>
            <th>Notes</th>
            <th>Date Created</th>
            <th>Remarks</th>
          </tr>
        </thead>
          <tbody>
            <?php
              //all my resolved tickets
              $query = "SELECT * FROM ticket_t LEFT JOIN service_ticket_t USING (ticket_id) LEFT JOIN user_access_ticket_t USING (ticket_id) LEFT JOIN sla_t sev ON sev.id = ticket_t.severity_level LEFT JOIN ticket_status_t stat ON stat.status_id = ticket_t.ticket_status WHERE ticket_t.ticket_status = 'Resolved' AND ticket_t.user_id = '".$_SESSION['user_id']."'";

              switch ((isset($_GET['view']) ? $_GET['view'] : ''))
              {
                  case ("technicals"):
                    $query = "SELECT * FROM ticket_t LEFT JOIN service_ticket_t USING (ticket_id) LEFT JOIN user_access_ticket_t USING (ticket_id) LEFT JOIN sla_t sev ON sev.id = ticket_t.severity_level LEFT JOIN ticket_status_t stat ON stat.status_id = ticket_t.ticket_status WHERE stat.ticket_status = 'Resolved' AND ticket_t.ticket_category='Technicals' AND ticket_t.user_id = '".$_SESSION['user_id']."'";
                    break;

                  case ("access"):
                    $query = "SELECT * FROM ticket_t LEFT JOIN service_ticket_t USING (ticket_id) LEFT JOIN user_access_ticket_t USING (ticket_id) LEFT JOIN sla_t sev ON sev.id = ticket_t.severity_level LEFT JOIN ticket_status_t stat ON stat.status_id = ticket_t.ticket_status WHERE stat.ticket_status='Resolved' AND ticket_t.ticket_category='Access' AND ticket_t.user_id = '".$_SESSION['user_id']."'";
                    break;

                  case ("network"):
                    $query = "SELECT * FROM ticket_t LEFT JOIN service_ticket_t USING (ticket_id) LEFT JOIN user_access_ticket_t USING (ticket_id) LEFT JOIN sla_t sev ON sev.id = ticket_t.severity_level LEFT JOIN ticket_status_t stat ON stat.status_id = ticket_t.ticket_status WHERE stat.ticket_status='Resolved' AND ticket_t.ticket_category='Network' AND ticket_t.user_id = '".$_SESSION['user_id']."'";
                    break;
              }

              //if severity button for sorting is selected
              switch ((isset($_GET['view']) ? $_GET['view'] : ''))
              {
                  case ("sev1"):
                    $query = "SELECT * FROM ticket_t LEFT JOIN service_ticket_t USING (ticket_id) LEFT JOIN user_access_ticket_t USING (ticket_id) LEFT JOIN sla_t sev ON sev.id = ticket_t.severity_level LEFT JOIN ticket_status_t stat ON stat.status_id = ticket_t.ticket_status WHERE stat.ticket_status='Resolved' AND sev.severity_level='SEV1' AND ticket_t.user_id = '".$_SESSION['user_id']."'";
                    break;

                  case ("sev2"):
                    $query = "SELECT * FROM ticket_t LEFT JOIN service_ticket_t USING (ticket_id) LEFT JOIN user_access_ticket_t USING (ticket_id) LEFT JOIN sla_t sev ON sev.id = ticket_t.severity_level LEFT JOIN ticket_status_t stat ON stat.status_id = ticket_t.ticket_status WHERE stat.ticket_status='Resolved' AND sev.severity_level='SEV2' AND ticket_t.user_id = '".$_SESSION['user_id']."'";
                    break;

                  case ("sev3"):
                    $query = "SELECT * FROM ticket_t LEFT JOIN service_ticket_t USING (ticket_id) LEFT JOIN user_access_ticket_t USING (ticket_id) LEFT JOIN sla_t sev ON sev.id = ticket_t.severity_level LEFT JOIN ticket_status_t stat ON stat.status_id = ticket_t.ticket_status WHERE stat.ticket_status='Resolved' AND sev.severity_level='SEV3' AND ticket_t.user_id = '".$_SESSION['user_id']."'";
                    break;

                  case ("sev4"):
                    $query = "SELECT * FROM ticket_t LEFT JOIN service_ticket_t USING (ticket_id) LEFT JOIN user_access_ticket_t USING (ticket_id) LEFT JOIN sla_t sev ON sev.id = ticket_t.severity_level LEFT JOIN ticket_status_t stat ON stat.status_id = ticket_t.ticket_status WHERE stat.ticket_status='Resolved' AND sev.severity_level='SEV4' AND ticket_t.user_id = '".$_SESSION['user_id']."'";
                    break;

                  case ("sev5"):
                    $query = "SELECT * FROM ticket_t LEFT JOIN service_ticket_t USING (ticket_id) LEFT JOIN user_access_ticket_t USING (ticket_id) LEFT JOIN sla_t sev ON sev.id = ticket_t.severity_level LEFT JOIN ticket_status_t stat ON stat.status_id = ticket_t.ticket_status WHERE stat.ticket_status='Resolved' AND sev.severity_level='SEV5' AND ticket_t.user_id = '".$_SESSION['user_id']."'";
                    break;
              } ?>

              <?php $result = mysqli_query($db,$query);?>
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
      </div>
    </div>
    <!-- HIDDEN FORMS -->
    <?php include 'templates/ticketforms.php'; ?>
  </div>

  <!-- SCRIPT -->
  <?php include 'templates/js_resources.php' ?>
  </body>
</html>
