<%@page import="com.viva.dao.EpicDao"%>
<%@page import="com.viva.dto.Epic"%>
<%@page import="com.viva.dao.SprintDao"%>
<%@page import="com.viva.dao.ProjectDao"%>
<%@page import="com.viva.dao.UserDao"%>
<%@page import="com.viva.dto.Sprint"%>
<%@page import="com.viva.dto.Project"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.viva.dto.User"%>
<%@page import="java.util.List"%>
<%@page import="com.viva.dao.Response"%>

<%
	Response resp = (Response)request.getSession().getAttribute("response");
	//String message = resp.getResponseMessage();
	String userId = String.valueOf(request.getSession().getAttribute("userId"));
	String userName = String.valueOf(request.getSession().getAttribute("userName"));
	String projectId = String.valueOf(request.getSession().getAttribute("projectId"));
	
	
	UserDao userDao = new UserDao();
	ProjectDao projectDao = new ProjectDao();
	SprintDao sprintDao = new SprintDao();
	EpicDao epicDao = new EpicDao();
	List<User> managers = userDao.getManagers();
	if(managers == null){
		managers = new ArrayList<User>();
	}
	
	
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
	
	List<User> listOfUsers =  new UserDao().getAllUsers();
	if(null == listOfUsers){
		listOfUsers = new ArrayList<User>();
	}
	List<Epic> epics = epicDao.getEpics(); 
	if(null == epics){
		epics = new ArrayList<Epic>();
	}
%>
<!DOCTYPE html>
<!-- Project Creation Div -->
		<div id="modalDiv" class="modal">
		  <span onclick="javascript:closePopup()" class="close" title="Close Sprint">&times;</span>
			<form class="modal-content" method="post" action="./addUserStory">
		    <div class="container">
		    <input type="hidden" id="createdBy" name="createdBy" value="<%=userId%>">
		      <h1 style="color:green">Add User Story</h1>
		      <p style="color:red">Please fill in the form to add the User Story</p>
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
		      <select id="epicName" name = "epicName" >
		       <option value="" selected="selected">--Select Sprint--</option>
		      <%for(Epic e : epics){%>
		      		<option value="<%= e.getId()%>"><%= e.getName()%></option>
		      <%}%>
		      </select>
		     
		     <label for="usName"><b>User Story Name</b></label><label style="color: red;">&nbsp;*</label>
			   <input type="text" placeholder="User Story Name" name="usName" id="usName" required>
		     
		     
			   <label for="severity"><b>User Story Severity</b></label><label style="color: red;">&nbsp;*</label>
			     <select id="severity" name = "severity" required>
		      		<option value="1" selected="selected">High</option>
			      	<option value="2">Medium</option>
			      	<option value="3">Low</option>
			      	<option value="4">No Severity</option>
		     	 </select>
		     	 
			   <label for="startDate"><b>User Story Start Date</b></label><label style="color: red;">&nbsp;*</label>
			   <input type="date" placeholder="Sprint Start Date" name="startDate" id="startDate" required>
			   
			   <label for="endDate"><b>User Story End Date</b></label><label style="color: red;">&nbsp;*</label>
			   <input type="date" placeholder="Sprint End Date" name="endDate" id="endDate" required>
			   
			   <input type="hidden" placeholder="Created By" name="createdBy" id="createdBy" required value="<%= userId %>">
			   
			   <label for="businessValues"><b>Business Values</b></label><label style="color: red;">&nbsp;*</label>
		       <select id="businessValues" name = "businessValues">
		      <%for(Sprint s : sprintsByProjectId){%>
		      		<option value="<%= s.getSprintId()%>"><%= s.getSprintName()%></option>
		      <%}%>
		      </select>
			   
		      <label for="assignTo"><b>Assign to</b></label><label style="color: red;">&nbsp;*</label>
		      <select id="assignTo" name = "assignTo" required>
		      <%for(User user : listOfUsers){%>
		      		<option value="<%= userId%>"><%= userName%></option>
		      <%}%>
		      </select>
		      <label for="projectManager"><b>Project Manager</b></label><label style="color: red;">&nbsp;*</label>
		      <select id="projectManager" name = "projectManager" required>
			      <%for(User u : managers){%>
			      		<option value="<%= u.getEmailId()%>"><%= u.getFirstName() + " " + u.getLastName()%></option>
			      <%}%>
		      </select>
		      <label for="description"><b>User Story Description</b></label><label style="color: red;">&nbsp;*</label>
		      <textarea rows="4" cols="50" placeholder="Description" name="description" id="description" style="height: 100px;">
		      </textarea>
		      
		      <div class="clearfix">
		        <button type="button" onclick="javascript:closePopup()" class="cancelbtn">Cancel</button>
		        <button type="submit" class="signupbtn" id="saveDepartmentDiv">Save</button>
		      </div>
		    </div>
		  </form>
		</div>
		<!-- Project Creation Div ended -->
	<script type="text/javascript">
	
	function displayPopup(){
		  document.getElementById('modalDiv').style.display='block';
		}
	function closePopup(){
		  document.getElementById('modalDiv').style.display='none';
		}
	
    $(document).ready(function() {
    	displayPopup();
    	//alert("Create new sprint got called");
    	$("#projectName").val("<%=projectId%>");
    	$("#projectManager").val("<%=userId%>");
    	$("#description").val("");
    	
      });
	
	</script>

