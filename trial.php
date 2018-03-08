
<html>
  <head>
    <link rel="shortcut icon" type="image/x-icon" href="img/eei-black.png" />
    <title>EEI Service Desk</title>
    <?php include 'templates/css_resources.php' ?>
  </head>
	<body>
	    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>

			<select name="status" id="status">
					<option value="">-- Select --</option>
			</select>

	    <p id="msg"></p>
	</body>

	<script>
	    $(document).ready(function () {
	        // EXTRACT JSON DATA.
	        $.getJSON("results.JSON", function (data) {

	            $.each(data, function (index, value) {
	                // APPEND OR INSERT DATA TO SELECT ELEMENT.

									$('.status').append('<option value="' + value.type + '">' + value.type + '</option>');
	            });
	        });

	        // SELECT change EVENT TO READ SELECTED VALUE FROM DROPDOWN LIST.

	    });
	</script>

</html>
