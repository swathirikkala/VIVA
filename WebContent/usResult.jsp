<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.viva.dto.UserStory"%>
<%@page import="com.viva.dto.Epic"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>


<%

	List<UserStory> uss = (List<UserStory>) request.getSession().getAttribute("userStories");
	if(uss == null){
		uss = new ArrayList<UserStory>();
	}

%>


<html>
	<head>
		<!-- Table css -->
	
		<!--===============================================================================================-->	
			<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
		<!--===============================================================================================-->
			<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
		<!--===============================================================================================-->
			<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
		<!--===============================================================================================-->
			<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
		<!--===============================================================================================-->
			<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
		<!--===============================================================================================-->
			<link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
		<!--===============================================================================================-->
			<link rel="stylesheet" type="text/css" href="css/util.css">
			<link rel="stylesheet" type="text/css" href="css/main.css">
		<!--===============================================================================================-->
			<link rel="stylesheet" type="text/css" href="css/modal.css">
		
		<!-- Table css end -->
		<!-- Table JS -->
		<!--===============================================================================================-->	
			<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
		<!--===============================================================================================-->
			<script src="vendor/bootstrap/js/popper.js"></script>
			<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
		<!--===============================================================================================-->
			<script src="vendor/select2/select2.min.js"></script>
		<!--===============================================================================================-->
			<script src="js/main.js"></script>
	        <script src="js/jquery-3.4.0.min.js"></script>
	        
	<!-- Table JS end -->
		<style type="text/css">
			.width50{
				width: 50px;
			}
			.width75{
				width: 75px;
			}
			.width100{
				width: 100px;
			}
		</style>
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
		<script type="text/javascript">
		function loadUserStory(userStoryId) {
			console.log("loadUserStory( got called");
				$.ajax({
	                type: 'post',
	                url: './loadUserStory',
	                data: {userStoryId:userStoryId},
	                success: function (response) {
	                   console.log("loadUserStory call completed..... " + response);
	                   if(response === "success"){
	                	   
	                	   console.log("loadUserStory loading Success");
	                	   loadPage('commonDiv','./usHome.jsp');
	                	   
	                   }else{
	                	   console.log("loadUserStory creation "+response);
	                   }
	                },
					error : function(data, status, er) {
						console.log("Error in loadUserStory jsm : " + data + " status: " + status + " er:" + er);
					}
	            });
		}
		</script>
	</head>
	<body>
		<p>
			<button onclick="openUSModal()" style="width: auto;">Add User Story</button>
		</p>

		<!-- User Story Table -->
			<div class="limiter">
				<div class="table100 ver2 m-b-110" style="overflow:scroll; max-height:500px; min-height:0px; overflow-x: none;">
					<table data-vertable="ver2">
						<thead>
							<tr class="row100 head">
								<th class="column100 width50" data-column="column1">User Story ID</th>
								<th class="column100 width100" data-column="column2">User Story Name</th>
								<th class="column100 width50" data-column="column6">Status</th>
								<th class="column100 width100" data-column="column7">BV%</th>
							</tr>
						</thead>
						<tbody id="projectsBody">
							<% for(UserStory us : uss){ %>
								<tr class="row100 head">
									<td class="column100 width50" data-column="column1">
									<a href="javascript:void(0)" onclick="loadUserStory('<%=us.getId()%>');">US<%=us.getId()%></a>
									</td>
									<td class="column100 width100" data-column="column2"><%=us.getName()%></td>
									<td class="column100 width75" data-column="column1"><%= us.getStatus()%></td>
									<td class="column100 width50" data-column="column6"><%=us.getViva()%>%</td>
								</tr>
							<%} %>
						</tbody>
					</table>
				</div>
			</div>
		<!-- User Story Creation Div started-->
			<jsp:include page="newUS.jsp"/>
		<!-- User Story Creation Div ended -->

</body>