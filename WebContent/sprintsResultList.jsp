<%@page import="com.viva.dao.SprintDao"%>
<%@page import="com.viva.dto.Sprint"%>
<%@page import="com.viva.dto.Project"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@page import="java.util.ArrayList"%>
<%@page import="com.viva.dto.User"%>
<%@page import="java.util.List"%>
<%@page import="com.viva.dao.Response"%>

<%
	List<Sprint> sprints = (List<Sprint>)request.getSession().getAttribute("sprints");	
	if(sprints == null){
		sprints = new ArrayList<Sprint>();
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
		<script type="text/javascript">
			function loadSprint() {
				console.log("loadSprint Loading");
			}
		</script>
		<script type="text/javascript">
			function openModal(){
				console.log("newSprint Open modal got called");
				$("#addSprintDiv").load("./newSprint.jsp");
			}
		</script>
	</head>
	<body>
		<p>
			<button onclick="openModal();" style="width: auto;">Create New Sprint</button>
		</p>
		<div id="addSprintDiv"></div>
		<!-- Projects Table -->
			<div class="limiter">
				<div class="table100 ver2 m-b-110" style="overflow:scroll; max-height:500px; min-height:0px; overflow-x: none;">
					<table data-vertable="ver2">
						<thead>
							<tr class="row100 head">
								<th class="column100 width50" data-column="column1">Sprint ID</th>
								<th class="column100 width100" data-column="column2">Sprint Name</th>
								<th class="column100 width75" data-column="column1">Start Date</th>
								<th class="column100 width75" data-column="column1">End Date</th>
								<th class="column100 width50" data-column="column6">Status</th>
								<th class="column100 width100" data-column="column7">VIVA %</th>
								<th class="column100 width100" data-column="column7">Created By</th>
							</tr>
						</thead>
						<tbody id="projectsBody">
							<% for(Sprint s : sprints){ %>
								<tr class="row100 head">
									<td class="column100 width50" data-column="column1">
									<a href="javascript:void(0)" onclick="loadSprint('<%=s.getSprintId()%>');">SP<%=s.getSprintId()%></a>
									</td>
									<td class="column100 width100" data-column="column2"><%=s.getSprintName() %></td>
									<td class="column100 width50" data-column="column1"><%=s.getStartDate() %></td>
									<td class="column100 width75" data-column="column1"><%=s.getEndDate() %></td>
									<td class="column100 width75" data-column="column1"><%=s.getSeverity() %></td>
									<td class="column100 width50" data-column="column6"><%=s.getSeverity() %></td>
									<td class="column100 width100" data-column="column7"><%=s.getCreatedBy() %></td>
								</tr>
							<%} %>
						</tbody>
					</table>
				</div>
			</div>
		<!-- Projects Table ended -->
		
	</body>