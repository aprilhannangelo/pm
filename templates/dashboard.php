<div class="col s12 m12 l12 table-header">
  <span class="table-title">Performance Dashboard</span>
  <input id="request-form-export" name="submit" type="submit" value="Export to Excel" />
</div>
<div id="dashboard-main">
  <div class="row">
    <div class="col s12 m12 l12">
      <div class="row" id="kb">
        <h6 id="dashboard">Ticket Count For <?php echo date('F') ?></h6>
          <div class="col s12 m8">
            <div class="row" id="sev">
              <?php
              $query = "SELECT s.severity_level, count(t.ticket_id) as count FROM ticket_t t RIGHT JOIN sla_t s ON (t.severity_level=s.id) group by s.id UNION SELECT 'Unassigned', count(ticket_id) FROM ticket_t t where MONTH(date_prepared)=MONTH(CURRENT_DATE()) AND t.severity_level IS NULL";
              $result = mysqli_query($db,$query);
              while($row = mysqli_fetch_assoc($result)){
                switch($row['severity_level'])
                {
                    case("SEV1"):
                        $class = 'sev1';
                        break;

                   case("SEV2"):
                       $class = 'sev2';
                       break;

                   case("SEV3"):
                       $class = 'sev3';
                       break;

                   case("SEV4"):
                       $class = 'sev4';
                       break;

                   case("SEV5"):
                       $class = 'sev5';
                       break;

                  case("Unassigned"):
                      $class = 'unassigned';
                      break;
                }
                ?>
                  <div class="col s6 m6 l4">
                    <div class="card horizontal">
                      <div class="card-stacked">
                        <div class="card-content">
                          <p class='<?php echo $class?>' id="sev"><?php echo $row['severity_level']?></p>
                           <?php echo  $row['count'] . "<br>"; ?>
                        </div>
                      </div>
                    </div>
                  </div>
                <?php };?>
            </div>
            <div class="chart">
              <div class="col s12 m12 l11" id="chart">
                <h6 id="dashboard">Ticket Count Per Month</h6>
                <canvas id="mycanvas"></canvas>
              </div>
            </div>
          </div>
          <div class="col s12 m6 l4">
            <div class="col s6 m6 l6">
              <div class="card horizontal">
              <div class="card-image" id="dashboard">
                <i class="small material-icons">lock_open</i>
              </div>
              <div class="card-stacked">
                <div class="card-content">
                  <p id="dashboard" class="tooltippied" data-position="right" data-delay="50" data-tooltip="In Progress, Pending, New, Approved, Checked">Open</p>
                  <?php
                    $query = "SELECT COUNT(*) AS count FROM ticket_t WHERE MONTH(date_prepared)=MONTH(CURRENT_DATE()) AND ticket_status < '7'";
                    $result = mysqli_query($db,$query);

                    while($row = mysqli_fetch_assoc($result)){
                       echo "<h5>" . $row['count'] . "</h5>";
                   };
                  ?>

                </div>
              </div>
            </div>
            </div>
            <div class="card horizontal">
              <div class="card-image" id="dashboard">
                <i class="small material-icons">lock_outline</i>
              </div>
              <div class="card-stacked">
                <div class="card-content">
                  <p id="dashboard">Closed</p>
                  <?php
                    $query = "SELECT COUNT(*) AS count FROM ticket_t WHERE MONTH(date_prepared)=MONTH(CURRENT_DATE()) AND ticket_status > '6' AND severity_level IS NULL AND ticket_category IS NULL";
                    $result = mysqli_query($db,$query);

                    while($row = mysqli_fetch_assoc($result)){
                       echo "<h5>" . $row['count'] . "</h5>";
                   };
                  ?>
                </div>
              </div>
            </div>
              <div class="col s12 m12 l12">
                <div class="card-panel tech" id="db-panel-2">
                  <span class="white-text" id="db-panel-label">Technicals
                    <span><i class="large material-icons" id="dashboard">storage</i></span>
                  </span>
                  <!-- get number of tickets whose due date base on their severity level has passed -->
                  <?php
                  $db = mysqli_connect("localhost", "root", "", "eei_db");

                    $query = "SELECT COUNT(*) AS cat FROM ticket_t WHERE MONTH(date_prepared)=MONTH(CURRENT_DATE()) AND ticket_category='Technicals'";
                    $result = mysqli_query($db,$query);

                    while($row = mysqli_fetch_assoc($result)){
                       echo "<h3>" . $row['cat'] . "</h3>";
                   };
                  ?>

                </div>
              </div>
              <div class="col s12 m12 l12">
                <div class="card-panel access" id="db-panel-2">
                  <span class="white-text" id="db-panel-label">Access
                    <span><i class="large material-icons" id="dashboard">vpn_lock</i></span>
                  </span>
                  <?php
                  $db = mysqli_connect("localhost", "root", "", "eei_db");

                  $query = "SELECT COUNT(*) AS cat FROM ticket_t WHERE MONTH(date_prepared)=MONTH(CURRENT_DATE()) AND ticket_category='Access'";
                    $result = mysqli_query($db,$query);

                    while($row = mysqli_fetch_assoc($result)){
                       echo "<h3>" . $row['cat'] . "</h3>";
                   };
                  ?>
                </div>
              </div>
              <div class="col s12 m12 l12">
                <div class="card-panel network" id="db-panel-2">
                  <span class="white-text" id="db-panel-label">Network
                      <span><i class="large material-icons" id="dashboard">network_check</i></span>
                    </span>
                  </span>
                  <?php
                  $db = mysqli_connect("localhost", "root", "", "eei_db");

                    $query = "SELECT COUNT(*) AS cat FROM ticket_t WHERE MONTH(date_prepared)=MONTH(CURRENT_DATE()) AND ticket_category='Network'";
                    $result = mysqli_query($db,$query);

                    while($row = mysqli_fetch_assoc($result)){
                      echo "<h3>" . $row['cat'] . "</h3>";
                   };
                  ?>
                </div>
              </div>
          </div>
      </div>
    </div>
  </div>
</div>
