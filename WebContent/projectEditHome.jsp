<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	
	<!-- Sprint Creation Div -->
		<jsp:include page="newSprint.jsp" /> 
	<!-- Sprint Creation Div ended -->
	
	<div id="projectEditDiv" style="margin-top: 0px;">
		<jsp:include page="projectEdit.jsp" />
	</div>
	<div id="projectSprintsResultsDiv" style="margin-top: 50px;">
		<jsp:include page="sprintsResultList.jsp" /> 
	</div>
</body>
</html>

<!--  projectEditHome.jsp -->