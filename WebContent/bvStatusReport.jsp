<%@page import="com.viva.dto.BvStatusReport"%>
<%@page import="com.viva.dto.Sprint"%>
<%@page import="com.viva.dto.Project"%>
<%@page import="com.viva.db.util.CacheUtil"%>
<%@page import="com.viva.dao.util.LookUp"%>
<%@page import="com.viva.dto.UsBv"%>
<%@page import="com.viva.dto.BusinessValue"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.viva.dto.UserStory"%>
<%@page import="com.viva.dto.Epic"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>


<%
	List<BvStatusReport> businessValuesStatusReport = (List<BvStatusReport>)request.getSession().getAttribute("businessValuesStatusReport");
	if(businessValuesStatusReport == null){
		businessValuesStatusReport = new ArrayList<BvStatusReport>();
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
		
	</head>
	<body>

		<!-- User Story Table -->
		<label class="w3-xxxlarge" style="color: green;">Business Value Status Report</label>
			<div class="limiter" style="width: 150%;">
				<div class="table100 ver2 m-b-110" style="overflow:scroll; max-height:500px; min-height:0px; overflow-x: none;">
					<table data-vertable="ver2">
						<thead>
							<tr class="row100 head">
								<th class="column100 width50" data-column="column1">S.No</th>
								<th class="column100 width100" data-column="column2">BV</th>
								<th class="column100 width100" data-column="column7">BV Achieved %</th>
								<th class="column100 width50" data-column="column6">Project</th>
								<th class="column100 width100" data-column="column2">Sprint</th>
								<th class="column100 width50" data-column="column6">Epic</th>
								<th class="column100 width100" data-column="column7">User Story</th>
							</tr>
						</thead>
						<tbody id="projectsBody">
							<% int i=1;
								for(BvStatusReport bvsr : businessValuesStatusReport){ %>
								<tr class="row100 head">
									<td class="column100 width100" data-column="column2"><%= i++ %></td>
									<td class="column100 width75" data-column="column1"><%=bvsr.getBvName() %></td>
									<td class="column100 width50" data-column="column6"><%=bvsr.getViva() %> %</td>
									<td class="column100 width100" data-column="column2"><%=bvsr.getProjectName() %></td>
									<td class="column100 width75" data-column="column1"><%= bvsr.getSprintName() %></td>
									<td class="column100 width50" data-column="column6"><%=bvsr.getEpicName() %></td>
									<td class="column100 width50" data-column="column6"><%=bvsr.getUserStoryName()%></td>
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