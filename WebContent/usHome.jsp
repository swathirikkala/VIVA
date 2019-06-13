<%
	String userName = String.valueOf(request.getSession().getAttribute("userName"));
	if(userName == null){
		userName = "";
	}
%>
<html>
<head>
<style type="text/css">
	.cellClass{
			width: 200px;
			padding-right: 10px;
		}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		var uname = '<%=userName%>';
		console.log("user name : " + uname);
		if("null" === uname ){
			alert("Session expired please login again.");
			window.location="./index.jsp";
		}
	});
</script>
</head>
<body>

	<!-- User Story Creation Div started-->
	<jsp:include page="./newUS.jsp"/>
	<!-- User Story Creation Div ended -->
		
	<div id="userStorySearchDiv">
		<jsp:include page="usSearch.jsp" /> 
	</div>
	<div id="userStoryEditDiv">
		<jsp:include page="usEdit.jsp" /> 
	</div>
	<div id="userStoryBusinessValuesDiv" style="margin-top: 50px;">
		<jsp:include page="usBVlist.jsp" /> 
	</div>
	<script type="text/javascript">
	$(document).ready(function() {
		
  	});
</script>
</html>