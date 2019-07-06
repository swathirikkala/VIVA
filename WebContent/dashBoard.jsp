<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userName = String.valueOf(request.getSession().getAttribute("userName"));
%>
<!DOCTYPE html>
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
		if(null == uname ){
			alert("Session expired please login again.");
			window.location="./index.jsp";
		}
	});
	
	function report1(){
		$("#searchCriteriaDiv").empty();
		$("#reportDisplayDiv").empty();
		$("#searchCriteriaDiv").load("bvStatusReportCriteria.jsp");
		$("#reportDisplayDiv").load("bvStatusReport.jsp");
	}
	
	function report2(){
		$("#searchCriteriaDiv").empty();
		$("#reportDisplayDiv").empty();
		$("#searchCriteriaDiv").load("businessValuesAverageReportCriteria.jsp");
		$("#reportDisplayDiv").load("businessValuesAverageReport.jsp");
	}
</script>
</head>
<body>
	<label class="w3-xxxlarge w3-text-red"><b>Dash Board</b></label>
	<label class="w3-xxxlarge" style="color: green;margin-left: 55%;">Welcome </label>
	<label class="w3-xxxlarge" style="color: blue;"><%=userName %></label>	
	<div style="display: inline-block;">
	<button type="button" onclick="report1()" class="signupbtn" 
		style="text-align: centre; width:150px; margin-top: 2px;">Business Values Status Report </button>
		
	<button type="button" onclick="report2()" class="signupbtn" 
		style="text-align: centre; width:150px; margin-top: 2px; margin-left: 15px;">Business Values Report </button>
	</div>
	
	<hr>
	<div>
		<div id="searchCriteriaDiv" style="display: inline-block;">
		</div>
		<div id="reportDisplayDiv" style="display: inline-block;">
		</div>
	</div>
</body>
</html>