<%@page import="com.viva.dto.InvitedUser"%>
<%@page import="com.viva.dto.Department"%>
<%@page import="com.viva.dto.Team"%>
<%@page import="com.viva.dao.DepartmentDao"%>
<%@page import="com.viva.dao.TeamDao"%>
<%@page import="com.viva.db.util.CacheUtil"%>
<%@page import="com.viva.dto.User"%>
<%@page import="com.viva.dao.UserDao"%>
<%@page import="com.viva.dao.ProjectDao"%>
<%@page import="com.viva.dao.util.LookUp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.viva.dto.Project"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
		String userName = String.valueOf(request.getSession().getAttribute("userName"));
	    if(userName == null){
	    	userName = "";
	    }
	    List<User> users = CacheUtil.allUsers;
	    InvitedUser  invitedUser = (InvitedUser)request.getAttribute("invitedUser");
	 	TeamDao teamDao = new TeamDao();
	 	List<Team> teams = teamDao.getAllTeams();
	 	DepartmentDao departmentDao = new DepartmentDao();
	 	List<Department> departments = departmentDao.getAllDepartments();
	   
    %>
<!DOCTYPE html>
<html>
<head>
	
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
		$(document).ready(function() {
			var uname = '<%=userName%>';
			if('' === uname){
				alert("Session expired please login again.");
				window.location="./index.jsp";
			}
		});

	</script>
</head>
<body style="margin-top: 5%">
		<label class="w3-xxxlarge w3-text-red">User Profile</label>
		<label class="w3-xxxlarge" style="color: green;margin-left: 55%;">Welcome </label>
		<label class="w3-xxxlarge" style="color: blue;"><%=userName%></label>
		<hr>
		<section>				
                <div id="container_demo" >
                    <a class="hiddenanchor" id="toregister"></a>
                    <a class="hiddenanchor" id="tologin"></a>
                    <div id="wrapper">
                        <div id="login" class="animate form">
                            <form  action="./userRegistration" autocomplete="on" method="post"> 
                                <h1> Registration </h1> 
                                <p> 
                                    <label for="firstName" class="uname" data-icon="u">First Name</label><label style="color: red;">&nbsp;*</label>
                                    <input type="text" id="firstName" name="firstName" placeholder="First Name" required="required"/>
                                </p>
                                <p> 
                                    <label for="lastName" class="uname" data-icon="u">Last Name</label><label style="color: red;">&nbsp;*</label>
                                    <input type="text" id="lastName" name="lastName" placeholder="First Name" required="required"/>
                                </p>
                                <p> 
                                    <label for="dob" class="uname" data-icon="u">DOB</label><label style="color: red;">&nbsp;*</label>
                                    <input type="date" id="dob" name="dob" placeholder="Date Of Birth" required="required"/>
                                </p>
                                <p> 
                                    <label for="emailId" class="youmail" data-icon="e" >Email Id</label><label style="color: red;">&nbsp;*</label>
                                    <input type="email" id="emailId" name="emailId" placeholder="Email ID" required="required" readonly="readonly"
                                     value="<%=invitedUser.getUserMailId()%>"/>
                                </p>
                                <p> 
                                    <label for="team" class="uname" data-icon="u">Project</label><label style="color: red;">&nbsp;*</label>
                                    <input type="hidden" id="projectId" name="projectId" required="required"  value="<%=invitedUser.getProject()%>"/>
                                    <input type="text" id="projectName" name="projectName" placeholder="Project Name" required="required"   readonly="readonly"
                                    value="<%=LookUp.getProjectName(invitedUser.getProject(), CacheUtil.allProjects)%>"/>
                                </p>
                                <p> 
                                    <label for="departmentName" class="uname" data-icon="u">Department</label><label style="color: red;">&nbsp;*</label>
                                    <input type="hidden" id="department" name="department" placeholder="Department" required="required"  value="<%=invitedUser.getDepartment()%>"/>
                                    <input type="text" id="departmentName" name="departmentName" placeholder="Department" required="required"  readonly="readonly"
                                    value="<%=invitedUser.getDepartment()%>"/>
                                </p>
                                <p> 
                                    <label for="designation" class="uname" data-icon="u">Designation</label><label style="color: red;">&nbsp;*</label>
                                    <input type="text" id="designation" name="designation" placeholder="Designation" required="required" readonly="readonly"
                                     value="<%=invitedUser.getDesignation()%>"/>
                                </p>
                                <p> 
                                    <label for="password" class="youpasswd" data-icon="p">password </label><label style="color: red;">&nbsp;*</label>
                                    <input type="password" id="password" name="password" placeholder="Password" required="required"/>
                                </p>
                                <p> 
                                    <label for="securityQuestion" class="uname" data-icon="u">Security Question</label><label style="color: red;">&nbsp;*</label>
                                    <input type="text" id="securityQuestion" name="securityQuestion" placeholder="Security Question" required="required"/>
                                </p>
                                <p> 
                                    <label for="securityAnswer" class="uname" data-icon="u">Security Answer</label><label style="color: red;">&nbsp;*</label>
                                    <input type="text" id="securityAnswer" name="securityAnswer" placeholder="Security Answer" required="required"/>
                                </p>
                                <p class="signin button"> 
									<input type="submit" value="Sign up" /> 
								</p>
                            </form>
                        </div>
						
                    </div>
                </div>  
            </section>
</body>
</html>