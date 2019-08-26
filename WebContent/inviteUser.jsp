
<%@page import="com.viva.db.util.CacheUtil"%>
<%@page import="com.viva.dto.Project"%>
<%@page import="com.viva.dto.Department"%>
<%@page import="com.viva.dto.Team"%>
<%@page import="com.viva.dao.DepartmentDao"%>
<%@page import="com.viva.dao.TeamDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%
	TeamDao teamDao = new TeamDao();
	DepartmentDao departmentDao = new DepartmentDao();
	String userId = String.valueOf(request.getSession().getAttribute("userId"));
	String userName = String.valueOf(request.getSession().getAttribute("userName"));
// 	List<Team> teams = teamDao.getAllTeams();
// 	List<Department> departments = departmentDao.getAllDepartments();
	List<Project> allProjects = CacheUtil.allProjects;
	if(allProjects == null){
		allProjects = new ArrayList<Project>();
	}
%>
<!DOCTYPE html>
<html>
	<head>
	<script type="text/javascript">
	var isValidEmailId = false;
		$(document).ready(function() {
			var uname = '<%=userName%>';
			console.log("user name : " + uname);
			if("null" === uname ){
				alert("Session expired please login again.");
				window.location="index.jsp";
			}
		});
		function validateEmail($email) {
			console.log("Email Validator got called : " + $email);
			  var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
			  return emailReg.test( $email );
		}
		$("#userEmailId").blur(function(){
			if(validateEmail($("#userEmailId").val())){
				isValidEmailId = true;
				console.log("proper email id");
			}else{
				isValidEmailId = false;
				alert("Please enter proper formated emailid.");
			}
		});

	</script>
	</head>
	<body>
<!-- User invite Div start-->
		<div id="userInviteModalDiv" class="modal">
		  <span onclick="javascript:closeUserInvitePopup()" class="close" title="Close Sprint">&times;</span>
			<form class="modal-content" name="userInviteForm" id="userInviteForm">
		    <div class="container">
		      <h1 style="color:green">Invite User</h1>
		      <p style="color:red">Please fill in the form to invite the User</p>
		      <hr>
		      
			   <label for="userEmailId"><b>User Email Id</b></label>
		       <input type="text" id="userEmailId" name="userEmailId" required="required">
		      
<!-- 		      <label for="teamId"><b>Team Name</b></label><label style="color: red;">&nbsp;*</label> -->
<!-- 		      <select id="teamId" name = "teamId" > -->
<!-- 		       <option value="0" selected="selected">--Select Team--</option> -->
<%-- 		      <%for(Team t : teams){%> --%>
<%-- 		      		<option value="<%= t.getTeamId()%>"><%= t.getTeamName()%></option> --%>
<%-- 		      <%}%> --%>
<!-- 		      </select> -->
		      
			   <label for="projectName"><b>Project Name</b></label><label style="color: red;">&nbsp;*</label>
			   <select id="projectName" name = "projectName" required>
				   <option value="0">--Select Project--</option>
			      	<%for(Project prj : allProjects){%>
			      	<option value="<%= prj.getId()%>"><%= prj.getName()%></option>
			      	<%}%>
		      </select>
		      		   
		     
		     <label for="departmentId"><b>Department Name</b></label><label style="color: red;">&nbsp;*</label>
<!-- 			     <select id="departmentId" name = "departmentId" required> -->
<!-- 		      		<option value="0">--Select Department--</option> -->
<!-- 			   		<option value="Product">Product</option> -->
<!-- 			   		<option value="Development">Development</option> -->
<!-- 			   		<option value="Project manager">Project manager</option> -->
<!-- 			   		<option value="Testing">Testing</option> -->
		      		
<!-- 		     	 </select> -->
				<input type="text" id="departmentId" name = "departmentId" placeholder="department name" required/>
		      
			   <label for="designation"><b>Designation</b></label>
			   <select id="designation" name="designation">
			   		<option value="0">--Select Designation--</option>
			   		<option value="Project Owner">Project Owner</option>
			   		<option value="Tester">Tester</option>
			   		<option value="Architect">Architect</option>
			   		<option value="Business analyst">Business analyst</option>
			   		<option value="Agile manager">Agile manager</option>
			   		<option value="Developer">Developer</option>
			   		<option value="Operations manager">Operations manager</option>
			   		<option value="Project Manager">Project Manager</option>
			   </select>
		      <div class="clearfix">
		        <button type="button" onclick="javascript:closeUserInvitePopup()" class="cancelbtn">Cancel</button>
		        <button type="submit" class="signupbtn" onclick="inviteUser()">Invite</button>
		      </div>
		    </div>
		  </form>
		</div>
		<!-- User invite Div ended -->
	<script type="text/javascript">

	</script>
	<script type="text/javascript">
		function openUserInvitePopup(){
			console.log("openUserInvitePopup got called");
			closeUserInvitePopup();
			document.getElementById('userInviteModalDiv').style.display='block';
		}
		function closeUserInvitePopup(){
			clearUserInviteForm();
			console.log("closeUserInvitePopup got called");
			document.getElementById('userInviteModalDiv').style.display='none';
		}
		
		function clearUserInviteForm(){
			$("#userEmailId").val("");
			$("#teamId").val("0");
			$("#departmentId").val("");
		}
	</script>
	<script type="text/javascript">
		function validateUserInviteForm(){
			console.log("validateUserInviteForm got called .....");
			var errorMessage = "";
			var isValid = true;
			if(validateEmail($("#userEmailId").val()) == false){
				isValid = false;
				errorMessage += "\r\n Please fill proper formatted email id";
			}
			if($("#projectName").val() === "0"){
				isValid = false;
				errorMessage += "\r\n Please Select Project Name";
			}
			if($("#departmentId").val() === ""){
				isValid = false;
				errorMessage += "\r\n Please Select Department Name";
			}
			if($("#designation").val() == "0"){
				isValid = false;
				errorMessage += "\r\n Please Select Designation Name";
			}
			if(isValid == false){
				alert(errorMessage);
			}
			return isValid;
		}
	
    	function inviteUser() {
			console.log("inviteUser got called ....");
			var userInviteFormData = $("form[name=userInviteForm]").serialize();
			console.log("userInviteFormData : "+userInviteFormData);
			var isValidForm = validateUserInviteForm();
			console.log("validateUserInviteForm : " + isValidForm);
			if(isValidForm == true){
				$.ajax({
	                type: 'post',
	                url: './inviteUser',
	                data: userInviteFormData,
	                success: function (response) {
	                   console.log("inviteUser call completed..... " + response);
	                   if(response === "success"){
	                	   alert("User Invite Completed");
	                   }else{
	                	   alert("User Invite Failed");
	                   }
	                },
					error : function(data, status, er) {
						console.log("Error in inviteUser jsm : " + data + " status: " + status + " er:" + er);
					
					}
	            });

				closeUserInvitePopup();
			}else{
				console.log("Invalid form");
			}
	}
	</script>

</body>
</html>