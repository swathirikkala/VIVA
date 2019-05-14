
<html>
	<head>
		<style type="text/css">
			.width50{
				width: 50px;
			}
			.width75{
				width: 75px;
			}
			.width100{
				width: 100px;
			}
		</style>
		<script type="text/javascript">
	function openModal(){
		console.log("Open modal got called");
		$("#projectsDiv").load("projectsResultList.jsp");
		$("#addPrjDiv").load("newProject.jsp");
	}
	</script>
	</head>
	<body>
	    	<button onclick="openModal();" style="width:auto;">Create New Project</button>
		
		<!-- Project Creation Div -->
		<div id="addPrjDiv">
		  
		</div>
		<!-- Project Creation Div ended -->
		
		<!-- Projects Table -->
			<div class="projectsDiv">
				<%@include file="projectsResultList.jsp" %>
			</div>
		<!-- Projects Table ended -->
		
	</body>
	
	<script type="text/javascript">
	$(document).ready(function() {
// 		$("#projectsDiv").load("sprintsResultList.jsp");
// 		$("#projectsDiv").load("projectsResultList.jsp");
    	setTimeout(function(){
        	console.log("Loding projects");
    		
    		}, 2000);
  	});
	</script>
</html>