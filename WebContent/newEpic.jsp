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
	String message = resp.getResponseMessage();
	
	String projectId = String.valueOf(request.getSession().getAttribute("projectId"));
	
	List<User> managers = (List<User>)request.getSession().getAttribute("managers");
	if(managers == null){
		managers = new ArrayList();
	}
	
	String userId = String.valueOf(request.getSession().getAttribute("userId"));
	String userName = String.valueOf(request.getSession().getAttribute("userName"));
	
	List<Project> lastUpdatedProjectsList = (List<Project>)request.getSession().getAttribute("lastUpdatedProjectsList");
	if(null == lastUpdatedProjectsList){
		lastUpdatedProjectsList = new ArrayList<>();
	}
	
	List<Project> projectsByManagerId = (List<Project>)request.getSession().getAttribute("projectsByManagerId");
	if(null == projectsByManagerId){
		projectsByManagerId = new ArrayList<>();
	}
	
	List<Sprint> sprintsByProjectId = (List<Sprint>)request.getSession().getAttribute("sprintsByProjectId");
	if(null == sprintsByProjectId){
		sprintsByProjectId = new ArrayList<>();
	}
%>
<!DOCTYPE html>
<!-- Project Creation Div -->
		<div id="modalDiv" class="modal">
		  <span onclick="javascript:closePopup()" class="close" title="Close Sprint">&times;</span>
			<form class="modal-content" method="post" action="./addEpic">
		    <div class="container">
		      <h1 style="color:green">Add Epic</h1>
		      <p style="color:red">Please fill in the form to add the Epic</p>
		      <hr>
		      
			   <label for="projectName"><b>Project Name</b></label><label style="color: red;">&nbsp;*</label>
			   <select id="projectName" name = "projectName" required>
		      <%for(Project p : projectsByManagerId){%>
		      		<option value="<%= p.getId()%>"><%= p.getName()%></option>
		      <%}%>
		      </select>
		      		   
		      <label for="sprintName"><b>Sprint Name</b></label><label style="color: red;">&nbsp;*</label>
		       <select id="sprintName" name = "sprintName" required>
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
			   
		      <label for="departmentDescription"><b>Assign to</b></label><label style="color: red;">&nbsp;*</label>
		      <select id="projectManager" name = "projectManager" required>
<%-- 		      <%for(User user : managers){%> --%>
<%-- 		      		<option value="<%= userId%>"><%= userName%></option> --%>
<%-- 		      <%}%> --%>
		      </select>
		      <label for="projectManager"><b>Project Manager</b></label><label style="color: red;">&nbsp;*</label>
		      <select id="projectManager" name = "projectManager" required>
			      <%for(User u : managers){%>
			      		<option value="<%= u.getEmailId()%>"><%= u.getFirstName() + " " + u.getLastName()%></option>
			      <%}%>
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

