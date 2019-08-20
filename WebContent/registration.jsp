<%@page import="com.viva.db.util.CacheUtil"%>
<%@page import="com.viva.dao.util.LookUp"%>
<%@page import="com.viva.dto.Department"%>
<%@page import="com.viva.dao.DepartmentDao"%>
<%@page import="com.viva.dto.Team"%>
<%@page import="java.util.List"%>
<%@page import="com.viva.dao.TeamDao"%>
<%@page import="com.viva.dto.InvitedUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	InvitedUser  invitedUser = (InvitedUser)request.getAttribute("invitedUser");
 	DepartmentDao departmentDao = new DepartmentDao();
 	List<Department> departments = departmentDao.getAllDepartments();
 	
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VIVA</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <meta name="description" />
        <meta name="keywords" content="html5, css3, form, switch, animation, :target, pseudo-class" />
        <meta name="author" content="Codrops" />
        <link rel="stylesheet" type="text/css" href="css/demo.css" />
        <link rel="stylesheet" type="text/css" href="css/style3.css" />
		<link rel="stylesheet" type="text/css" href="css/animate-custom.css" />
        <script src="./js/jquery-3.4.0.min.js"></script>
        <script src="./js/user.js"></script>
        
<script type="text/javascript">
	$(document).ready(function() {
		console.log("user details : " + <%=invitedUser%>);
		if(null == <%=invitedUser%>){
			alert("token expired please request again.");
			window.location = "./index.jsp";
		}
	});
</script>        
</head>
<body>
	        <div class="container">
            <!-- Codrops top bar -->
            <div class="codrops-top">
                       
                <span class="right">
                   
                </span>
                <div class="clr"></div>
            </div><!--/ Codrops top bar -->
            <header>
                <h1>Welcome to <span>VIVA</span></h1>
				<nav class="codrops-demos">
					
				</nav>
            </header>
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
                                    <label for="team" class="uname" data-icon="u">Project Name</label><label style="color: red;">&nbsp;*</label>
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
                                    <select id="securityQuestion" name="securityQuestion" required="required" style="height: 50px;width: 103%;">
                                    	<option value="">--Select Security Question--</option>
                                    	<option value="What was your childhood nickname?">What was your childhood nickname?</option>
                                    	<option value="In what city did you meet your spouse/significant other?">In what city did you meet your spouse/significant other?</option>
                                    	<option value="What is the name of your favorite childhood friend?">What is the name of your favorite childhood friend?</option>
                                    	<option value="What street did you live on in third grade?">What street did you live on in third grade?</option>
                                    	<option value="What is your oldest sibling’s birthday month and year? (e.g., January 1900)">What is your oldest sibling’s birthday month and year? (e.g., January 1900)</option>
                                    	<option value="What is the middle name of your youngest child?">What is the middle name of your youngest child?</option>
                                    	<option value="What is your oldest sibling's middle name?">What is your oldest sibling's middle name?</option>
                                    	<option value="What school did you attend for sixth grade?">What school did you attend for sixth grade?</option>
                                    	<option value="What was your childhood phone number including area code?"></option>
                                    
                                    </select>
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
        </div>
</body>
</html>