<%@page import="com.viva.dao.ProjectDao"%>
<%@page import="com.viva.dao.UserDao"%>
<%@page import="com.viva.dao.util.LookUp"%>
<%@page import="com.viva.dto.Project"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.viva.dto.User"%>
<%@page import="java.util.List"%>
<%@page import="com.viva.dao.Response"%>

<%
	Response resp = (Response)request.getSession().getAttribute("response");
	String message = resp.getResponseMessage();
	String userId = String.valueOf(request.getSession().getAttribute("userId"));
	String userName = String.valueOf(request.getSession().getAttribute("userName"));
	
	UserDao userDao = new UserDao();
	ProjectDao projectDao = new ProjectDao();
	
	List<User> managers = userDao.getManagers();
	if(managers == null){
		managers = new ArrayList<User>();
	}
	List<Project> lastUpdatedProjectsList = projectDao.lastUpdatedProjectsListByManagerId(userId);
	if(null == lastUpdatedProjectsList){
		lastUpdatedProjectsList = new ArrayList<Project>();
	}
%>
<!DOCTYPE html>
<html>
	<head>
	<script type="text/javascript">
	
	function displayPopup(){
		  document.getElementById('modalDiv').style.display='block';
		}
	function closePopup(){
		  document.getElementById('modalDiv').style.display='none';
		}
	
    $(document).ready(function() {
    	displayPopup();
    	$("#projectDescription").val("");
      });
	
	</script>
	</head>
	<body>
	
	<!-- Project Creation Div -->
		<div id="modalDiv" class="modal">
		  <span onclick="closePopup()" class="close" title="Close Modal">&times;</span>
			<form class="modal-content" method="post" action="./addProject">
		    <div class="container">
		      <h1 style="color: green;">Add Project</h1>
		      <p style="color: red;">Please fill in the form to add the Project</p>
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
			   
			   <div id="createdByDiv" style="display: none;">
				   <label for="createdBy"><b>Created By</b></label><label style="color: red;">&nbsp;*</label>
				   <input type="hidden" placeholder="Created By" name="createdBy" id="createdBy" required value="<%= userId %>">
				   <input type="text" placeholder="Created By" name="createdByName" id="createdByName" required value="<%= userName %>" disabled="disabled">
			   </div>
			   
		      <label for="departmentDescription"><b>Project Manager</b></label><label style="color: red;">&nbsp;*</label>
		      <select id="projectManager" name = "projectManager" required>
		      <%for(User user : managers){%>
		      		<option value="<%= userId%>"><%= userName%></option>
		      <%}%>
		      </select>
		      
		      <label for="projectDescription"><b>Project Description</b></label><label style="color: red;">&nbsp;*</label>
		      <textarea rows="4" cols="50" placeholder="Project Description" name="projectDescription" id="projectDescription" style="height: 100px;">
		      </textarea>
		      
		      <div class="clearfix">
		        <button type="button" onclick="closePopup()" class="cancelbtn">Cancel</button>
		        <button type="submit" class="signupbtn" id="saveDepartmentDiv">Save</button>
		      </div>
		    </div>
		  </form>
		</div>
		<!-- Project Creation Div ended -->
	</body>
	