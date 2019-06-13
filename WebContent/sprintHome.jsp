<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String userName = String.valueOf(request.getSession().getAttribute("userName"));
if(userName == null){
	userName = "";
}
%>
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

<!-- Sprint Creation Div -->
	<jsp:include page="./newSprint.jsp" /> 
<!-- Sprint Creation Div ended -->

<div id="sprintSearchDiv">
	<jsp:include page="./sprintSearch.jsp" />
</div>
<div id="sprintEditDiv" style="margin-top: 0px;">
	<jsp:include page="./sprintEdit.jsp" />
</div>
<div id="sprintUserStoriesDiv" style="margin-top: 50px;">
	<jsp:include page="./usResult.jsp" /> 
</div>