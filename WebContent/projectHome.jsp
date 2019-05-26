
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
		
		<!-- Projects Table -->
			<div class="projectsDiv">
				<%@include file="projectsResultList.jsp" %>
			</div>
		<!-- Projects Table ended -->
		
	</body>
	
	<script type="text/javascript">
	$(document).ready(function() {
    	setTimeout(function(){
        	console.log("Loding projects");
    		
    		}, 2000);
  	});
	</script>
</html>