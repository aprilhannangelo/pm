<?php
$db = mysqli_connect("localhost", "root", "", "eei_db");{ ?>

<div class="col s12 m12 l2" id="sidenav">
    <ul id="slide-out" class="side-nav fixed">
      <div class="card-panel" id="user">
        <div class="container">
          <span class="welcome">WELCOME</span><br>
          <a class="user-name" href="myprofile.php"><u><?php echo $_SESSION['first_name'] . ' '. $_SESSION['last_name'] ?></u></a><br>
          <span class="type"><?php echo $_SESSION['user_type'] ?></span>
        </div>
      </div>
      <li><a class="waves-effect" href="home.php"><i class="tiny material-icons">home</i>Home</a></li>

      <!-- My Tickets -->
      <ul class="collapsible collapsible-accordion">
        <li><a class="collapsible-header waves-effect tooltipped" data-position="right" data-delay="50" data-tooltip="Tickets I submitted" href="#!"><i class="tiny material-icons">receipt</i>My Tickets</a>
          <div class="collapsible-body">
            <ul>
              <li class="collapsible"><a class="all" href="my-tickets.php">All Tickets
                <!-- Badge Counter -->
                <?php
                  $query = "SELECT COUNT(t.ticket_id) AS count FROM ticket_t t LEFT JOIN user_t r ON t.user_id = r.user_id LEFT JOIN sla_t sev ON sev.id = t.severity_level LEFT JOIN ticket_status_t stat ON stat.status_id = t.ticket_status WHERE t.user_id = '".$_SESSION['user_id']."'";

                  $result = mysqli_query($db,$query); ?>

                  <?php while($row = mysqli_fetch_assoc($result)){ ?>
                    <span class="badge ticket_count"> <?php echo $row['count'] ?></span>
                  <?php } ?>
              </a></li>
              <li class="collapsible"><a class="inprogress" href="my-inprogress-tickets.php">In Progress
                <!-- Badge Counter -->
                <?php
                  $query = "SELECT COUNT(t.ticket_id) AS count FROM ticket_t t LEFT JOIN user_t r ON t.user_id = r.user_id LEFT JOIN sla_t sev ON sev.id = t.severity_level LEFT JOIN ticket_status_t stat ON stat.status_id = t.ticket_status WHERE stat.ticket_status='In Progress' AND t.user_id = '".$_SESSION['user_id']."'";

                  $result = mysqli_query($db,$query); ?>

                  <?php while($row = mysqli_fetch_assoc($result)){ ?>
                    <span class="badge ticket_count"> <?php echo $row['count'] ?></span>
                  <?php } ?>
              </a></li>
              <li class="collapsible"><a class="pending" href="my-pending-tickets.php">Pending
                <!-- Badge Counter -->
                <?php
                  $query = "SELECT COUNT(t.ticket_id) AS count FROM ticket_t t LEFT JOIN user_t r ON t.user_id = r.user_id LEFT JOIN sla_t sev ON sev.id = t.severity_level LEFT JOIN ticket_status_t stat ON stat.status_id = t.ticket_status WHERE stat.ticket_status='Pending' AND t.user_id = '".$_SESSION['user_id']."'";

                  $result = mysqli_query($db,$query); ?>

                  <?php while($row = mysqli_fetch_assoc($result)){ ?>
                    <span class="badge ticket_count"> <?php echo $row['count'] ?></span>
                  <?php } ?>

                  <li class="collapsible"><a class="resolved" href="my-resolved-tickets.php">Resolved
                    <!-- Badge Counter -->
                    <?php
                      $query = "SELECT COUNT(t.ticket_id) AS count FROM ticket_t t LEFT JOIN user_t r ON t.user_id = r.user_id LEFT JOIN sla_t sev ON sev.id = t.severity_level LEFT JOIN ticket_status_t stat ON stat.status_id = t.ticket_status WHERE stat.ticket_status='Resolved' AND t.user_id = '".$_SESSION['user_id']."'";

                      $result = mysqli_query($db,$query); ?>

                      <?php while($row = mysqli_fetch_assoc($result)){ ?>
                        <span class="badge ticket_count"> <?php echo $row['count'] ?></span>
                      <?php } ?>
                  </a></li>

                  <li class="collapsible"><a class="all" href="my-closed-tickets.php">Closed
                    <!-- Badge Counter -->
                    <?php
                      $query = "SELECT COUNT(t.ticket_id) AS count FROM ticket_t t LEFT JOIN user_t r ON t.user_id = r.user_id LEFT JOIN sla_t sev ON sev.id = t.severity_level LEFT JOIN ticket_status_t stat ON stat.status_id = t.ticket_status WHERE stat.ticket_status='Closed' AND t.user_id = '".$_SESSION['user_id']."'";

                      $result = mysqli_query($db,$query); ?>

                      <?php while($row = mysqli_fetch_assoc($result)){ ?>
                        <span class="badge ticket_count"> <?php echo $row['count'] ?></span>
                      <?php } ?>
                  </a></li>
            </ul>
          </div> <!-- End of div collapsible body -->
        </li>
      </ul> <!-- End of div My Tickets accrodion -->

      <!-- Other Links per User Type -->
      <?php if($_SESSION['user_type'] == 'Administrator'){ ?>
        <ul class="collapsible collapsible-accordion">
          <li><a class="collapsible-header tooltipped" data-position="right" data-delay="50" data-tooltip="Tickets of all requestors"  href="#!"><i class="tiny material-icons">view_list</i>Tickets for Review</a>
            <div class="collapsible-body">
              <ul>
                <li class="collapsible"><a href="review-incoming-tickets.php">Incoming
                  <?php
                    $query = "SELECT COUNT(*) AS count FROM ticket_t LEFT JOIN service_ticket_t USING (ticket_id) LEFT JOIN user_access_ticket_t USING (ticket_id) WHERE (ticket_t.ticket_category is NULL AND ticket_t.severity_level is NULL AND ticket_t.ticket_type ='Service') OR (ticket_t.ticket_category is NULL AND ticket_t.severity_level is NULL AND user_access_ticket_t.isApproved=true)";

                    $result = mysqli_query($db,$query);
                    while($row = mysqli_fetch_assoc($result)){ ?>
                      <span class="badge ticket_count"> <?php echo $row['count'] ?></span>
                    <?php } ?>
                  </a>
                </li>
                <li class="collapsible"><a href="review-pending-tickets.php">Pending
                  <?php
                    $query = "SELECT COUNT(*) as count FROM ticket_t WHERE ticket_status=5";
                    $result = mysqli_query($db,$query);
                    while($row = mysqli_fetch_assoc($result)) { ?>
                      <span class="badge ticket_count"> <?php echo $row['count'] ?></span>
                    <?php } ?>
                </a></li>
                <li class="collapsible"><a href="review-inprogress-tickets.php">In Progress
                  <?php
                    $query = "SELECT COUNT(*) as count FROM ticket_t WHERE ticket_status=6";
                    $result = mysqli_query($db,$query);
                    while($row = mysqli_fetch_assoc($result)) { ?>
                      <span class="badge ticket_count"> <?php echo $row['count'] ?></span>
                    <?php } ?>
                </a></li>
                <li class="collapsible"><a href="review-resolved-tickets.php">Resolved
                  <?php
                    $query = "SELECT COUNT(*) as count FROM ticket_t WHERE ticket_status=7";
                    $result = mysqli_query($db,$query);
                    while($row = mysqli_fetch_assoc($result)) { ?>
                      <span class="badge ticket_count"> <?php echo $row['count'] ?></span>
                    <?php } ?>
                </a></li>
                <li class="collapsible"><a href="review-closed-tickets.php">Closed
                  <?php
                    $query = "SELECT COUNT(*) as count FROM ticket_t WHERE ticket_status=8";
                    $result = mysqli_query($db,$query);
                    while($row = mysqli_fetch_assoc($result)) { ?>
                      <span class="badge ticket_count"> <?php echo $row['count'] ?></span>
                    <?php } ?>
                </a></li>
              </ul>
            </div>
            <li><a class="waves-effect" href="knowledgebase.php"><i class="tiny material-icons">book</i>Knowledge Base</a></li>

        </ul>
      <?php } elseif($_SESSION['user_type'] == 'Requestor'){ ?>
        <ul class="collapsible collapsible-accordion">
          <li><a class="collapsible-header tooltipped" data-position="right" data-delay="50" data-tooltip="Tickets of all requestors"  href="#!"><i class="tiny material-icons">view_list</i>Tickets for Review</a>
            <div class="collapsible-body">
              <ul>
                <li class="collapsible"><a href="review-incoming-tickets.php">Incoming
                    <?php
                      $id = $_SESSION['user_id'];
                      $query = "SELECT COUNT(*) as count FROM ticket_t LEFT JOIN service_ticket_t USING (ticket_id) LEFT JOIN user_access_ticket_t USING (ticket_id) LEFT JOIN sla_t sev ON sev.id = ticket_t.severity_level LEFT JOIN ticket_status_t stat ON stat.status_id = ticket_t.ticket_status WHERE (user_access_ticket_t.checker = $id AND user_access_ticket_t.isChecked is NULL AND ticket_t.ticket_status = '1') OR (user_access_ticket_t.approver=$id AND user_access_ticket_t.isChecked=true AND ticket_t.ticket_status = '1')";

                      $result = mysqli_query($db,$query);
                      while($row = mysqli_fetch_assoc($result)){ ?>
                        <span class="badge ticket_count"> <?php echo $row['count'] ?></span>
                    <?php } ?>
                  </a>
                </li>
                <li class="collapsible"><a href="checkedRequests.php">Checked
                    <?php
                      $id = $_SESSION['user_id'];
                      $query = "SELECT COUNT(*) AS count FROM ticket_t LEFT JOIN user_access_ticket_t USING (ticket_id)
                                WHERE (user_access_ticket_t.checker = $id AND user_access_ticket_t.isChecked = '1')";
                      $result = mysqli_query($db,$query);
                      while($row = mysqli_fetch_assoc($result)){ ?>
                        <span class="badge ticket_count"> <?php echo $row['count'] ?></span>
                    <?php } ?>
                  </a>
                </li>
                <li class="collapsible"><a href="approvedRequests.php">Approved
                    <?php
                    $id = $_SESSION['user_id'];
                    $query = "SELECT COUNT(*) as count FROM ticket_t LEFT JOIN user_access_ticket_t USING (ticket_id)
                              WHERE user_access_ticket_t.approver = $id AND user_access_ticket_t.isApproved = '1'";
                      $result = mysqli_query($db,$query);
                      while($row = mysqli_fetch_assoc($result)){ ?>
                        <span class="badge ticket_count"> <?php echo $row['count'] ?></span>
                    <?php } ?>
                  </a>
                </li>
              </ul>
          </div>
        </ul>
      </ul>
      <?php } elseif($_SESSION['user_type'] == 'Technicals Group Manager'){ ?>
        <ul class="collapsible collapsible-accordion">
          <li><a class="collapsible-header tooltipped" data-position="right" data-delay="50" data-tooltip="Tickets of my team"  href="#!"><i class="tiny material-icons">phonelink_setup</i>Technicals Tickets</a>
            <div class="collapsible-body">
              <ul>
                <li class="collapsible"><a href="review-incoming-tickets.php">Incoming
                  <?php
                      $id = $_SESSION['user_id'];
                      $query = "SELECT COUNT(*) AS count FROM service_ticket_t LEFT JOIN ticket_t t USING (ticket_id) WHERE t.ticket_category='Technicals' AND t.ticket_agent_id IS NULL";
                      $result = mysqli_query($db,$query); ?>
                        <?php while($row = mysqli_fetch_assoc($result)){ ?>
                          <span class="badge ticket_count"> <?php echo $row['count'] ?></span>
                  <?php } ?>
                </a></li>
                <li class="collapsible"><a href="review-tickets.php">All
                  <?php
                      $id = $_SESSION['user_id'];
                      $query = "SELECT COUNT(*) AS count FROM service_ticket_t st LEFT JOIN ticket_t t USING (ticket_id) WHERE t.ticket_category='Technicals'";

                      $result = mysqli_query($db,$query); ?>
                        <?php while($row = mysqli_fetch_assoc($result)){ ?>
                          <span class="badge ticket_count"> <?php echo $row['count'] ?></span>
                  <?php } ?>
                </a></li>
                <li class="collapsible"><a href="review-inprogress-tickets.php">In Progress
                  <?php
                      $query = "SELECT COUNT(*) AS count FROM service_ticket_t st LEFT JOIN ticket_t t USING (ticket_id) WHERE t.ticket_category='Technicals' AND t.ticket_status=6";

                      $result = mysqli_query($db,$query); ?>
                        <?php while($row = mysqli_fetch_assoc($result)){ ?>
                          <span class="badge ticket_count"> <?php echo $row['count'] ?></span>
                  <?php } ?>
                </a></li>
                <li class="collapsible"><a href="review-resolved-tickets.php">Resolved
                  <?php
                      $query = "SELECT COUNT(*) AS count FROM service_ticket_t st LEFT JOIN ticket_t t USING (ticket_id) WHERE t.ticket_category='Technicals' AND t.ticket_status=7";

                      $result = mysqli_query($db,$query); ?>
                        <?php while($row = mysqli_fetch_assoc($result)){ ?>
                          <span class="badge ticket_count"> <?php echo $row['count'] ?></span>
                  <?php } ?>
                </a></li>
                <li class="collapsible"><a href="review-closed-tickets.php">Closed
                  <?php
                    $query = "SELECT COUNT(*) AS count FROM service_ticket_t st LEFT JOIN ticket_t t USING (ticket_id) WHERE t.ticket_category='Technicals' AND t.ticket_status=8";

                      $result = mysqli_query($db,$query); ?>
                        <?php while($row = mysqli_fetch_assoc($result)){ ?>
                          <span class="badge ticket_count"> <?php echo $row['count'] ?></span>
                  <?php } ?>
                </a></li>
              </ul>
            </div>
          </li>
        </ul>
      <?php } elseif($_SESSION['user_type'] == 'Access Group Manager'){ ?>
        <ul class="collapsible collapsible-accordion">
          <li><a class="collapsible-header tooltipped" data-position="right" data-delay="50" data-tooltip="Tickets of my team"  href="#!"><i class="tiny material-icons">phonelink_setup</i>Access Tickets</a>
            <div class="collapsible-body">
              <ul>
                <li class="collapsible"><a href="review-incoming-tickets.php">Incoming
                  <?php
                      $id = $_SESSION['user_id'];
                      $query = "SELECT COUNT(*) AS count FROM user_access_ticket_t LEFT JOIN ticket_t t USING (ticket_id) WHERE t.ticket_category='Access' AND t.ticket_agent_id IS NULL";
                      $result = mysqli_query($db,$query); ?>
                        <?php while($row = mysqli_fetch_assoc($result)){ ?>
                          <span class="badge ticket_count"> <?php echo $row['count'] ?></span>
                  <?php } ?>
                </a></li>
                <li class="collapsible"><a href="review-tickets.php">All
                  <?php
                      $id = $_SESSION['user_id'];
                      $query = "SELECT COUNT(*) AS count FROM user_access_ticket_t LEFT JOIN ticket_t t USING (ticket_id) WHERE t.ticket_category='Technicals'";

                      $result = mysqli_query($db,$query); ?>
                        <?php while($row = mysqli_fetch_assoc($result)){ ?>
                          <span class="badge ticket_count"> <?php echo $row['count'] ?></span>
                  <?php } ?>
                </a></li>
                <li class="collapsible"><a href="review-inprogress-tickets.php">In Progress
                  <?php
                      $query = "SELECT COUNT(*) AS count FROM user_access_ticket_t LEFT JOIN ticket_t t USING (ticket_id) WHERE t.ticket_category='Technicals' AND t.ticket_status=6";

                      $result = mysqli_query($db,$query); ?>
                        <?php while($row = mysqli_fetch_assoc($result)){ ?>
                          <span class="badge ticket_count"> <?php echo $row['count'] ?></span>
                  <?php } ?>
                </a></li>
                <li class="collapsible"><a href="review-resolved-tickets.php">Resolved
                  <?php
                      $query = "SELECT COUNT(*) AS count FROM user_access_ticket_t LEFT JOIN ticket_t t USING (ticket_id) WHERE t.ticket_category='Technicals' AND t.ticket_status=7";

                      $result = mysqli_query($db,$query); ?>
                        <?php while($row = mysqli_fetch_assoc($result)){ ?>
                          <span class="badge ticket_count"> <?php echo $row['count'] ?></span>
                  <?php } ?>
                </a></li>
                <li class="collapsible"><a href="review-closed-tickets.php">Closed
                  <?php
                    $query = "SELECT COUNT(*) AS count FROM user_access_ticket_t LEFT JOIN ticket_t t USING (ticket_id) WHERE t.ticket_category='Technicals' AND t.ticket_status=8";

                      $result = mysqli_query($db,$query); ?>
                        <?php while($row = mysqli_fetch_assoc($result)){ ?>
                          <span class="badge ticket_count"> <?php echo $row['count'] ?></span>
                  <?php } ?>
                </a></li>
              </ul>
            </div>
          </li>
        </ul>
        <li><a href="manageUsers.php"><i class="tiny material-icons">settings</i>Manage Users</a></li>
        <li><a class="waves-effect" href="knowledgebase.php"><i class="tiny material-icons">book</i>Knowledge Base</a></li>
      <?php } elseif($_SESSION['user_type'] == 'Network Group Manager'){?>
        <ul class="collapsible collapsible-accordion">
          <li><a class="collapsible-header tooltipped" data-position="right" data-delay="50" data-tooltip="Tickets of my team"  href="#!"><i class="tiny material-icons">phonelink_setup</i>Network Tickets</a>
            <div class="collapsible-body">
              <ul>
                <li class="collapsible"><a href="review-incoming-tickets.php">Incoming
                  <?php
                      $id = $_SESSION['user_id'];
                      $query = "SELECT COUNT(*) AS count FROM ticket_t WHERE ticket_category='Network' AND ticket_agent_id IS NULL";
                      $result = mysqli_query($db,$query); ?>
                        <?php while($row = mysqli_fetch_assoc($result)){ ?>
                          <span class="badge ticket_count"> <?php echo $row['count'] ?></span>
                  <?php } ?>
                </a></li>
                <li class="collapsible"><a href="review-tickets.php">All
                  <?php
                      $id = $_SESSION['user_id'];
                      $query = "SELECT COUNT(*) AS count FROM ticket_t WHERE ticket_category='Network'";

                      $result = mysqli_query($db,$query); ?>
                        <?php while($row = mysqli_fetch_assoc($result)){ ?>
                          <span class="badge ticket_count"> <?php echo $row['count'] ?></span>
                  <?php } ?>
                </a></li>
                <li class="collapsible"><a href="review-inprogress-tickets.php">In Progress
                  <?php
                      $query = "SELECT COUNT(*) AS count FROM ticket_t WHERE ticket_category='Network'AND t.ticket_status=6";

                      $result = mysqli_query($db,$query); ?>
                        <?php while($row = mysqli_fetch_assoc($result)){ ?>
                          <span class="badge ticket_count"> <?php echo $row['count'] ?></span>
                  <?php } ?>
                </a></li>
                <li class="collapsible"><a href="review-resolved-tickets.php">Resolved
                  <?php
                      $query = "SELECT COUNT(*) AS count FROM ticket_t WHERE ticket_category='Network'AND ticket_status=7";

                      $result = mysqli_query($db,$query); ?>
                        <?php while($row = mysqli_fetch_assoc($result)){ ?>
                          <span class="badge ticket_count"> <?php echo $row['count'] ?></span>
                  <?php } ?>
                </a></li>
                <li class="collapsible"><a href="review-closed-tickets.php">Closed
                  <?php
                    $query = "SELECT COUNT(*) AS count FROM ticket_t WHERE ticket_category='Network'AND ticket_status=8";

                      $result = mysqli_query($db,$query); ?>
                        <?php while($row = mysqli_fetch_assoc($result)){ ?>
                          <span class="badge ticket_count"> <?php echo $row['count'] ?></span>
                  <?php } ?>
                </a></li>
              </ul>
            </div>
          </li>
        </ul>
      <?php } elseif($_SESSION['user_type'] == 'Technician'){ ?>
  <ul class="collapsible collapsible-accordion">
    <li><a class="collapsible-header tooltipped" data-position="right" data-delay="50" data-tooltip="Tickets of my team"  href="#!"><i class="tiny material-icons">phonelink_setup</i> Assigned Tickets</a>
      <div class="collapsible-body">
        <ul>
          <li class="collapsible"><a href="review-incoming-tickets.php">Incoming
            <?php
                $id = $_SESSION['user_id'];
                $query = "SELECT COUNT(*) AS count FROM ticket_t WHERE ticket_agent_id=$id AND ticket_status=5";
                $result = mysqli_query($db,$query); ?>
                  <?php while($row = mysqli_fetch_assoc($result)){ ?>
                    <span class="badge ticket_count"> <?php echo $row['count'] ?></span>
            <?php } ?>
          </a></li>
          <li class="collapsible"><a href="review-tickets.php">All
            <?php
                $id = $_SESSION['user_id'];
                $query = "SELECT COUNT(*) AS count FROM ticket_t WHERE ticket_agent_id=$id";

                $result = mysqli_query($db,$query); ?>
                  <?php while($row = mysqli_fetch_assoc($result)){ ?>
                    <span class="badge ticket_count"> <?php echo $row['count'] ?></span>
            <?php } ?>
          </a></li>
          <li class="collapsible"><a href="review-inprogress-tickets.php">In Progress
            <?php
                $query = "SELECT COUNT(*) AS count FROM ticket_t WHERE ticket_agent_id=$id AND ticket_status=6";

                $result = mysqli_query($db,$query); ?>
                  <?php while($row = mysqli_fetch_assoc($result)){ ?>
                    <span class="badge ticket_count"> <?php echo $row['count'] ?></span>
            <?php } ?>
          </a></li>
          <li class="collapsible"><a href="review-resolved-tickets.php">Resolved
            <?php
                $query = "SELECT COUNT(*) AS count FROM ticket_t WHERE ticket_agent_id=$id AND ticket_status=7";

                $result = mysqli_query($db,$query); ?>
                  <?php while($row = mysqli_fetch_assoc($result)){ ?>
                    <span class="badge ticket_count"> <?php echo $row['count'] ?></span>
            <?php } ?>
          </a></li>
          <li class="collapsible"><a href="review-closed-tickets.php">Closed
            <?php
                $query = "SELECT COUNT(*) AS count FROM ticket_t WHERE ticket_agent_id=$id AND ticket_status=8";
                $result = mysqli_query($db,$query); ?>
                  <?php while($row = mysqli_fetch_assoc($result)){ ?>
                    <span class="badge ticket_count"> <?php echo $row['count'] ?></span>
            <?php } ?>
          </a></li>
        </ul>
      </div>
    </li>
  </ul>
      <?php } elseif($_SESSION['user_type'] == 'Network Engineer'){ ?>
<ul class="collapsible collapsible-accordion">
<li><a class="collapsible-header tooltipped" data-position="right" data-delay="50" data-tooltip="Tickets of my team"  href="#!"><i class="tiny material-icons">phonelink_setup</i> Assigned Tickets</a>
  <div class="collapsible-body">
    <ul>
      <li class="collapsible"><a href="review-incoming-tickets.php">Incoming
        <?php
            $id = $_SESSION['user_id'];
            $query = "SELECT COUNT(*) AS count FROM ticket_t WHERE ticket_agent_id=$id AND ticket_status=5";
            $result = mysqli_query($db,$query); ?>
              <?php while($row = mysqli_fetch_assoc($result)){ ?>
                <span class="badge ticket_count"> <?php echo $row['count'] ?></span>
        <?php } ?>
      </a></li>
      <li class="collapsible"><a href="review-tickets.php">All
        <?php
            $id = $_SESSION['user_id'];
            $query = "SELECT COUNT(*) AS count FROM ticket_t WHERE ticket_agent_id=$id";

            $result = mysqli_query($db,$query); ?>
              <?php while($row = mysqli_fetch_assoc($result)){ ?>
                <span class="badge ticket_count"> <?php echo $row['count'] ?></span>
        <?php } ?>
      </a></li>
      <li class="collapsible"><a href="review-inprogress-tickets.php">In Progress
        <?php
            $query = "SELECT COUNT(*) AS count FROM ticket_t WHERE ticket_agent_id=$id AND ticket_status=6";

            $result = mysqli_query($db,$query); ?>
              <?php while($row = mysqli_fetch_assoc($result)){ ?>
                <span class="badge ticket_count"> <?php echo $row['count'] ?></span>
        <?php } ?>
      </a></li>
      <li class="collapsible"><a href="review-resolved-tickets.php">Resolved
        <?php
            $query = "SELECT COUNT(*) AS count FROM ticket_t WHERE ticket_agent_id=$id AND ticket_status=7";

            $result = mysqli_query($db,$query); ?>
              <?php while($row = mysqli_fetch_assoc($result)){ ?>
                <span class="badge ticket_count"> <?php echo $row['count'] ?></span>
        <?php } ?>
      </a></li>
      <li class="collapsible"><a href="review-closed-tickets.php">Closed
        <?php
            $query = "SELECT COUNT(*) AS count FROM ticket_t WHERE ticket_agent_id=$id AND ticket_status=8";
            $result = mysqli_query($db,$query); ?>
              <?php while($row = mysqli_fetch_assoc($result)){ ?>
                <span class="badge ticket_count"> <?php echo $row['count'] ?></span>
        <?php } ?>
      </a></li>
    </ul>
  </div>
</li>
</ul>
<?php }; ?>

  </ul>
  <!-- Hamburger menu icon when screen resized -->
  <a href="#" data-activates="slide-out" class="button-collapse"><i class="material-icons">menu</i></a>
</div>
<?php }; ?>
