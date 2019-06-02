<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.viva.dao.ProjectDao"%>
<%@page import="com.viva.dao.UserDao"%>
<%@page import="com.viva.dao.util.LookUp"%>
<%@page import="com.viva.dto.Project"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.viva.dto.User"%>
<%@page import="java.util.List"%>

<%
	String userId = String.valueOf(request.getSession().getAttribute("userId"));
	String userName = String.valueOf(request.getSession().getAttribute("userName"));
	
	UserDao userDao = new UserDao();
	ProjectDao projectDao = new ProjectDao();
	
	Map<String,User> managers = userDao.getManagers();
	if(managers == null){
		managers = new HashMap<String,User>();
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
		      
		      
			   <label for="projectSeverity"><b>Project Priority</b></label>
			     <select id="projectPriority" name = "projectPriority">
		      		<option value="0">--Select--</option>
		      		<% for(String p : LookUp.getPriorities()){ %>
		      			<option value="<%= p%>"><%= p%></option>
			      	<%} %>
		     	 </select>
			   <label for="projectStartDate"><b>Project Start Date</b></label>
			   <input type="date" placeholder="Project Start Date" name="projectStartDate" id="projectStartDate">
			   
			   <label for="projectEndDate"><b>Project End Date</b></label>
			   <input type="date" placeholder="Project End Date" name="projectEndDate" id="projectEndDate">
			   
			   <input type="hidden" placeholder="Created By" name="createdBy" id="createdBy" required value="<%= userId %>">
			   
		      <label for="departmentDescription"><b>Project Manager</b></label>
		      <select id="projectManager" name = "projectManager">
		      <option value="">--Select--</option>
			      <%for(String managerId : managers.keySet()){
			    	  String managerName = "";
			    	  User manager = managers.get(managerId);
			    	  if(manager != null){
			    		  managerName = manager.getFirstName() +" " + manager.getLastName();
			    	  }
			      %>
		      		<option value="<%= managerId%>"><%= managerName%></option>
		     	 <%}%>
		      </select>
		      
		      <label for="projectDescription"><b>Project Description</b></label><label style="color: red;">&nbsp;*</label>
		      <textarea rows="4" cols="50" placeholder="Project Description" name="projectDescription" id="projectDescription" style="height: 100px;" required="required">
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
	