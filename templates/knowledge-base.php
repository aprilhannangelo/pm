<div class="col s12 m12 l12 table-header">
  <div class="row">
    <span class="table-title">Knowledge Base</span>
  </div>
</div>

<div id="knowledge-base">
  <h4>Hi <b><?php echo $_SESSION['first_name'] ?></b>, how can we help you today?</h4>
  <div class="input-field">
          <input placeholder="Search Here" id="search" class="faq" type="search" required>
          <i id="search"class="material-icons">search</i>

          <label class="label-icon" for="search"></label>

        </div>
  <br>
    <div class="row">
        <div class="col s12 m4 l4">
          <div class="card">
            <div class="card-image">
              <i class="large material-icons">storage</i>
            </div>
            <div class="card-content">
              <span class="card-title">Technicals</span>

              <p id="kb">Hardware, Mouse, Keyboard, Monitor, Printers, Scanners, Tablets, etc.</p>
            </div>
            <div class="card-action">
              <a href="technicals-faq.php">View Technicals FAQs</a>
            </div>
          </div>
        </div>
        <div class="col s12 m4 l4">
          <div class="card">
            <div class="card-image">
              <i class="large material-icons">vpn_lock</i>
            </div>
            <div class="card-content">
              <span class="card-title">Access</span>

              <p id="kb">Hardware access, application access, password change</p>
            </div>
            <div class="card-action">
              <a href="access-faq.php">View Access FAQs</a>
            </div>
          </div>
        </div>
        <div class="col s12 m4 l4">
          <div class="card">
            <div class="card-image">
              <i class="large material-icons">network_check</i>
            </div>
            <div class="card-content">
              <span class="card-title">Network</span>
              <p id="kb">Network/Internet Access, Network Equipment - routers, cables etc.</p>

            </div>
            <div class="card-action">
              <a href="network-faq.php">View Network FAQs</a>
            </div>
          </div>
        </div>
      </div>
  </div>
</div>
