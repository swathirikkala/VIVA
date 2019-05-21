<html>
<head>
<script type="text/javascript">
	function openModal(){
		console.log("new User Story Open modal got called");
		$("#addUsDiv").load("newUS.jsp");
		
	}
	</script>
</head>
<body>
		<h1 class="w3-xxxlarge w3-text-red"><b>User Stories</b></h1>
	<p>
		<button onclick="openModal();" style="width: auto;">Create New User Story</button>
	</p>
	<div id="addUsDiv"></div>
	<div id="usTable"></div>
	<script type="text/javascript">
	$(document).ready(function() {
		$("#usTable").load("./usResultList.jsp");
  	});
</script>
</html>