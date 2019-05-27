<%@page import="com.viva.dto.Epic"%>
<%@page import="com.viva.dao.EpicDao"%>
<%@page import="com.viva.dao.SprintDao"%>
<%@page import="com.viva.dto.Sprint"%>
<%@page import="com.viva.dto.Project"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@page import="java.util.ArrayList"%>
<%@page import="com.viva.dto.User"%>
<%@page import="java.util.List"%>
<%@page import="com.viva.dao.Response"%>

<%@page import="com.viva.dao.SprintDao"%>
<%@page import="com.viva.dao.ProjectDao"%>
<%@page import="com.viva.dao.UserDao"%>

<%
	List<Epic> epics = (List<Epic>)request.getSession().getAttribute("epics");
	if(epics == null){
		epics =new ArrayList<Epic>();
	}

%>
<%
	Response resp = (Response)request.getSession().getAttribute("response");
	String message = resp.getResponseMessage();
	String userId = String.valueOf(request.getSession().getAttribute("userId"));
	String userName = String.valueOf(request.getSession().getAttribute("userName"));
	String projectId = String.valueOf(request.getSession().getAttribute("projectId"));
	
	
	UserDao userDao = new UserDao();
	ProjectDao projectDao = new ProjectDao();
	SprintDao sprintDao = new SprintDao();
	
// 	List<User> managers = userDao.getManagers();
// 	if(managers == null){
// 		managers = new ArrayList<User>();
// 	}
	
	
	List<Project> lastUpdatedProjectsList = projectDao.lastUpdatedProjectsListByManagerId(userId);
	if(null == lastUpdatedProjectsList){
		lastUpdatedProjectsList = new ArrayList<>();
	}
	
	List<Project> projectsByManagerId = projectDao.getProjectsByAssignedManager(userId);
	if(null == projectsByManagerId){
		projectsByManagerId = new ArrayList<Project>();
	}
	
	List<Sprint> sprintsByProjectId = sprintDao.getSpintsByProject(projectId);
	if(null == sprintsByProjectId){
		sprintsByProjectId = new ArrayList<Sprint>();
	}
	
// 	List<User> listOfUsers =  new UserDao().getAllUsers();
// 	if(null == listOfUsers){
// 		listOfUsers = new ArrayList<User>();
// 	}
%>

