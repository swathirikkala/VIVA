<html>
<head>
<script type="text/javascript">
	function openModal(){
		console.log("newEpic Open modal got called");
		$("#addEpicDiv").load("newEpic.jsp");
	}
	</script>
</head>
<body>
		<h1 class="w3-xxxlarge w3-text-red"><b>Epics</b></h1>
		<hr>
	<p>
		<button onclick="openModal();" style="width: auto;">Create New Epic</button>
	</p>
	<div id="addEpicDiv"></div>
	<div id="epicsTable"></div>
	<script type="text/javascript">
	$(document).ready(function() {
		$("#epicsTable").load("epicsResultList.jsp");
  	});
</script>
</html>