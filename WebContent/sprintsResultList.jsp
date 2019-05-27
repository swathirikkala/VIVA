<%@page import="com.viva.dao.util.LookUp"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.viva.dao.UserDao"%>
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

<%
	List<Sprint> sprints = (List<Sprint>)request.getSession().getAttribute("sprints");	
	if(sprints == null){
		sprints = new ArrayList<Sprint>();
	}
	UserDao userDao = new UserDao();
	Map<String, User> allUsers = userDao.getAllUsers();
	if(allUsers == null){
		allUsers = new HashMap<String,User>();
	}
	String userId = String.valueOf(request.getSession().getAttribute("userId"));
	String userName = String.valueOf(request.getSession().getAttribute("userName"));
	List<Project> allProjects = (List<Project>)request.getSession().getAttribute("allProjects");
	if(allProjects == null){
		allProjects = new ArrayList<Project>();
	}
	Project project = (Project)request.getSession().getAttribute("project");
	if(project == null){
		project = new Project();
	}
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
			function loadSprint() {
				console.log("loadSprint Loading");
			}
		</script>
		<script type="text/javascript">
			function openModal(){
				console.log("newSprint Open modal got called");
				displayPopup();
			}
		</script>
	</head>
	<body>
		<p>
			<button onclick="openModal()" style="width: auto;">Create New Sprint</button>
		</p>

		<!-- Projects Table -->
			<div class="limiter">
				<div class="table100 ver2 m-b-110" style="overflow:scroll; max-height:500px; min-height:0px; overflow-x: none;">
					<table data-vertable="ver2">
						<thead>
							<tr class="row100 head">
								<th class="column100 width50" data-column="column1">Sprint ID</th>
								<th class="column100 width100" data-column="column2">Sprint Name</th>
								<th class="column100 width75" data-column="column1">Start Date</th>
								<th class="column100 width75" data-column="column1">End Date</th>
								<th class="column100 width50" data-column="column6">Status</th>
								<th class="column100 width100" data-column="column7">VIVA %</th>
								<th class="column100 width100" data-column="column7">Created By</th>
							</tr>
						</thead>
						<tbody id="projectsBody">
							<% for(Sprint s : sprints){ %>
								<tr class="row100 head">
									<td class="column100 width50" data-column="column1">
									<a href="javascript:void(0)" onclick="loadSprint('<%=s.getSprintId()%>');">SP<%=s.getSprintId()%></a>
									</td>
									<td class="column100 width100" data-column="column2"><%=s.getSprintName() %></td>
									<td class="column100 width50" data-column="column1"><%=s.getStartDate() %></td>
									<td class="column100 width75" data-column="column1"><%=s.getEndDate() %></td>
									<td class="column100 width75" data-column="column1"><%=s.getSeverity() %></td>
									<td class="column100 width50" data-column="column6"><%=s.getViva() %></td>
									<td class="column100 width100" data-column="column7"><%=LookUp.getUserName(s.getCreatedBy(),allUsers)%></td>
								</tr>
							<%} %>
						</tbody>
					</table>
				</div>
			</div>
		<!-- Projects Table ended -->
		<div id="addSprintDiv">
		<!-- Project Creation Div -->
		<div id="modalDiv" class="modal">
		  <span onclick="javascript:closePopup()" class="close" title="Close Sprint">&times;</span>
			<form class="modal-content" method="post" action="./addSprint">
		    <div class="container">
		      <h1 style="color:green">Add Sprint</h1>
		      <p style="color:red">Please fill in the form to add the Sprint</p>
		      <hr>
		      
			   <label for="projectName"><b>Project Name</b></label><label style="color: red;">&nbsp;*</label>
			   <select id="projectName" name = "projectName" required>
		      <%for(Project p : allProjects){%>
		      		<option value="<%= p.getId()%>"><%= p.getName()%></option>
		      <%}%>
		      </select>
		      		   
		      <label for="sprintName"><b>Sprint Name</b></label><label style="color: red;">&nbsp;*</label>
		      <input type="text" id="sprintName" name = "sprintName" required placeholder="Sprint Name">
		      		      
			   <label for="projectSeverity"><b>Sprint Priority</b></label>
			   
			     <select id="sprintSeverity" name = "sprintSeverity">
		      		<option value="0">--Select--</option>
		      		<%for(String p:LookUp.getPriorities()){ %>
			      		<option value="<%=p%>"><%=p%></option>
			      	<%} %>
		     	 </select>
		     	 
			   <label for="sprintStartDate"><b>Sprint Start Date</b></label><label style="color: red;">&nbsp;*</label>
			   <input type="date" placeholder="Sprint Start Date" name="sprintStartDate" id="sprintStartDate" required>
			   
			   <label for="sprintEndDate"><b>Sprint End Date</b></label><label style="color: red;">&nbsp;*</label>
			   <input type="date" placeholder="Sprint End Date" name="sprintEndDate" id="sprintEndDate" required>
			   
			   <input type="hidden" placeholder="Created By" name="createdBy" id="createdBy" required value="<%= userId %>">
		      <label for="projectDescription"><b>Sprint Description</b></label><label style="color: red;">&nbsp;*</label>
		      <textarea rows="4" cols="50" placeholder="Sprint Description" name="sprintDescription" id="sprintDescription" style="height: 100px;">
		      </textarea>
		      
		      <div class="clearfix">
		        <button type="button" onclick="javascript:closePopup()" class="cancelbtn">Cancel</button>
		        <button type="submit" class="signupbtn" id="saveDepartmentDiv">Save</button>
		      </div>
		    </div>
		  </form>
		</div>
		<!-- Project Creation Div ended -->
		</div>
		<script type="text/javascript">
		function displayPopup(){
			  document.getElementById('modalDiv').style.display='block';
			}
		function closePopup(){
			  document.getElementById('modalDiv').style.display='none';
			}
		
	    $(document).ready(function() {
	    	//alert("Create new sprint got called");
	    	$("#projectName").val("<%=project.getId()%>");
	    	$("#sprintDescription").val("");
	    	
	      });
		</script>
	</body>