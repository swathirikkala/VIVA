<%@page import="com.viva.db.util.CacheUtil"%>
<%@page import="com.viva.dao.ProjectDao"%>
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
	List<Project> allProjects = CacheUtil.allProjects;
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
	<head>
	<script type="text/javascript">
		
	$("#sprintStartDate")
	.change(
			function() {
				if ($("#sprintStartDate").val() !== "") {
					if (Date.parse($("#sprintStartDate").val()) > Date
							.parse($("#sprintEndDate").val())) {
						alert('Sprint Start Date should not greater than End Date.');
						$("#sprintStartDate").val("");
					}
				}
			});


	$("#sprintEndDate")
	.change(
			function() {
				if ($("#sprintEndDate").val() !== "") {
					if (Date.parse($("#sprintStartDate").val()) > Date
							.parse($("#sprintEndDate").val())) {
						alert('Sprint End Date should not lesser than Start Date.');
						$("#sprintEndDate").val("");
					}
				}
			});
	
	</script>
	<script type="text/javascript">
	    $(document).ready(function() {
	    	console.log("project id in new sprint creation : " + '<%=project.getId()%>');
	    	$("#projectName").val("<%=project.getId()%>");
	    	$("#sprintDescription").val("");
	      });
	</script>
	
	<script type="text/javascript">
		function openSprintModal(){
			  closeSprintModal();
			  console.log("new Sprint creation open modal got called ....");
			  document.getElementById('newSprintModalDiv').style.display='block';
		}
		function closeSprintModal(){
			  document.getElementById('newSprintModalDiv').style.display='none';
		}
	</script>
	<script type="text/javascript">
		function validateSprintForm() {
			console.log("Sprint Validation got called .....");
			var errorMessage = "";
			var isValid = true;
			
			if($("#projectName").val() == "0"){
				errorMessage += "\r\n Please Select Project Name";
				isValid = false;
			}
			if($("#sprintName").val() == ""){
				errorMessage += "\r\n Please Give Sprint Name";
				isValid = false;
			}
			if($("#sprintStartDate").val() == ""){
				errorMessage += "\r\n Please Select Sprint Start Date";
				isValid = false;
			}
			if($("#sprintEndDate").val() == ""){
				errorMessage += "\r\n Please Select Sprint End Name";
				isValid = false;
			}
			if($("#sprintDescription").val() == ""){
				errorMessage += "\r\n Please Give Sprint Description";
				isValid = false;
			}
			console.log("validateSprintForm error message : " + errorMessage);
			if(isValid == false){
				alert(errorMessage);
			}
			return isValid;
		}
	</script>

	<script type="text/javascript">
		function createSprint() {
			console.log("createSprint got called");
			console.log($("form[name=newSprintForm]").serialize());
			console.log("Sprint Validation got called .....");
			
			var isValidSprintForm = validateSprintForm();
			console.log("isValidSprintForm : " + isValidSprintForm);
			
			if(isValidSprintForm == false){
				console.log("Form validation : ");
			}else{
				$.ajax({
					type: 'post',
					url: './addSprint',
					data: $("form[name=newSprintForm]").serialize(),
					success: function (response) {
							console.log("Sprint creation call completed..... " + response);
							if(response == "exist") {
								alert("Sprint name duplicate in this project");
							}else{
								alert("Sprint Creation " + response);
							}
							closeSprintModal();
		                },
						error : function(data, status, er) {
							console.log("Error in create new Sprint jsm : " + data + " status: " + status + " er:" + er);
						}
		            });
					closeSprintModal();
				}
		}
	</script>
	</head>
	<body>
		<div id="newSprintModalDiv" class="modal">
		  <span onclick="javascript:closeSprintModal()" class="close" title="Close Sprint">&times;</span>
			<form id="newSprintForm" name="newSprintForm" class="modal-content">
		    <div class="container">
		      <h1 style="color:green">Add Sprint</h1>
		      <p style="color:red">Please fill in the form to add the Sprint</p>
		      <hr>
		      
			   <label for="projectName"><b>Project Name</b></label><label style="color: red;">&nbsp;*</label>
			   <select id="projectName" name = "projectName" required>
				   <option value="0">--Select Project--</option>
			      	<%for(Project prj : allProjects){%>
			      	<option value="<%= prj.getId()%>"><%= prj.getName()%></option>
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
		</body>
	</html>


