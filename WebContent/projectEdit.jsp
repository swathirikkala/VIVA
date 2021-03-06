<%@page import="com.viva.db.util.CacheUtil"%>
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
    	Project project = (Project)request.getSession().getAttribute("project");
    	if(project == null){
    		project = new Project();
    	}
    	if("2000-01-01".equals(project.getStartDate())){
    		project.setStartDate("");
    	}

    	if("2000-01-01".equals(project.getEndDate())){
    		project.setEndDate("");
    	}
    	
    	Map<String,User> managers = CacheUtil.allUsersMap;
    	if(managers == null){
    		managers = new HashMap<String,User>();
    	}
    	Map<String, User> allUsers = CacheUtil.allUsersMap;
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
	$("#editProjectStartDate").change(function() {
	console.log("editProjectStartDate : " + $("#editProjectStartDate").val());
		 if($("#editProjectStartDate").val() !== ""){
			 if (Date.parse($("#editProjectStartDate").val()) > Date.parse($("#editEndDate").val())) {
	               alert('Project Start Date should not greater than End Date.');
	               $("#editProjectStartDate").val("");
	           }
		 }
	});
	
	$("#editEndDate").change(function() {
		console.log("editEndDate : " + $("#editEndDate").val());
		 if($("#editEndDate").val() !== ""){
			 if (Date.parse($("#editProjectStartDate").val()) > Date.parse($("#editEndDate").val())) {
	               alert('Project End Date should not lesser than Start Date.');
	               $("#editEndDate").val("");
	           }
		 }
	});
	</script>
	<script type="text/javascript">
	$(document).ready(function() {
		console.log("Project loaded for edit mode");
    	setTimeout(function(){
        	console.log("Project Edit Loading");
    			$("#editProjectStatus").val("<%=project.getStatus()%>");
    			$("#editProjectManager").val("<%=project.getManager()%>");
    			$("#editProjectStartDate").val("<%=project.getStartDate()%>");
    			$("#editEndDate").val("<%=project.getEndDate()%>");
    			$("#editProjectPriority").val("<%=project.getPriority()%>");
    			$("#editProjectStatus").val("<%=project.getStatus()%>");
    			$("#editProjectDescription").val("<%=project.getDescription()%>");
    		}, 1000);
  	});
	</script>
	<script type="text/javascript">
		function updateProject(){
			
			console.log("update Project got called");
			console.log($("form[name=editProjectForm]").serialize());
			try {
				$.ajax({
					type : 'post',
					url : './editProject',
					data : $("form[name=editProjectForm]").serialize(),
					success : function(response) {
						console.log("update completed..... " + response);
						if (response !== "success") {
							alert("Update not successfull");
						}else{
							alert("Update successfull");
						}
					},
					error : function(data, status, er) {
						console.log("Error in update prject jsm : " + data
								+ " status: " + status + " er:" + er);
					}

				});
			} catch (e) {
				console.log("Exception in update prject jsm : " + e);
			}
		}
		
	</script>
<script type="text/javascript">
	function clearEditProjectChanges() {
		console.log("clearEditProjectChanges got called ....... ");
		$("#commonDiv").empty();
       	$("#commonDiv").load('projectEditHome.jsp',function(){console.log("Project Edit PAge Loaded ...")});
	}
</script>
</head>
<body>
<h1 class="w3-xxxlarge w3-text-red"><b>Project View/Edit</b></h1>
		<hr>
		<form method="post" name="editProjectForm" id="editProjectForm">
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
					    	<input type="text" name="createdBy" id="createdBy" required="required" value="<%=LookUp.getUserName(project.getCreatedBy(),allUsers) %>" readonly="readonly">
		    			</td>
		    		
		    			<th class="cellClass">
		    				<label>Start Date</label>
		    			</th>
		    			<td class="cellClass">
		    				<input type="date" placeholder="Project Start Date" name="editProjectStartDate" id="editProjectStartDate" value="<%=project.getStartDate() %>" class="">
		    			</td>
		    		</tr>
		    		<tr>
		    			
		    			<th class="cellClass">
		    				<label>Project Manager</label>
		    			</th>
		    			<td class="cellClass">
					    	<select id="editProjectManager" name = "editProjectManager">
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
		    				<input type="text" placeholder="Created Date" name="editCreatedDate" id="editCreatedDate" value="<%=project.getCretatedDate()%>" readonly="readonly"  class="">
		    			</td>
		    			<th class="cellClass">
		    				<label>Project End date</label>
		    			</th>
		    			<td class="cellClass">
					    	<input type="date" placeholder="Project End Date" name="editEndDate" id="editEndDate" value="<%=project.getEndDate() %>" class="">
		    			</td>
		    		</tr>
		    		<tr>
		    			<th>
		    			<label>Priority</label>
		    			</th>
		    			<td>
		    				<select id="editProjectPriority" name = "editProjectPriority">
					      		<option value="0">--Select--</option>
					      		<% for(String p : LookUp.getPriorities()){ %>
					      			<option value="<%=p%>"><%=p%></option>
						      	<%} %>
					     	 </select>
		    			</td>
		    			<th>
		    				<label>BV Achieved %</label>
		    			</th>
		    			<td>
		    				<input type="text" name="viva" id="viva" readonly="readonly" value="<%=project.getViva()%>">
		    			</td>
		    			<th>
		    				<label>Status</label>
		    			</th>
		    			<td>
		    				<select id="editProjectStatus" name = "editProjectStatus">
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
		    				<textarea rows="2" cols="50" placeholder="Project Description" name="editProjectDescription" id="editProjectDescription" style="height: 100px;" required="required">
		      				</textarea>
		    			</td>
		    		</tr>
		    	</table>
		    </div>
		  </form>
		    
		    <div>
		    <div style="display: inline-flex;">
				<button onclick="openSprintModal()" style="width: auto;">Create New Sprint</button>
			   </div>
			    <div style="display: inline-flex;margin-left: 30%;">
			    <button type="button" class="signupbtn" style="text-align: centre; width:100px;" onclick="updateProject()">Save</button>
			    	&nbsp;
			    <button type="button" onclick="clearEditProjectChanges();" class="cancelbtn" style="text-align: centre; width:155px;margin-left: 5px;">Cancel Changes</button>
		   	</div>
		   	</div>
</body>
</html>