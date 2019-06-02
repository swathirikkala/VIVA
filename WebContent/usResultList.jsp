<%@page import="com.viva.dao.UserStoryDao"%>
<%@page import="com.viva.dto.UserStory"%>
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

<%
	UserStoryDao userStoryDao = new UserStoryDao();
	

	String userId = String.valueOf(request.getSession().getAttribute("userId"));
	String userName = String.valueOf(request.getSession().getAttribute("userName"));
	
	List<UserStory>  uss = userStoryDao.getAllUserStories();
	if(null == uss){
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
	</head>
	<body>
			
		<!-- User stories Table -->
			<div class="limiter">
				<div class="table100 ver2 m-b-110" style="overflow:scroll; max-height:500px; min-height:0px; overflow-x: none;">
					<table data-vertable="ver2">
						<thead>
							<tr class="row100 head">
								<th class="column100 width50" data-column="column1">US ID</th>
								<th class="column100 width100" data-column="column2">US Name</th>
								<th class="column100 width75" data-column="column1">Start Date</th>
								<th class="column100 width75" data-column="column1">End Date</th>
								<th class="column100 width50" data-column="column1">Severity</th>
								<th class="column100 width50" data-column="column6">Status</th>
								<th class="column100 width100" data-column="column7">Created By</th>
								<th class="column100 width100" data-column="column7">VIVA %</th>
								<th class="column100 width100" data-column="column7">Actions</th>
							</tr>
						</thead>
						<tbody id="projectsBody">
							<%for(UserStory us: uss) {%>
								<tr class="row100 head">
									<td class="column100 width50" data-column="column1">US<%= us.getId()%></td>
									<td class="column100 width100" data-column="column2"><%=us.getName() %></td>
									<td class="column100 width50" data-column="column1"><%= us.getStartDate()%></td>
									<td class="column100 width75" data-column="column1"><%= us.getEndDate()%></td>
									<td class="column100 width75" data-column="column1"><%= us.getPrioroty()%></td>
									<td class="column100 width50" data-column="column6"><%= us.getPrioroty()%></td>
									<td class="column100 width100" data-column="column7"><%= us.getManager()%></td>
									<td class="column100 width50" data-column="column6"></td>
									<td class="column100 width100" data-column="column7">
										<a href="#">view</a>&nbsp;
										<a href="#">edit</a>
									</td>
								</tr>
							<%} %>
						</tbody>
					</table>
				</div>
			</div>
		<!-- Projects Table ended -->
		
	</body>