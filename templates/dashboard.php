<div class="col s12 m12 l12 table-header">
  <span class="table-title">Dashboard</span>
  <input id="request-form-export" name="submit" type="submit" value="Export to Excel" />

      <div class="col s12" id="breadcrumb">
        <a href="#!" class="breadcrumb">First</a>
        <a href="#!" class="breadcrumb">Second</a>
        <a href="#!" class="breadcrumb">Third</a>
      </div>

</div>
<div id="dashboard-main">
  <div class="row">
    <ul class="tabs">
     <li class="tab col s4 l4"><a href="#test-swipe-1">Status</a></li>
     <li class="tab col s4 l4"><a href="#test-swipe-2">Category</a></li>
     <li class="tab col s4 l4"><a href="#test-swipe-3">Severity</a></li>

    </ul>
  </div>

   <div id="test-swipe-1" class="col s12">
     <!-- <div class="col s12 m12 l12"> -->
       <div class="row" id="kb">
         <div class="col s12 m4 l2" id="db-panel">
           <div class="card-panel white">
             <span id="db-panel-label-overdue">Overdue</span>
             <!-- get number of tickets whose due date base on their severity level has passed -->
             <!-- placeholder lang yung result nito for now hehe -->
             <?php
             $db = mysqli_connect("localhost", "root", "", "eei_db");

               $query = "SELECT COUNT(*) AS status FROM ticket_t LEFT JOIN sla_t sev ON sev.id=ticket_t.severity_level LEFT JOIN ticket_status_t stat ON stat.status_id = ticket_t.ticket_status WHERE stat.ticket_status='In Progress'";
               $result = mysqli_query($db,$query);

               while($row = mysqli_fetch_assoc($result)){
                  echo "<h3 class=\"db-panel-label-overdue\">" . $row['status'] . "</h3>";
              };
             ?>
           </div>
         </div>
         <div class="col s6 m4 l2" id="db-panel">
           <div class="card-panel white">
             <span class="black-text" id="db-panel-label">In Progress</span>
             <?php
             $db = mysqli_connect("localhost", "root", "", "eei_db");

               $query = "SELECT COUNT(*) AS status FROM ticket_t LEFT JOIN sla_t sev ON sev.id=ticket_t.severity_level LEFT JOIN ticket_status_t stat ON stat.status_id = ticket_t.ticket_status WHERE stat.ticket_status='In Progress'";
               $result = mysqli_query($db,$query);

               while($row = mysqli_fetch_assoc($result)){
                  echo "<h3>" . $row['status'] . "</h3>";
              };
             ?>
           </div>
         </div>
         <div class="col s6 m4 l2" id="db-panel">
           <div class="card-panel white">
             <span class="black-text" id="db-panel-label">Pending</span>
             <?php
             $db = mysqli_connect("localhost", "root", "", "eei_db");

               $query = "SELECT COUNT(*) AS status FROM ticket_t LEFT JOIN sla_t sev ON sev.id=ticket_t.severity_level LEFT JOIN ticket_status_t stat ON stat.status_id = ticket_t.ticket_status WHERE stat.ticket_status='Pending'";
               $result = mysqli_query($db,$query);

               while($row = mysqli_fetch_assoc($result)){
                 echo "<h3>" . $row['status'] . "</h3>";
              };
             ?>
           </div>
         </div>
         <div class="col s6 m4 l2" id="db-panel">
           <div class="card-panel white">
             <span class="black-text" id="db-panel-label">Resolved</span>
             <?php
             $db = mysqli_connect("localhost", "root", "", "eei_db");

               $query = "SELECT COUNT(*) AS status FROM ticket_t LEFT JOIN sla_t sev ON sev.id=ticket_t.severity_level LEFT JOIN ticket_status_t stat ON stat.status_id = ticket_t.ticket_status WHERE stat.ticket_status='Resolved'";
               $result = mysqli_query($db,$query);

               while($row = mysqli_fetch_assoc($result)){
                 echo "<h3>" . $row['status'] . "</h3>";
              };
             ?>
           </div>
         </div>
         <div class="col s6 m4 l2" id="db-panel">
           <div class="card-panel white">
             <span class="black-text" id="db-panel-label">Closed</span>
             <?php
             $db = mysqli_connect("localhost", "root", "", "eei_db");

               $query = "SELECT COUNT(*) AS status FROM ticket_t LEFT JOIN sla_t sev ON sev.id=ticket_t.severity_level LEFT JOIN ticket_status_t stat ON stat.status_id = ticket_t.ticket_status WHERE stat.ticket_status='Closed'";
               $result = mysqli_query($db,$query);

               while($row = mysqli_fetch_assoc($result)){
                 echo "<h3>" . $row['status'] . "</h3>";
              };
             ?>
           </div>
         </div>
         <div class="col s6 m4 l2" id="db-panel">
           <div class="card-panel white">
             <span class="black-text" id="db-panel-label">Cancelled</span>
             <?php
             $db = mysqli_connect("localhost", "root", "", "eei_db");

               $query = "SELECT COUNT(*) AS status FROM ticket_t LEFT JOIN sla_t sev ON sev.id=ticket_t.severity_level LEFT JOIN ticket_status_t stat ON stat.status_id = ticket_t.ticket_status WHERE stat.ticket_status='Cancelled'";
               $result = mysqli_query($db,$query);

               while($row = mysqli_fetch_assoc($result)){
                 echo "<h3>" . $row['status'] . "</h3>";
              };
             ?>
           </div>
         </div>
       </div>
     <!-- </div> -->
   </div>

