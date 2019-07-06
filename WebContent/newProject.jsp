<%@page import="com.viva.db.util.CacheUtil"%>
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
	
	Map<String,User> managers = CacheUtil.allUsersMap;
	if(managers == null){
		managers = new HashMap<String,User>();
	}

%>
<!DOCTYPE html>
<html>	

	<head>
	
<link rel="stylesheet" href="./css/modal.css">
<script src="./vendor/jquery/jquery-3.2.1.min.js"></script>
		<script type="text/javascript">
			function clearProject() {
				console.log("clearProject jsm got called..");
				$("#projectManager").val("");
				$("#projectName").val("");
				$("#projectPriority").val("0");
				$("#projectStartDate").val("");
				$("#projectEndDate").val("");
				$("#projectDescription").val("");
			}
		</script>
		
	<script type="text/javascript">
	function displayProjectModalPopup(){
		  clearProject();
		  closeProjectModalPopup();
		  document.getElementById('projectModalDiv').style.display='block';
		}
	function closeProjectModalPopup(){
		  document.getElementById('projectModalDiv').style.display='none';
		}
	 $(document).ready(function() {
		 console.log("New Project page is opening .........");
	});
	</script>
	
	<script type="text/javascript">
	function saveProject() {
		console.log("saveProject function got called ");
		try{
			var errorMessage = "";
			var isValid = true;
			if($("#projectName").val() == ""){
				errorMessage+="\r\nPlease enter project name";
				isValid=false;
			}
			if($("#projectDescription").val() == ""){
				errorMessage+="\r\nPlease enter project description";
				isValid=false;
			}
			console.log("isValid : " + isValid);
			if(isValid == false){
				alert(errorMessage);
			}else{
		        $.ajax({
		            type: 'post',
		            url: './addProject',
		            data: $("form[name=newProjectForm]").serialize(),
		            success: function (response) {
		               console.log("Save Project completed..... " + response);
		               if(response === "success"){
		            	   alert("Project created Successfully");
		               }else if(response === "exist"){
		            	   alert("Project exist with this name ");
		               }else{
		            	   alert("Project creation fail");
		               }
		            }
		        });
		        closeProjectModalPopup();
			}
		}catch(e){
			console.log("Exception in new Project : " + e);
		}
	}
	</script>
	</head>
	<body>
	
	<!-- Project Creation Div -->
		<div id="projectModalDiv" class="modal">
		  <span onclick="closeProjectModalPopup()" class="close" title="Close Modal">&times;</span>
			<form class="modal-content" id="newProjectForm" name="newProjectForm">
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
		      <textarea rows="4" placeholder="Project Description" name="projectDescription" id="projectDescription" style="height: 100px;" required="required">
		      </textarea>
		      
		      <div class="clearfix">
		        <button type="button" onclick="closeProjectModalPopup()" class="cancelbtn">Cancel</button>
		        <button type="button" class="signupbtn" onclick="saveProject()">Save</button>
		      </div>
		    </div>
		  </form>
		</div>
		<!-- Project Creation Div ended -->
	</body>
	