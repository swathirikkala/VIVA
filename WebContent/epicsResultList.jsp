<%@page import="com.viva.dto.BusinessValue"%>
<%@page import="com.viva.dao.util.LookUp"%>
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
	ProjectDao projectDao = new ProjectDao();
	List<Project> projects = projectDao.getProjects();
	if(projects == null){
		projects = new ArrayList<Project>();
	}

%>
<%


	Sprint sprint = (Sprint)request.getSession().getAttribute("sprint");
	if(sprint == null){
		sprint = new Sprint();
	}
	String userId = String.valueOf(request.getSession().getAttribute("userId"));
	String userName = String.valueOf(request.getSession().getAttribute("userName"));
	String projectId = String.valueOf(request.getSession().getAttribute("projectId"));
	
	
	UserDao userDao = new UserDao();
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
	<script type="text/javascript">
	
			function displayPopup(){
				  document.getElementById('epicModalDiv').style.display='block';
				}
			function closePopup(){
				  document.getElementById('epicModalDiv').style.display='none';
				}
			
		    $(document).ready(function() {
		    	$("#editSprintProjectName").val("<%=sprint.getProjectId()%>");
		    	$("#editSprintDescription").val("");
		    	$("#editSprintDescription").val("<%=sprint.getDescription()%>");
		    	$("#description").val("<%=sprint.getDescription()%>");
		    	$("#sprintEditStartDate").val("<%=sprint.getStartDate()%>");
		    	$("#sprintEditEndDate").val("<%=sprint.getEndDate()%>");
		    	$("#editSprintPriority").val("<%=sprint.getSeverity()%>");
		    	$("#editSprintStatus").val("<%=sprint.getStatus()%>");
		    	$("#sprintViva").val("<%=sprint.getViva()%>");
		    	
		      });
	
	</script>
		<script type="text/javascript">
			function openEpicModal() {
				displayPopup();
			}
			function createEpic(){
				console.log("createEpic got called");
				console.log($("form[name=newEpicForm]").serialize());
	          
					$.ajax({
		                type: 'post',
		                url: './addEpic',
		                data: $("form[name=newEpicForm]").serialize(),
		                success: function (response) {
		                   console.log("Epic creation call completed..... " + response);
		                   if(response === "success"){
		                	   alert("Epic creation Success");
		                   }else{
		                	   alert("Epic creation Failed");
		                   }
		                },
						error : function(data, status, er) {
							console.log("Error in create new Epic jsm : " + data + " status: " + status + " er:" + er);
						
						}
		            });
					 closePopup();
			}
		</script>
		<script type="text/javascript">
			function editSprint() {
				console.log("editSprint got called");
				console.log($("form[name=newEpicForm]").serialize());
	          
					$.ajax({
		                type: 'post',
		                url: './editSprint',
		                data: $("form[name=editSprintForm]").serialize(),
		                success: function (response) {
		                   console.log("Epic Sprint call completed..... " + response);
		                   if(response === "success"){
		                	   alert("Sprint Update Success");
		                   }else{
		                	   alert("Sprint Update Failed");
		                   }
		                },
						error : function(data, status, er) {
							console.log("Error in Update Sprint jsm : " + data + " status: " + status + " er:" + er);
						
						}
		            });
			}
		</script>
	</head>
	<body>
		
		<form method="post" name="editSprintForm" id="editSprintForm">
		    <div class="divClass">
		    
		    	<table>
		    		<tr>
		    			<th class="cellClass">
		    				<label>Project Name</label>
		    			</th>
		    			<td class="cellClass">
		    				   <select id="editSprintProjectName" name = "editSprintProjectName" >
						       <option value="" selected="selected">--Select Project--</option>
						      <%for(Project p : projects){%>
						      		<option value="<%= p.getId()%>"><%= p.getName()%></option>
						      <%}%>
						      </select>
		    			</td>
		    			<th>
		    				<label>VIVA%</label>
		    			</th>
		    			<td>
		    				<input type="text" name="sprintViva" id="sprintViva" disabled="disabled" value="">
		    			</td>
		    		
		    			<th class="cellClass">
		    				<label>Start Date</label>
		    			</th>
		    			<td class="cellClass">
		    				<input type="date" placeholder="Project Start Date" name="sprintEditStartDate" id="sprintEditStartDate"  class="">
		    			</td>
		    		</tr>
		    		<tr>
		    			<th>
		    			<label>Priority</label>
		    			</th>
		    			<td>
		    				<select id="editSprintPriority" name = "editSprintPriority">
					      		<option value="0">--Select--</option>
					      		<% for(String p : LookUp.getPriorities()){ %>
					      			<option value="<%=p%>"><%=p%></option>
						      	<%} %>
					     	 </select>
		    			</td>
		    			<th>
		    				<label>Status</label>
		    			</th>
		    			<td>
		    				<select id="editSprintStatus" name = "editSprintStatus">
					      		<option value="0">--Select--</option>
					      		<% for(String s : LookUp.getStatuses()){ %>
					      			<option value="<%= s%>"><%= s%></option>
						      	<%} %>
					     	 </select>
		    			</td>
		    			<th class="cellClass">
		    				<label>End date</label>
		    			</th>
		    			<td class="cellClass">
					    	<input type="date" placeholder="Sprint End Date" name="sprintEditEndDate" id="sprintEditEndDate"  class="">
		    			</td>
		    	
		    		</tr>
		    		<tr>
		    			<th>
		    				<label>Description</label>
		    			</th>
		    			<td colspan="5">
		    				<textarea rows="4" cols="50" placeholder="Sprint Description" name="editSprintDescription" id="editSprintDescription" style="height: 100px;" required="required">
		      				</textarea>
		    			</td>
		    		</tr>
		    	</table>
		    </div>
		    
		    <div style="margin-left: 35%;">
			    	<button type="button" onclick="editSprint()" class="signupbtn" style="text-align: centre; width:100px;">Save</button>
			    	&nbsp;
			    	<button type="button" onclick="clearProjectEditFields();" class="cancelbtn" style="text-align: centre; width:100px;margin-left: 5px;">Clear</button>
		   	</div>
		  </form>
		  
		<div style="margin-top: 50px;">
			<button onclick="openEpicModal()" style="width: auto;">New Epic</button>
		
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
		
		<!-- Epic Creation Div -->
		<div id="epicModalDiv" class="modal">
		  <span onclick="javascript:closePopup()" class="close" title="Close Sprint">&times;</span>
			<form class="modal-content" name="newEpicForm" id="newEpicForm">
		    <div class="container">
		    <input type="hidden" id="createdBy" name="createdBy" value="<%=userId%>">
		      <h1 style="color:green">Add Epic</h1>
		      <p style="color:red">Please fill in the form to add the Epic</p>
		      <hr>
		      
			   <label for="projectName"><b>Project Name</b></label>
			   <select id="projectName" name = "projectName" >
		       <option value="" selected="selected">--Select Project--</option>
		      <%for(Project p : projects){%>
		      		<option value="<%= p.getId()%>"><%= p.getName()%></option>
		      <%}%>
		      </select>
		      		   
		      <label for="epicName"><b>Epic Name</b></label><label style="color: red;">&nbsp;*</label>
		      <input type="text" name="epicName" id="epicName" required="required" placeholder="Epic Name">
		      		      
			   <label for="severity"><b>Epic Priority</b></label><label style="color: red;">&nbsp;*</label>
			     <select id="epicPriority" name = "epicPriority" required>
			      	<option value="0">--Select--</option>
		      		<%for(BusinessValue bv:LookUp.getBusinessValues()){ %>
			      		<option value="<%=bv.getId()%>"><%=bv.getName()%></option>
			      	<%} %>
		     	 </select>
			   
			   <label for="epicBusinessValues"><b>Business Values</b></label><label style="color: red;">&nbsp;*</label>
		       <select id="epicBusinessValues" name = "epicBusinessValues" required>
			      <%for(Sprint s : sprintsByProjectId){%>
			      		<option value="<%= s.getSprintId()%>"><%= s.getSprintName()%></option>
			      <%}%>
		      </select>

		      <label for="description"><b>Epic Description</b></label><label style="color: red;">&nbsp;*</label>
		      <textarea rows="4" cols="50" placeholder="Description" name="description" id="description" style="height: 100px;">
		      </textarea>
		      
		      <div class="clearfix">
		        <button type="button" onclick="javascript:closePopup()" class="cancelbtn">Cancel</button>
		        <button type="button" class="signupbtn" onclick="createEpic()">Save</button>
		      </div>
		    </div>
		  </form>
		  </div>
		</div>
		<!-- Epic Creation Div ended -->

	</body>