<div id="test-swipe-2" class="col s12">
 <div class="col s12 m12 l12">
   <div class="row" id="kb">
     <div class="col s12 m4 l4">
       <div class="card-panel white" id="db-panel-2">
         <span class="black-text" id="db-panel-label">Technicals</span>
         <!-- get number of tickets whose due date base on their severity level has passed -->
         <?php
         $db = mysqli_connect("localhost", "root", "", "eei_db");

           $query = "SELECT COUNT(ticket_category) AS cat FROM ticket_t WHERE ticket_category='Technicals'";
           $result = mysqli_query($db,$query);

           while($row = mysqli_fetch_assoc($result)){
              echo "<h3>" . $row['cat'] . "</h3>";
          };
         ?>
       </div>
     </div>
     <div class="col s12 m4 l4">
       <div class="card-panel white" id="db-panel-2">
         <span class="black-text" id="db-panel-label">Access</span>
         <?php
         $db = mysqli_connect("localhost", "root", "", "eei_db");

         $query = "SELECT COUNT(ticket_category) AS cat FROM ticket_t WHERE ticket_category='Access'";
           $result = mysqli_query($db,$query);

           while($row = mysqli_fetch_assoc($result)){
              echo "<h3>" . $row['cat'] . "</h3>";
          };
         ?>
       </div>
     </div>
     <div class="col s12 m4 l4">
       <div class="card-panel white" id="db-panel-2">
         <span class="black-text" id="db-panel-label">Network</span>
         <?php
         $db = mysqli_connect("localhost", "root", "", "eei_db");

           $query = "SELECT COUNT(ticket_category) AS cat FROM ticket_t WHERE ticket_category='Network'";
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
 <div id="test-swipe-3" class="col s12">
   <div class="col s12 m12 l12">
     <div class="row" id="kb">
       <div class="col s6 m6 l13" id="db-panel">
         <div class="card-panel white">
           <span class="black-text" id="db-panel-label">SEV1</span>
           <?php
           $db = mysqli_connect("localhost", "root", "", "eei_db");

             $query = "SELECT COUNT(*) AS sevlvl FROM ticket_t LEFT JOIN sla_t sev ON sev.id = ticket_t.severity_level WHERE sev.severity_level='SEV1'";
             $result = mysqli_query($db,$query);

             while($row = mysqli_fetch_assoc($result)){
                echo "<h3>" . $row['sevlvl'] . "</h3>";
            };
           ?>
         </div>
       </div>
       <div class="col s6 m6 l13" id="db-panel">
         <div class="card-panel white">
           <span class="black-text" id="db-panel-label">SEV2</span>
           <?php
           $db = mysqli_connect("localhost", "root", "", "eei_db");

           $query = "SELECT COUNT(*) AS sevlvl FROM ticket_t LEFT JOIN sla_t sev ON sev.id = ticket_t.severity_level WHERE sev.severity_level='SEV2'";
           $result = mysqli_query($db,$query);

           while($row = mysqli_fetch_assoc($result)){
              echo "<h3>" . $row['sevlvl'] . "</h3>";
            };
           ?>
         </div>
       </div>
       <div class="col s6 m6 l13" id="db-panel">
         <div class="card-panel white">
           <span class="black-text" id="db-panel-label">SEV3</span>
           <?php
           $db = mysqli_connect("localhost", "root", "", "eei_db");

           $query = "SELECT COUNT(*) AS sevlvl FROM ticket_t LEFT JOIN sla_t sev ON sev.id = ticket_t.severity_level WHERE sev.severity_level='SEV3'";
           $result = mysqli_query($db,$query);

           while($row = mysqli_fetch_assoc($result)){
              echo "<h3>" . $row['sevlvl'] . "</h3>";
            };
           ?>
         </div>
       </div>
       <div class="col s6 m6 l13" id="db-panel">
         <div class="card-panel white">
           <span class="black-text" id="db-panel-label">SEV4</span>
           <?php
           $db = mysqli_connect("localhost", "root", "", "eei_db");

           $query = "SELECT COUNT(*) AS sevlvl FROM ticket_t LEFT JOIN sla_t sev ON sev.id = ticket_t.severity_level WHERE sev.severity_level='SEV4'";
           $result = mysqli_query($db,$query);

           while($row = mysqli_fetch_assoc($result)){
              echo "<h3>" . $row['sevlvl'] . "</h3>";
            };
           ?>
         </div>
       </div>
       <div class="col s12 m12 l13" id="db-panel">
         <div class="card-panel white">
           <span class="black-text" id="db-panel-label">SEV5</span>
           <?php
           $db = mysqli_connect("localhost", "root", "", "eei_db");

           $query = "SELECT COUNT(*) AS sevlvl FROM ticket_t LEFT JOIN sla_t sev ON sev.id = ticket_t.severity_level WHERE sev.severity_level='SEV5'";
           $result = mysqli_query($db,$query);

           while($row = mysqli_fetch_assoc($result)){
              echo "<h3>" . $row['sevlvl'] . "</h3>";
            };
           ?>
         </div>
       </div>
     </div>
   </div>
 </div>
</div>
