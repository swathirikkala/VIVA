<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6 lt8"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7 lt8"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8 lt8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<html lang="en" class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="UTF-8" />
        
<%

%>
        <!-- <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">  -->
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
                    <!-- hidden anchor to stop jump http://www.css3create.com/Astuce-Empecher-le-scroll-avec-l-utilisation-de-target#wrap4  -->
                    <a class="hiddenanchor" id="toregister"></a>
                    <a class="hiddenanchor" id="tologin"></a>
                    <div id="wrapper">
                        <div id="login" class="animate form">
                            <form  action="./userLogin" autocomplete="on" method="post"> 
                                <h1>Log in</h1> 
                                <p> 
                                    <label for="username" class="uname" data-icon="u" > Email Id </label><label style="color: red;">&nbsp;*</label>
                                    <input type="email" id="loginEmailId" name="loginEmailId" placeholder="Email ID" required="required"/>
                                </p>
                                <p> 
                                    <label for="password" class="youpasswd" data-icon="p"> Password </label><label style="color: red;">&nbsp;*</label>
                                    <input type="password" id="loginPassword" name="loginPassword" placeholder="Password" required="required"/> 
                                </p>
                                <p class="login button"> 
                                    <input type="submit" value="Login" /> 
								</p>
                                <p class="change_link">
									Not a member yet ?
									<a href="#toregister" class="to_register">Register</a>
								</p>
                            </form>
                        </div>

                        <div id="register" class="animate form" >
                            <form  action="./userRegistration" autocomplete="on" method="post"> 
                                <h1> Sign up </h1> 
                                <p> 
                                    <label for="usernamesignup" class="uname" data-icon="u">First Name</label><label style="color: red;">&nbsp;*</label>
                                    <input type="text" id="firstName" name="firstName" placeholder="First Name" required="required"/>
                                </p>
                                <p> 
                                    <label for="usernamesignup" class="uname" data-icon="u">Last Name</label><label style="color: red;">&nbsp;*</label>
                                    <input type="text" id="lastName" name="lastName" placeholder="First Name" required="required"/>
                                </p>
                                <p> 
                                    <label for="usernamesignup" class="uname" data-icon="u">DOB</label><label style="color: red;">&nbsp;*</label>
                                    <td><input type="date" id="dob" name="dob" placeholder="Date Of Birth" required="required"/>
                                </p>
                                <p> 
                                    <label for="emailsignup" class="youmail" data-icon="e" >Email Id</label><label style="color: red;">&nbsp;*</label>
                                    <input type="email" id="emailId" name="emailId" placeholder="Email ID" required="required"/>
                                </p>
                                <p> 
                                    <label for="usernamesignup" class="uname" data-icon="u">Department</label><label style="color: red;">&nbsp;*</label>
                                    <input type="text" id="department" name="department" placeholder="Department" required="required"/>
                                </p>
                                <p> 
                                    <label for="usernamesignup" class="uname" data-icon="u">Designation</label><label style="color: red;">&nbsp;*</label>
                                    <input type="text" id="designation" name="designation" placeholder="Designation" required="required"/>
                                </p>
                                <p> 
                                    <label for="passwordsignup" class="youpasswd" data-icon="p">password </label><label style="color: red;">&nbsp;*</label>
                                    <input type="password" id="password" name="password" placeholder="Password" required="required"/>
                                </p>
                                <p> 
                                    <label for="usernamesignup" class="uname" data-icon="u">Security Question</label><label style="color: red;">&nbsp;*</label>
                                    <input type="text" id="securityQuestion" name="securityQuestion" placeholder="Security Question" required="required"/>
                                </p>
                                <p> 
                                    <label for="usernamesignup" class="uname" data-icon="u">Security Answer</label><label style="color: red;">&nbsp;*</label>
                                    <input type="text" id="securityAnswer" name="securityAnswer" placeholder="Security Answer" required="required"/>
                                </p>
                                <p class="signin button"> 
									<input type="submit" value="Sign up"/> 
								</p>
                                <p class="change_link">  
									Already a member ?
									<a href="#tologin" class="to_register"> Go and log in </a>
								</p>
                            </form>
                        </div>
						
                    </div>
                </div>  
            </section>
        </div>
    </body>
</html>