<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
		String userName = String.valueOf(request.getSession().getAttribute("userName"));
    %>
<!DOCTYPE html>

<html lang="en">
<title></title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
	body,h1,h2,h3,h4,h5 {font-family: "Poppins", sans-serif}
	body {font-size:16px;}
	.w3-half img{margin-bottom:-6px;margin-top:16px;opacity:0.8;cursor:pointer}
	.w3-half img:hover{opacity:1}
</style>
<link rel="stylesheet" href="./css/w3.css">
<link rel="stylesheet" href="./css/w3.css">
<link rel="stylesheet" href="./css/modal.css">
<link href="./css/fSelect.css" rel="stylesheet">
<script src="./js/jquery-3.4.0.min.js"></script>
<script src="./js/fSelect.js"></script>


<body>

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-red w3-collapse w3-top w3-large w3-padding" style="z-index:3;width:250px;font-weight:bold;" id="mySidebar"><br>
  <a href="javascript:void(0)" onclick="w3_close()" class="w3-button w3-hide-large w3-display-topleft" style="width:100%;font-size:22px">Close Menu</a>
  <div class="w3-container">
    <h3 class="w3-padding-64"><b>VIVA<br>Application</b></h3>
  </div>
  <div class="w3-bar-block">
    <a href="#" onclick="loadPage('commonDiv','projectHome.jsp');" class="w3-bar-item w3-button w3-hover-white">Home</a>
    <a href="#" onclick="loadPage('commonDiv','sprintHome.jsp');" class="w3-bar-item w3-button w3-hover-white">Sprints</a>
    <a href="#" onclick="loadPage('commonDiv','./epicHome.jsp');" class="w3-bar-item w3-button w3-hover-white">Epics</a>
    <a href="#" onclick="loadPage('commonDiv','./usHome.jsp');" class="w3-bar-item w3-button w3-hover-white">User Stories</a>
    <a href="#" onclick="loadPage('commonDiv','./dashBoard.jsp');" class="w3-bar-item w3-button w3-hover-white">Dash Board</a>
    <a href="#" onclick="loadPage('commonDiv','./newBV.jsp');" class="w3-bar-item w3-button w3-hover-white">Business Values</a>
    
    <a href="./index.jsp" class="w3-bar-item w3-button w3-hover-white">Logout</a>
  </div>
</nav>

<!-- Top menu on small screens -->
<header class="w3-container w3-top w3-hide-large w3-red w3-xlarge w3-padding">
  <a href="javascript:void(0)" class="w3-button w3-red w3-margin-right" onclick="w3_open()">☰</a>
  <span>VIVA</span>
</header>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:340px;margin-right:40px">
<!-- 	<div class="w3-container" style="margin-top:50px;text-align: right;"> -->
<%--     	<h1 class="w3-xxxlarge" style="color: blue;"><b>Welcome <%= userName%></b></h1> --%>
<!-- 	</div> -->
	<!-- Search form -->
<!-- 	<div class="w3-container" id="projectSearchDiv" style="margin-top:5px"> -->
<!-- 		<h1 class="w3-xxxlarge" style="color: green;"><b>Projects</b></h1> -->
<!-- 	</div> -->
	<!-- Search form end-->
  <!-- Projects -->
<!-- 	<div class="w3-container" id="homeDiv" style="margin-top:5px"> -->
		
<!-- 	</div> -->
	
	<!-- Project View -->
<!-- 	<div class="w3-container" id="projectDiv" style="margin-top:5px"> -->
		
<!-- 	</div> -->
	<!-- commonDiv Board -->
	<br>
	<div class="w3-container" id="commonDiv" style="margin-top:5px">
	</div>



<!-- End page content -->
</div>

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

<script>
// Script to open and close sidebar
function w3_open() {
  document.getElementById("mySidebar").style.display = "block";
  document.getElementById("myOverlay").style.display = "block";
}

function w3_close() {
  document.getElementById("mySidebar").style.display = "none";
  document.getElementById("myOverlay").style.display = "none";
}
function loadPage(diveName,pageName) {
	console.log("load page method called : " + diveName + " : " + pageName);
// 	$("#homeDiv").hide();
	$("#commonDiv").hide();
// 	$("#projectSearchDiv").hide();
	$("#"+diveName).empty();
	$("#"+diveName).show();
	$("#"+diveName).load(pageName);
// 	if(diveName === "homeDiv"){
// 		$("#projectSearchDiv").show();
// 		$("#projectSearchDiv").load("projectSearch.jsp");
// 	}
}

 $(document).ready(function() {
 	loadPage('commonDiv','projectHome.jsp');
 });
</script>

</body>
</html>
