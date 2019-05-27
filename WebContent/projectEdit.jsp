<%@page import="com.viva.dao.util.LookUp"%>
<%@page import="com.viva.dao.ProjectDao"%>
<%@page import="com.viva.dao.UserDao"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.viva.dto.User"%>
<%@page import="java.util.Map"%>
<%@page import="com.viva.dto.Project"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
		UserDao userDao = new UserDao();
		ProjectDao projectDao = new ProjectDao();
    	Project project = (Project)request.getSession().getAttribute("project");
    	if(project == null){
    		project = new Project();
    	}
    	Map<String,User> managers = userDao.getManagers();
    	if(managers == null){
    		managers = new HashMap<String,User>();
    	}
    	Map<String, User> allUsers = userDao.getAllUsers();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<style type="text/css">
		.divClass{
			margin-bottom: 2px; margin-top: 2px; margin-left: 2px; margin-right: 2px; border: thin;
		}
		.cellClass{
			width: 200px;
			padding-right: 25px;
		}
	</style>
	<script type="text/javascript">
	$("#projectStartDate").change(function() {
	console.log("projectStartDate : " + $("#projectStartDate").val());
		 if($("#projectStartDate").val() !== ""){
			 if (Date.parse($("#projectStartDate").val()) > Date.parse($("#projectEndDate").val())) {
	               alert('Project Start Date should not greater than End Date.');
	               $("#projectStartDate").val("");
	           }
		 }
	});
	
	$("#projectEndDate").change(function() {
		console.log("projectEndDate : " + $("#projectEndDate").val());
		 if($("#projectEndDate").val() !== ""){
			 if (Date.parse($("#projectStartDate").val()) > Date.parse($("#projectEndDate").val())) {
	               alert('Project End Date should not lesser than Start Date.');
	               $("#projectEndDate").val("");
	           }
		 }
	});
	</script>
	<script type="text/javascript">
	$(document).ready(function() {
    	setTimeout(function(){
        	console.log("Project Edit Loading");
    			$("#projectStatus").val("<%=project.getStatus()%>");
    			$("#projectManager").val("<%=project.getManager()%>");
    			$("#projectStartDate").val("<%=project.getStartDate()%>");
    			$("#projectEndDate").val("<%=project.getEndDate()%>");
    			$("#projectPriority").val("<%=project.getSeverity()%>");
    			$("#projectStatus").val("<%=project.getStatus()%>");
    			$("#projectDescription").val("<%=project.getDescription()%>");
    		}, 2000);
  	});
	</script>
	<script type="text/javascript">
		function clearProjectEditFields() {
			
		}
		function updateProject() {
			
		}
	</script>
</head>
<body>
<h1 class="w3-xxxlarge w3-text-red"><b>Project View/Edit</b></h1>
		<hr>
		<form method="post">
		    <div class="divClass">
		    
		    	<table>
		    		<tr>
		    			<th class="cellClass">
		    				<label>Project Name</label>
		    			</th>
		    			<td class="cellClass">
		    				<input type="hidden" name="projectId" id="projectId" required="required" value="<%=project.getId()%>">
		    				<input type="text" name="editProjectName" id="editProjectName" required="required" value="<%=project.getName()%>">
		    			</td>
		    			<th class="cellClass">
		    				<label>Created By</label>
		    			</th>
		    			<td class="cellClass">
					    	<input type="text" name="createdBy" id="createdBy" required="required" value="<%=LookUp.getUserName(project.getCreatedBy(),allUsers) %>" disabled="disabled">
		    			</td>
		    		
		    			<th class="cellClass">
		    				<label>Start Date</label>
		    			</th>
		    			<td class="cellClass">
		    				<input type="date" placeholder="Project Start Date" name="projectStartDate" id="projectStartDate"  class="">
		    			</td>
		    		</tr>
		    		<tr>
		    			
		    			<th class="cellClass">
		    				<label>Project Manager</label>
		    			</th>
		    			<td class="cellClass">
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
		    			</td>
		    	
		    			<th class="cellClass">
		    				<label>Created Date</label>
		    			</th>
		    			<td class="cellClass">
		    				<input type="text" placeholder="Created Date" name="createdDate" id="createdDate" required value="<%=project.getLastModifiedDateTime()%>" disabled="disabled"  class="">
		    			</td>
		    			<th class="cellClass">
		    				<label>Project End date</label>
		    			</th>
		    			<td class="cellClass">
					    	<input type="date" placeholder="Project End Date" name="projectEndDate" id="projectEndDate"  class="">
		    			</td>
		    		</tr>
		    		<tr>
		    			<th>
		    			<label>Priority</label>
		    			</th>
		    			<td>
		    				<select id="projectPriority" name = "projectPriority">
					      		<option value="0">--Select--</option>
					      		<% for(String p : LookUp.getPriorities()){ %>
					      			<option value="<%=p%>"><%=p%></option>
						      	<%} %>
					     	 </select>
		    			</td>
		    			<th>
		    				<label>VIVA%</label>
		    			</th>
		    			<td>
		    				<input type="text" name="viva" id="viva" disabled="disabled" value="<%=project.getViva()%>">
		    			</td>
		    			<th>
		    				<label>Status</label>
		    			</th>
		    			<td>
		    				<select id="projectStatus" name = "projectStatus">
					      		<option value="0">--Select--</option>
					      		<% for(String s : LookUp.getStatuses()){ %>
					      			<option value="<%= s%>"><%= s%></option>
						      	<%} %>
					     	 </select>
		    			</td>
		    		</tr>
		    		<tr>
		    			<th>
		    				<label>Project  Description</label>
		    			</th>
		    			<td colspan="5">
		    				<textarea rows="4" cols="50" placeholder="Project Description" name="projectDescription" id="projectDescription" style="height: 100px;" required="required">
		      				</textarea>
		    			</td>
		    		</tr>
		    	</table>
		    </div>
		    
		    <div style="margin-left: 35%;">
			    	<button type="button" class="signupbtn" style="text-align: centre; width:100px;" onclick="updateProject()">Save</button>
			    	&nbsp;
			    	<button type="button" onclick="clearProjectEditFields();" class="cancelbtn" style="text-align: centre; width:100px;margin-left: 5px;">Clear</button>
		   	</div>
		  </form>
</body>
</html>