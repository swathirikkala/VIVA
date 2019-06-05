<%@page import="com.viva.dto.Epic"%>
<%@page import="com.viva.dao.EpicDao"%>
<%@page import="com.viva.dto.Sprint"%>
<%@page import="com.viva.dao.SprintDao"%>
<%@page import="com.viva.dto.UserStory"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
    
		ProjectDao projectDao = new ProjectDao();
		List<Project> projects = projectDao.getProjects();
		if(projects == null){
			projects = new ArrayList<Project>();
		}

		Project project = (Project)request.getSession().getAttribute("project");
    	if(project == null){
    		project = new Project();
    	}

    	UserStory userStoryForEdit = (UserStory)request.getSession().getAttribute("userStoryForEdit");
    	if(userStoryForEdit == null){
    		userStoryForEdit = new UserStory();
    	}
    	
    	SprintDao sprintDao = new SprintDao();
    	List<Sprint> sprintsByProjectId = sprintDao.getSpintsByProject(String.valueOf(project.getId()));
    	if(sprintsByProjectId == null){
    		sprintsByProjectId = new ArrayList<Sprint>();
    	}
    	
    	EpicDao epicDao = new EpicDao();
    	List<Epic> epicsByProjectId = epicDao.getEpicsByProjectId(project.getId());
    	if(epicsByProjectId == null){
    		epicsByProjectId = new ArrayList<Epic>();
    	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<style type="text/css">
		.divClass{
			margin-bottom: 2px; margin-top: 2px; margin-left: 2px; margin-right: 2px; border: thin;
		}
	</style>

	<script type="text/javascript">
		function updateEpic(){
			
			console.log("update Project got called");
			var updateUSFormData = $("form[name=updateUSForm]").serialize();
			console.log(updateUSFormData);
			try {
				$.ajax({
					type : 'post',
					url : './updateUserStory',
					data : updateUSFormData,
					success : function(response) {
						console.log("update User story completed..... " + response);
						if (response !== "success") {
							alert("Update not successfull");
						}else{
							alert("Update successfull");
						}
					},
					error : function(data, status, er) {
						console.log("Error in update Us jsm : " + data
								+ " status: " + status + " er:" + er);
					}
				});
			} catch (e) {
				console.log("Exception in update US jsm : " + e);
			}
		}
		
	</script>

</head>
<body>
<h1 class="w3-xxxlarge w3-text-red"><b>User Story View/Edit</b></h1>
		<hr>
		<form method="post" name="updateUSForm" id="updateUSForm">
		    <div class="divClass">
		    
		    	<table>
		    		<tr>
		    			<th class="cellClass">
		    				<label>Project Name</label>
		    			</th>
		    			<td class="cellClass">
		    				<select id="projectName" name = "projectName" >
						       <option value="" selected="selected">--Select Project--</option>
						      <%for(Project p : projects){%>
						      		<option value="<%= p.getId()%>"><%= p.getName()%></option>
						      <%}%>
						    </select>
		    			</td>
		    			
		    			<th class="cellClass">
		    				<label>Sprint Name</label>
		    			</th>
		    			<td class="cellClass">
		    				<select id="sprintName" name = "sprintName" >
						       <option value="" selected="selected">--Select Project--</option>
						      <%for(Sprint s : sprintsByProjectId){%>
						      		<option value="<%= s.getSprintId()%>"><%= s.getSprintName()%></option>
						      <%}%>
						    </select>
		    			</td>
		    			
		    			<th class="cellClass">
		    				<label>Epic Name</label>
		    			</th>
		    			<td class="cellClass">
		    				<select id="epicName" name = "epicName" >
						       <option value="" selected="selected">--Select Project--</option>
						      <%for(Epic e : epicsByProjectId){%>
						      		<option value="<%= e.getId()%>"><%= e.getName()%></option>
						      <%}%>
						    </select>
		    			</td>
		    		</tr>
		    		<tr>
		    			<th>
		    			<label>Priority</label>
		    			</th>
		    			<td>
		    				<select id="priority" name = "priority">
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
		    				<input type="text" name="viva" id="viva" disabled="disabled" value="<%=userStoryForEdit.getViva()%>">
		    			</td>
		    			<th>
		    				<label>Status</label>
		    			</th>
		    			<td>
		    				<select id="status" name = "status">
					      		<option value="0">--Select--</option>
					      		<% for(String s : LookUp.getStatuses()){ %>
					      			<option value="<%= s%>"><%= s%></option>
						      	<%} %>
					     	 </select>
		    			</td>
		    		</tr>
		    		<tr>
		    			
		    		</tr>
		    		<tr>
		    			<th>
		    				<label>User Story  Description</label>
		    			</th>
		    			<td colspan="5">
		    				<textarea rows="4" cols="50" placeholder="User Story Description" name="editProjectDescription" id="editProjectDescription" style="height: 100px;" required="required">
		      				</textarea>
		    			</td>
		    		</tr>
		    	</table>
		    </div>
		    <button onclick="openUSModal()" style="width: auto;">New User Story</button>
		    <div style="margin-left: 25%;display: inline-flex;">
			    	<button type="button" class="signupbtn" style="text-align: centre; width:100px;" onclick="updateProject()">Save</button>
			    	&nbsp;
			    	<button type="button" onclick="clearUSEditFields();" class="cancelbtn" style="text-align: centre; width:100px;margin-left: 5px;">Clear</button>
		   	</div>
		  </form>
		  <!-- User Story Creation Div started-->
			<jsp:include page="./newUS.jsp"/>
		<!-- User Story Creation Div ended -->
</body>
<script type="text/javascript">
	

</script>

	<script type="text/javascript">
	$(document).ready(function() {
		console.log("Project loaded for edit mode");
    	setTimeout(function(){
        	console.log("Project Edit Loading");
    			$("#projectName").val("<%=userStoryForEdit.getProject()%>");
    			$("#sprintName").val("<%=userStoryForEdit.getSprint()%>");
    			$("#epicName").val("<%=userStoryForEdit.getEpic()%>");
    			$("#priority").val("<%=userStoryForEdit.getPrioroty()%>");
    			$("#status").val("<%=userStoryForEdit.getStatus()%>");
    		}, 1000);
    	
    	

    	$("#projectName").change(
    			function() {
    				console.log("projectName change event got called");
    				var projectId= $("#projectName").val();
    				console.log("Project id : " + projectId);
    				$("#epicName").empty();
    				$("#epicName").append('<option value="">Loading ....</option>');
    				try {
    					$.ajax({
    						type : 'post',
    						url : './epicSearchByProjectId',
    						data : {projectId:projectId},
    						success : function(response) {
    							var respJSONString = JSON.stringify(response);
    							var jsonObj = JSON.parse(respJSONString);
    							console.log(respJSONString);
    							console.log(jsonObj.responseCode + " : " + jsonObj.responseMessage);
    							var option='<option value="" selected="selected">--Select Sprint--</option>';
    			                if(jsonObj.responseCode == 1){
    			                	console.log("data found");
    								$("#epicName").empty();
    								$("#epicName").append(option);
    								$.each(response.responseObject, function (i, epic) {
    									option='<option value="'+epic.id+'">'+epic.name+'</option>';
//    										console.log(option);
    									$("#epicName").append(option);
    								});
    								
    			                }else{
    			                	alert("no epics found with this search criteria");
    			                	var option='<option value="" selected="selected">--Select Epic--</option>';
    								$("#epicName").empty();
    								$("#epicName").append(option);
    			                }
    						},
    						error : function(data, status, er) {
    							console.log("Error in projectName Change event in US edit jsm  : " + data
    									+ " status: " + status + " er:" + er);
    						}
    					});
    				} catch (e) {
    					console.log("Exception in projectName Change event in US edit jsm : " + e);
    				}
    			});
    	
    	
    	
    	
    	
  	});//document ready close
	
	
	</script>
</html>