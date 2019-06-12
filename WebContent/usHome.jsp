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
		if("" === <%=userName%>){
			alert("Session expired please login again.");
			window.location="./index.jsp";
		}
	});
</script>
</head>
<body>
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