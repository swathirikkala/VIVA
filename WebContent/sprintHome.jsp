<html>
<head>
<script type="text/javascript">
	function openModal(){
		console.log("newSprint Open modal got called");
		$("#addSprintDiv").load("newSprint.jsp");
	}
	</script>
</head>
<body>
		<h1 class="w3-xxxlarge w3-text-red"><b>Sprints</b></h1>
	<p>
		<button onclick="openModal();" style="width: auto;">Create New Sprint</button>
	</p>
	<div id="addSprintDiv"></div>
	<div id="sprintsTable"></div>
	<script type="text/javascript">
	$(document).ready(function() {
		$("#sprintsTable").load("sprintsResultList.jsp");
  	});
</script>
</html>