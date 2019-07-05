<%@page import="com.viva.db.util.CacheUtil"%>
<%@page import="com.viva.dto.Epic"%>
<%@page import="com.viva.dto.BusinessValue"%>
<%@page import="com.viva.dao.util.LookUp"%>
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

<%

	String userId = String.valueOf(request.getSession().getAttribute("userId"));
	String userName = String.valueOf(request.getSession().getAttribute("userName"));
	String projectId = String.valueOf(request.getSession().getAttribute("projectId"));
	List<Epic> epics = (List<Epic>)request.getSession().getAttribute("epics");

	SprintDao sprintDao = new SprintDao();
	
	if(epics == null){
		epics =new ArrayList<Epic>();
	}
	ProjectDao projectDao = new ProjectDao();
	List<Project> projects = CacheUtil.allProjects;
	if(projects == null){
		projects = new ArrayList<Project>();
	}
	List<Sprint> sprintsByProjectId = sprintDao.getSpintsByProject(projectId);
	if(null == sprintsByProjectId){
		sprintsByProjectId = new ArrayList<Sprint>();
	}
	Sprint sprint = (Sprint)request.getSession().getAttribute("sprint");
	if(sprint == null){
		sprint = new Sprint();
	}
%>
<!DOCTYPE html>
		<!-- Epic Creation Div -->
		<div id="newEpicModalDiv" class="modal">
		  <span onclick="javascript:closeNewEpicModal()" class="close" title="Close Sprint">&times;</span>
			<form class="modal-content" name="newEpicForm" id="newEpicForm">
		    <div class="container">
		    <input type="hidden" id="createdBy" name="createdBy" value="<%=userId%>">
		      <h1 style="color:green">Add Epic</h1>
		      <p style="color:red">Please fill in the form to add the Epic</p>
		      <hr>
		      
			   <label for="projectName"><b>Project Name</b></label><label style="color: red;">&nbsp;*</label>
			   <select id="projectName" name = "projectName" >
		       <option value="0" selected="selected">--Select Project--</option>
		      <%for(Project p : projects){%>
		      		<option value="<%= p.getId()%>"><%= p.getName()%></option>
		      <%}%>
		      </select>
		      		   
		      <label for="epicName"><b>Epic Name</b></label><label style="color: red;">&nbsp;*</label>
		      <input type="text" name="epicName" id="epicName" required="required" placeholder="Epic Name">
		      		      
			   <label for="severity"><b>Epic Priority</b></label>
			     <select id="epicPriority" name = "epicPriority" required>
			      	<option value="0">--Select Priority--</option>
		      		<%for(String p:LookUp.getPriorities()){ %>
			      		<option value="<%=p%>"><%=p%></option>
			      	<%} %>
		     	 </select>
			   
			   <label for="epicBusinessValues"><b>Business Values</b></label>
		       <select id="epicBusinessValues" name = "epicBusinessValues" multiple="multiple" style="height: 100px;">
			      <%for(BusinessValue bv : CacheUtil.allBusinessValues){%>
			      		<option value="<%= bv.getId()%>"><%= bv.getName()%></option>
			      <%}%>
		      </select>

		      <label for="description"><b>Epic Description</b></label><label style="color: red;">&nbsp;*</label>
		      <textarea rows="4" cols="50" placeholder="Description" name="description" id="description" style="height: 100px;">
		      </textarea>
		      
		      <div class="clearfix">
		        <button type="button" onclick="javascript:closeNewEpicModal()" class="cancelbtn">Cancel</button>
		        <button type="button" class="signupbtn" onclick="createEpic()">Save</button>
		      </div>
		    </div>
		  </form>
		  </div>
		<!-- Epic Creation Div ended -->
		
<script>
	(function($) {
	    $(function() {
	    	$('#epicBusinessValues').removeAttr('style');
	        window.fs_test = $('.test').fSelect();
	    });
	})(jQuery);
</script>

<script type="text/javascript">
function openNewEpicModal(){
	document.getElementById('newEpicModalDiv').style.display='block';
	 $("#projectName").val("<%=sprint.getProjectId()%>");
	 console.log("Project name " + <%=sprint.getProjectId()%>);
}
function closeNewEpicModal(){
	document.getElementById('newEpicModalDiv').style.display='none';
}
	
$(document).ready(function() {
	$("#description").val("");
});
</script>
<script type="text/javascript">
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
	closeNewEpicModal();
}
</script>
<script type="text/javascript">

$("#projectName").change(
		function() {
			console.log("projectName change event got called");
			var projectId= $("#projectName").val();
			console.log("Project id : " + projectId);
		});
</script>

