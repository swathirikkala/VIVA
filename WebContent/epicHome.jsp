<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String userName = String.valueOf(request.getSession().getAttribute("userName"));
if(userName == null){
	userName = "";
}

//request.getSession().removeAttribute("epics");
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

<!-- Epic Creation Div -->
	<jsp:include page="./newEpic.jsp" /> 
<!-- Epic Creation Div ended -->

<div id="epicSearchDiv">
	<jsp:include page="epicSearch.jsp" />
</div>
<div id="epicEditDiv" style="margin-top: 0px;">
	<jsp:include page="editEpic.jsp" />
</div>
<div id="epicUSsDiv" style="margin-top: 50px;">
	<jsp:include page="usResult.jsp" /> 
</div>