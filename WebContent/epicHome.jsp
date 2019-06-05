<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
<style type="text/css">
	.cellClass{
			width: 200px;
			padding-right: 10px;
		}
</style>	
</head>
<div id="epicSearchDiv">
	<jsp:include page="epicSearch.jsp" />
</div>
<div id="epicEditDiv" style="margin-top: 0px;">
	<jsp:include page="editEpic.jsp" />
</div>
<div id="epicUSsDiv" style="margin-top: 50px;">
	<jsp:include page="usResult.jsp" /> 
</div>