<html>
	<head>
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
		<script type="text/javascript">
		function displayPopup(){
			  document.getElementById('epicModalDiv').style.display='block';
			}
		function closePopup(){
			  document.getElementById('epicModalDiv').style.display='none';
			}
			function openEpicModal() {
				console.log("openEpicModal got called");
				displayPopup();
			}

		</script>
	</head>
	<body>
		<p>
			<button onclick="openEpicModal()" style="width: auto;">Create New Epic</button>
		</p>
		<!-- Epics Table -->
			<div class="limiter">
				<div class="table100 ver2 m-b-110" style="overflow:scroll; max-height:500px; min-height:0px; overflow-x: none;">
					<table data-vertable="ver2">
						<thead>
							<tr class="row100 head">
								<th class="column100 width50" data-column="column1">Epic ID</th>
								<th class="column100 width100" data-column="column2">Epic Name</th>
								<th class="column100 width50" data-column="column6">Status</th>	
								<th class="column100 width100" data-column="column7">VIVA %</th>	
								<th class="column100 width75" data-column="column1">BV Count</th>
							</tr>
						</thead>
						<tbody id="projectsBody">
							<%for(Epic epic: epics) {%>
								<tr class="row100 head">
									<td class="column100 width50" data-column="column1">
										<a href="javascript:void(0)" onclick="loadEpic('<%=epic.getId()%>')">EP<%= epic.getId()%></a>
									</td>
									<td class="column100 width100" data-column="column2"><%=epic.getName() %></td>
									<td class="column100 width50" data-column="column6"><%= epic.getStatus()%></td>
									<td class="column100 width50" data-column="column6"><%= 0%></td>
									<td class="column100 width50" data-column="column1"><%= 0%></td>
								</tr>
							<%} %>
						</tbody>
					</table>
				</div>
			</div>
		<!-- Epics Table ended -->
		<!-- Epic creation -->
		<div id="epicModalDiv" class="modal">
		  <span onclick="javascript:closePopup()" class="close" title="Close Sprint">&times;</span>
			<form class="modal-content" method="post" action="./addEpic">
		    <div class="container">
		    <input type="hidden" id="createdBy" name="createdBy" value="<%=userId%>">
		      <h1 style="color:green">Add Epic</h1>
		      <p style="color:red">Please fill in the form to add the Epic</p>
		      <hr>
		      
			   <label for="projectName"><b>Project Name</b></label>
			   <select id="projectName" name = "projectName" >
		       <option value="" selected="selected">--Select Project--</option>
		      <%for(Project p : projectsByManagerId){%>
		      		<option value="<%= p.getId()%>"><%= p.getName()%></option>
		      <%}%>
		      </select>
		      		   
		      <label for="sprintName"><b>Sprint Name</b></label>
		       <select id="sprintName" name = "sprintName" >
		       <option value="" selected="selected">--Select Sprint--</option>
		      <%for(Sprint s : sprintsByProjectId){%>
		      		<option value="<%= s.getSprintId()%>"><%= s.getSprintName()%></option>
		      <%}%>
		      </select>
		      
		      <label for="epicName"><b>Epic Name</b></label><label style="color: red;">&nbsp;*</label>
		      <input type="text" name="epicName" id="epicName" required="required" placeholder="Epic Name">
		      		      
			   <label for="severity"><b>Epic Severity</b></label><label style="color: red;">&nbsp;*</label>
			     <select id="severity" name = "severity" required>
		      		<option value="1">High</option>
			      	<option value="2">Medium</option>
			      	<option value="3">Low</option>
			      	<option value="4">No Severity</option>
		     	 </select>
		     	 
			   <label for="startDate"><b>Epic Start Date</b></label><label style="color: red;">&nbsp;*</label>
			   <input type="date" placeholder="Sprint Start Date" name="startDate" id="startDate" required>
			   
			   <label for="endDate"><b>Epic End Date</b></label><label style="color: red;">&nbsp;*</label>
			   <input type="date" placeholder="Sprint End Date" name="endDate" id="endDate" required>
			   
			   <input type="hidden" placeholder="Created By" name="createdBy" id="createdBy" required value="<%= userId %>">
			   
			   <label for="businessValues"><b>Business Values</b></label><label style="color: red;">&nbsp;*</label>
		       <select id="businessValues" name = "businessValues" required>
		      <%for(Sprint s : sprintsByProjectId){%>
		      		<option value="<%= s.getSprintId()%>"><%= s.getSprintName()%></option>
		      <%}%>
		      </select>
			   
		      <label for="assignTo"><b>Assign to</b></label><label style="color: red;">&nbsp;*</label>
		      <select id="assignTo" name = "assignTo" required>
<%-- 		      <%for(User user : listOfUsers){%> --%>
<%-- 		      		<option value="<%= userId%>"><%= userName%></option> --%>
<%-- 		      <%}%> --%>
		      </select>
		      <label for="projectManager"><b>Project Manager</b></label><label style="color: red;">&nbsp;*</label>
		      <select id="projectManager" name = "projectManager" required>
<%-- 			      <%for(User u : managers){%> --%>
<%-- 			      		<option value="<%= u.getEmailId()%>"><%= u.getFirstName() + " " + u.getLastName()%></option> --%>
<%-- 			      <%}%> --%>
		      </select>
		      <label for="description"><b>Epic Description</b></label><label style="color: red;">&nbsp;*</label>
		      <textarea rows="4" cols="50" placeholder="Description" name="description" id="description" style="height: 100px;">
		      </textarea>
		      
		      <div class="clearfix">
		        <button type="button" onclick="javascript:closePopup()" class="cancelbtn">Cancel</button>
		        <button type="submit" class="signupbtn" id="saveDepartmentDiv">Save</button>
		      </div>
		    </div>
		  </form>
		</div>
		<!-- Epic creation completed -->
	</body>