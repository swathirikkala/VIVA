<%@page import="com.viva.dao.util.LookUp"%>
<%@page import="com.viva.dto.Sprint"%>
<%@page import="com.viva.dto.Project"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.viva.dto.User"%>
<%@page import="java.util.List"%>

<%
	String userId = String.valueOf(request.getSession().getAttribute("userId"));
	List<Project> allProjects = (List<Project>)request.getSession().getAttribute("allProjects");
	if(allProjects == null){
		allProjects = new ArrayList<Project>();
	}
	Project project = (Project)request.getSession().getAttribute("project");
	if(project == null){
		project = new Project();
	}
%>
<!DOCTYPE html>
<html>
		<div id="newSprintmodalDiv" class="modal">
		  <span onclick="javascript:closeSprintModal()" class="close" title="Close Sprint">&times;</span>
			<form id="newSprintForm" name="newSprintForm" class="modal-content">
		    <div class="container">
		      <h1 style="color:green">Add Sprint</h1>
		      <p style="color:red">Please fill in the form to add the Sprint</p>
		      <hr>
		      
			   <label for="projectName"><b>Project Name</b></label><label style="color: red;">&nbsp;*</label>
			   <select id="projectName" name = "projectName" required>
		      <%for(Project p : allProjects){%>
		      		<option value="<%= p.getId()%>"><%= p.getName()%></option>
		      <%}%>
		      </select>
		      		   
		      <label for="sprintName"><b>Sprint Name</b></label><label style="color: red;">&nbsp;*</label>
		      <input type="text" id="sprintName" name = "sprintName" required placeholder="Sprint Name">
		      		      
			   <label for="projectSeverity"><b>Sprint Priority</b></label>
			   
			     <select id="sprintSeverity" name = "sprintSeverity">
		      		<option value="0">--Select--</option>
		      		<%for(String p:LookUp.getPriorities()){ %>
			      		<option value="<%=p%>"><%=p%></option>
			      	<%} %>
		     	 </select>
		     	 
			   <label for="sprintStartDate"><b>Sprint Start Date</b></label><label style="color: red;">&nbsp;*</label>
			   <input type="date" placeholder="Sprint Start Date" name="sprintStartDate" id="sprintStartDate" required>
			   
			   <label for="sprintEndDate"><b>Sprint End Date</b></label><label style="color: red;">&nbsp;*</label>
			   <input type="date" placeholder="Sprint End Date" name="sprintEndDate" id="sprintEndDate" required>
			   
			   <input type="hidden" placeholder="Created By" name="createdBy" id="createdBy" required value="<%= userId %>">
		      <label for="projectDescription"><b>Sprint Description</b></label><label style="color: red;">&nbsp;*</label>
		      <textarea rows="4" cols="50" placeholder="Sprint Description" name="sprintDescription" id="sprintDescription" style="height: 100px;">
		      </textarea>
		      
		      <div class="clearfix">
		        <button type="button" onclick="javascript:closeSprintModal()" class="cancelbtn">Cancel</button>
		        <button type="button" class="signupbtn" onclick="createSprint()">Save</button>
		      </div>
		    </div>
		  </form>
		</div>
		
	<script type="text/javascript">
	    $(document).ready(function() {
	    	//alert("Create new sprint got called");
	    	$("#projectName").val("<%=project.getId()%>");
	    	$("#sprintDescription").val("");
	    	
	      });
	
	</script>
	
	<script type="text/javascript">
		function openSprintModal(){
			console.log("new Sprint creation open modal got called ....");
			  document.getElementById('newSprintmodalDiv').style.display='block';
			}
		function closeSprintModal(){
			  document.getElementById('newSprintmodalDiv').style.display='none';
			}
	</script>

		<script type="text/javascript">
			function createSprint() {
				console.log("createSprint got called");
				console.log($("form[name=newSprintForm]").serialize());
	          
					$.ajax({
		                type: 'post',
		                url: './addSprint',
		                data: $("form[name=newSprintForm]").serialize(),
		                success: function (response) {
		                   console.log("Sprint creation call completed..... " + response);
		                   if(response === "success"){
		                	   alert("Sprint creation Success");
		                	   
		                	   loadPage('projectDiv','projectEdit.jsp')
		                   }else{
		                	   alert("Sprint creation Failed");
		                   }
		                },
						error : function(data, status, er) {
							console.log("Error in create new Sprint jsm : " + data + " status: " + status + " er:" + er);
						
						}
		            });
					 closePopup();
			}
		</script>
	</html>


