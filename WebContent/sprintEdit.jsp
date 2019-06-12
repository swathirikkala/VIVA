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

%>

<html>
	<head>
	
	<script type="text/javascript">
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
		    	$("#editSprintName").val("<%=sprint.getSprintId()%>");
		      });
	
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
		<h1 class="w3-xxxlarge w3-text-red"><b>Sprint Edit Form </b></h1>
		
		<form method="post" name="editSprintForm" id="editSprintForm">
		    <div class="divClass">
		    
		    	<table>
		    		<tr>
		    			<th class="cellClass">
		    				<label>Project Name</label>
		    			</th>
		    			<td class="cellClass">
		    				   <select id="editSprintProjectName" name = "editSprintProjectName" >
						       <option value="0" selected="selected">--Select Project--</option>
						      <%for(Project p : projects){%>
						      		<option value="<%= p.getId()%>"><%= p.getName()%></option>
						      <%}%>
						      </select>
		    			</td>
		    			<th>
		    				<label>Sprint</label>
		    			</th>
		    			<td>
		    				<td class="cellClass">
		    				   <select id="editSprintName" name = "editSprintName" >
						       <option value="0" selected="selected">--Select Sprint--</option>
						      <%for(Sprint s : sprintsByProjectId){%>
						      		<option value="<%= s.getSprintId()%>"><%= s.getSprintName()%></option>
						      <%}%>
						      </select>
		    			</td>
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
		    	
		    		</tr><tr>
		    			<th>
		    				<label>VIVA%</label>
		    			</th>
		    			<td>
		    				<input type="text" name="sprintViva" id="sprintViva" readonly="readonly" value="">
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

	</body>