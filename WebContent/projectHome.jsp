
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

	</head>
	<body>
	
		
		<!-- Projects Creation -->
			<div class="projectsDiv">
				<jsp:include page="newProject.jsp" /> 
			</div>
		<!-- Projects Creation ended -->
		<!-- Projects Search -->
			<div class="projectsDiv">
				<jsp:include page="projectSearch.jsp" /> 
			</div>
		<!-- Projects Search ended -->
		
		<!-- Projects Table -->
			<div class="projectsDiv">
				<jsp:include page="projectsResultList.jsp" /> 
			</div>
		<!-- Projects Table ended -->
		
	</body>
	
	<script type="text/javascript">
// 	$(document).ready(function() {
//     	setTimeout(function(){
//         	console.log("Loding projects");
//     		}, 2000);
//   	});
	</script>
</html>