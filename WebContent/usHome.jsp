<html>
<head>
<script type="text/javascript">
	function openModal(){
		console.log("newEpic Open modal got called");
		$("#addUSDiv").load("newUS.jsp");
	}
	</script>
</head>
<body>
		<h1 class="w3-xxxlarge w3-text-red"><b>User Stories</b></h1>
		<hr>
	<p>
		<button onclick="openModal();" style="width: auto;">Create New User Story</button>
	</p>
	<div id="addUSDiv"></div>
	<div id="ussTable"></div>
	<script type="text/javascript">
	$(document).ready(function() {
		$("#ussTable").load("usResultList.jsp");
  	});
</script>
</html>