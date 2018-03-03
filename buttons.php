<!-- Action Buttons -->
<div class="row detail-actions">
  <div class="row" id="activity-log">
    <button class="btn-activitylog">Add activity log</button>
  </div>

  <input id="attach" type="submit" class="modal-trigger" href="#attachfile" value="Attach File" />



  <!-- Cancel Button for Admin -->
     <form id="cancel" name="cancel" method="post">
       <input id="cancel" type="submit" value="Cancel">
       <input  id="cancel" name = "ticketID" type="hidden" value="">
     </form>

   <input id="reassign-button" type="submit" value="Re-assign this ticket"><br><br>


  <!-- Approve and Reject Button  -->

  <html>


  <head>
    <?php include 'templates/css_resources.php' ?>
    <head> <div class="approve-reject">
         <form id="confirm" name="confirm" method="post">
           <input id="confirm" type="submit"  value="Confirm">
           <input  id="confirm" name = "ticketID" type="hidden">
         </form>
         <form id="approve" name="approve" method="post">
           <input id="approve" type="submit" onclick="php_processes/approve-process.php'" value="Approve">
           <input  id="approve" name = "ticketID" type="hidden">
         </form>

         <form id="reject" name="reject" method="post">
           <input id="reject" type="submit" onclick="php_processes/reject-process.php'" value="Reject">
           <input  id="reject" name = "ticketID" type="hidden">
         </form>

    <!-- // Check and Reject Button -->
        <form id="check" name="check" method="post">
          <input id="check" type="submit" onclick="php_processes/check-process.php'" value="Check" />
          <input id="check" name = "ticketID" type="hidden">
        </form>

        <form id="reject" name="reject" method="post">
          <input id="reject" type="submit" onclick="php_processes/reject-process.php'" value="Reject">
          <input  id="reject" name = "ticketID" type="hidden">
        </form>
