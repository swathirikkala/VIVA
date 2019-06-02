<!DOCTYPE html>
<%@page import="javax.jws.soap.SOAPBinding.Use"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.viva.dto.User"%>
<%@page import="java.util.List"%>
<html lang="en">
<title>Admin Panel</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
<link rel="stylesheet" href="./css/w3.css">
<link rel="stylesheet" href="./css/modal.css">
<script src="./js/jquery-3.4.0.min.js"></script>
<script src="./js/modal.js"></script>
<script src="./js/project.js"></script>
<script src="./js/sprint.js"></script>
<script src="./js/adminPanel.js"></script>
<%
	List<User> managers = (List<User>)request.getSession().getAttribute("managers");
	if(managers == null)
		managers = new ArrayList();
	String userId = String.valueOf(request.getSession().getAttribute("userId"));
	String userName = String.valueOf(request.getSession().getAttribute("userName"));
%>
<!-- Table css -->

<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/modal.css">

<!-- Table css end -->
<!-- Table JS -->
<!--===============================================================================================-->	
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>
<!-- Table JS end -->

<style>
body,h1,h2,h3,h4,h5 {font-family: "Poppins", sans-serif}
body {font-size:16px;}
.w3-half img{margin-bottom:-6px;margin-top:16px;opacity:0.8;cursor:pointer}
.w3-half img:hover{opacity:1}
</style>
<body>

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-red w3-collapse w3-top w3-large w3-padding" style="z-index:3;width:250px;font-weight:bold;" id="mySidebar"><br>
  <a href="javascript:void(0)" onclick="w3_close()" class="w3-button w3-hide-large w3-display-topleft" style="width:100%;font-size:22px">Close Menu</a>
  <div class="w3-container">
    <h3 class="w3-padding-64"><b>VIVA<br>Application</b></h3>
  </div>
  <div class="w3-bar-block">
    <a href="javascript:void(0);" onclick="loadFunctionalityDiv('adminPanelHome')" class="w3-bar-item w3-button w3-hover-white">Home</a>
    <a href="javascript:void(0);" onclick="loadFunctionalityDiv('stakeHoldersHome')" class="w3-bar-item w3-button w3-hover-white">Stake Holders</a>
    <a href="javascript:void(0);" onclick="loadFunctionalityDiv('projectManagersHome')" class="w3-bar-item w3-button w3-hover-white">Project Managers</a>
    <a href="javascript:void(0);" onclick="loadFunctionalityDiv('technicalTeamHome')" class="w3-bar-item w3-button w3-hover-white">Technical Team</a>
    <a href="javascript:void(0);" onclick="loadFunctionalityDiv('projectsHome')" class="w3-bar-item w3-button w3-hover-white">Projects</a>
    <a href="javascript:void(0);" onclick="loadFunctionalityDiv('sprintsHome')" class="w3-bar-item w3-button w3-hover-white">Sprints</a>
    <a href="javascript:void(0);" onclick="loadFunctionalityDiv('epicsHome')" class="w3-bar-item w3-button w3-hover-white">Epics</a>
    <a href="javascript:void(0);" onclick="loadFunctionalityDiv('userStoriesHome')" class="w3-bar-item w3-button w3-hover-white">User Stories</a>
    <a href="javascript:void(0);" onclick="loadFunctionalityDiv('dashBoardHome')" class="w3-bar-item w3-button w3-hover-white">Dash Board</a>
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

  <!-- Stake Holders -->
  <div class="w3-container" id="adminPanelHome" style="margin-top:75px;display: none;">
    <h1 class="w3-xxxlarge w3-text-red"><b>Admin</b></h1>
    
    <p>
    	<button onclick="javascript:loadMenu('addDepartMentDiv','addDepartmentFormDiv')" style="width:auto;">Add Department</button>
    	<button onclick="javascript:loadMenu('addProjectDiv','addProjectFormDiv')" style="width:auto;">Add Project</button>
    </p>
		<div id="addDepartMentDiv" style="display: none;">
		<div id="addDepartmentFormDiv" class="modal">
		  <span onclick="closePopup('addDepartmentFormDiv')" class="close" title="Close Modal">&times;</span>
			<form class="modal-content" method="post" action="./addDepartment">
		    <div class="container">
		      <h1>Add Department</h1>
		      <p>Please fill in the form to create the department</p>
		      <hr>
			   <label for="departmentName"><b>Department Name</b></label><label style="color: red;">&nbsp;*</label>
			   <input type="text" placeholder="Department Name" name="departmentName" id="departmentName" required>
		      <label for="departmentDescription"><b>Department Description</b></label><label style="color: red;">&nbsp;*</label>
		      <input type="text" placeholder="Department Description" name="departmentDescription" id="departmentDescription" required>
		      
		      <div class="clearfix">
		        <button type="button" onclick="closePopup('addDepartmentFormDiv')" class="cancelbtn">Cancel</button>
		        <button type="submit" class="signupbtn" id="saveDepartmentDiv">Save</button>
		      </div>
		    </div>
		  </form>
		</div>
		</div>
		
		
		<div id="addProjectDiv" style="display: none;">
		<div id="addProjectFormDiv" class="modal">
		  <span onclick="closePopup('addProjectFormDiv')" class="close" title="Close Modal">&times;</span>
			<form class="modal-content" method="post" action="./addProject">
		    <div class="container">
		      <h1>Add Project</h1>
		      <p>Please fill in the form to add the Project</p>
		      <hr>
			   <label for="projectName"><b>Project Name</b></label><label style="color: red;">&nbsp;*</label>
			   <input type="text" placeholder="Project Name" name="projectName" id="projectName" required>
		      
		      
			   <label for="projectSeverity"><b>Project Severity</b></label><label style="color: red;">&nbsp;*</label>
			     <select id="projectSeverity" name = "projectSeverity" required>
		      		<option value="1">High</option>
			      	<option value="2">Medium</option>
			      	<option value="3">Low</option>
			      	<option value="4">No Severity</option>
		     	 </select>
			   <label for="projectStartDate"><b>Project Start Date</b></label><label style="color: red;">&nbsp;*</label>
			   <input type="date" placeholder="Project Start Date" name="projectStartDate" id="projectStartDate" required>
			   
			   <label for="projectEndDate"><b>Project End Date</b></label><label style="color: red;">&nbsp;*</label>
			   <input type="date" placeholder="Project End Date" name="projectEndDate" id="projectEndDate" required>
			   
			   
			   <label for="createdBy"><b>Created By</b></label><label style="color: red;">&nbsp;*</label>
			   <input type="hidden" placeholder="Created By" name="createdBy" id="createdBy" required value="<%= userId %>>">
			   <input type="text" placeholder="Created By" name="createdByName" id="createdByName" required value="<%= userName %>" disabled="disabled">
			   
		      <label for="departmentDescription"><b>Project Manager</b></label><label style="color: red;">&nbsp;*</label>
		      <select id="projectManager" name = "projectManager" required>
		      <%
		      	for(User user : managers){
		      %>
		      			<option value="<%= userId%>"><%= userName%></option>
		      	<%
		      	}
		      	%>
		      </select>
		      
		      <label for="projectDescription"><b>Project Description</b></label><label style="color: red;">&nbsp;*</label>
		      <textarea rows="4" cols="50" placeholder="Project Description" name="projectDescription" id="projectDescription" style="height: 100px;">
		      </textarea>
		      
		      <div class="clearfix">
		        <button type="button" onclick="closePopup('addProjectFormDiv')" class="cancelbtn">Cancel</button>
		        <button type="submit" class="signupbtn" id="saveDepartmentDiv">Save</button>
		      </div>
		    </div>
		  </form>
		</div>
		</div>
		
		
		
  </div>

  <!-- Stake Holders -->
  <div class="w3-container" id="stakeHoldersHome" style="margin-top:75px;display: none;">
    <h1 class="w3-xxxlarge w3-text-red"><b>Stake Holders</b></h1>
    
    <p><button onclick="javascript:openModal('addStakeHolder')" style="width:auto;">Add Stake Holder</button></p>
		<div id="stakeHoldersDiv">
		</div>
  </div>

  <!-- Project Managers  -->
  <div class="w3-container" id="projectManagersHome" style="margin-top:75px;display: none;">
    <h1 class="w3-xxxlarge w3-text-red"><b>Project Managers.</b></h1>
    
    <p><button onclick="javascript:openModal('addProjectManager')" style="width:auto;">Add Project Manager</button></p>
		<div id="projectManagersDiv">
		</div>
  </div>
  <!-- Technical Team -->
  <div class="w3-container" id="technicalTeamHome" style="margin-top:75px;display: none;">
    <h1 class="w3-xxxlarge w3-text-red"><b>Technical Team</b></h1>
    
    <p><button onclick="javascript:openModal('addTechnicalTeamMember')" style="width:auto;">Add Technical Member</button></p>
		<div id="technicalTeamDiv">
		</div>
  </div>
  <!-- Projects  -->
  <div class="w3-container" id="projectsHome" style="margin-top:75px;display: none;">
    <h1 class="w3-xxxlarge w3-text-red"><b>Projects.</b></h1>
	<div id="projectsDiv">
	</div>
  </div>
  <!-- Sprints  -->
  <div class="w3-container" id="sprintsHome" style="margin-top:75px;display: none;">
    <h1 class="w3-xxxlarge w3-text-red"><b>Sprints.</b></h1>
    
		<div id="sprintsDiv">
		</div>
  </div>
  <!-- Epics -->
  <div class="w3-container" id="epicsHome" style="margin-top:75px;display: none;">
    <h1 class="w3-xxxlarge w3-text-red"><b>Epics</b></h1>
    
    <p><button onclick="javascript:openModal('addEpic')" style="width:auto;">Add Epic</button></p>
		<div id="epicsDiv">
		</div>
  </div>
  <!-- Epics -->
  <div class="w3-container" id="userStoriesHome" style="margin-top:75px;display: none;">
    <h1 class="w3-xxxlarge w3-text-red"><b>User Stories</b></h1>
    
    <p><button onclick="javascript:openModal('addUserStory')" style="width:auto;">Add User Story</button></p>
		<div id="userStoriesDiv">
		</div>
  </div>
  <!-- Dash Board -->
  <div class="w3-container" id="dashBoard" style="margin-top:75px;display: none;">
    <h1 class="w3-xxxlarge w3-text-red"><b>Dash Board</b></h1>
    
    <p>Description</p>
		<div id="dashBoardDiv">
		</div>
  </div>

<!-- End page content -->
</div>
      <script>
        $(document).ready(function() {
        });
      </script>
</body>
</html>
