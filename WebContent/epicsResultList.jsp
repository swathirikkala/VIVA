<%@page import="com.viva.dto.BusinessValue"%>
<%@page import="com.viva.dao.util.LookUp"%>
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

<%@page import="com.viva.dao.SprintDao"%>
<%@page import="com.viva.dao.ProjectDao"%>
<%@page import="com.viva.dao.UserDao"%>

<%
	List<Epic> epics = (List<Epic>)request.getSession().getAttribute("epics");
	if(epics == null){
		epics =new ArrayList<Epic>();
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
		    $(document).ready(function() {
		    	
		      });
	
	</script>
	</head>
	<body>
	
	<div style="margin-top: 50px;">
		<button onclick="openNewEpicModal()" style="width: auto;">New Epic</button>
		
		<!-- Epics Table -->
			<div class="limiter">
				<div class="table100 ver2 m-b-110" style="overflow:scroll; max-height:500px; min-height:0px; overflow-x: none;">
					<table data-vertable="ver2">
						<thead>
							<tr class="row100 head">
								<th class="column100 width50" data-column="column1">Epic ID</th>
								<th class="column100 width100" data-column="column2">Epic Name</th>
								<th class="column100 width50" data-column="column6">Status</th>	
								<th class="column100 width100" data-column="column7">BV %</th>	
								<th class="column100 width75" data-column="column1">BV Count</th>
							</tr>
						</thead>
						<tbody id="projectsBody">
							<%for(Epic epic: epics) {%>
								<tr class="row100 head">
									<td class="column100 width50" data-column="column1">
										<a href="javascript:void(0)" onclick="loadEpic('<%=epic.getId()%>')">EP<%= epic.getId()%></a>
									</td>
									<td class="column100 width100" data-column="column2"><%=epic.getName() %></td>
									<td class="column100 width50" data-column="column6"><%= epic.getStatus()%></td>
									<td class="column100 width50" data-column="column6"><%= 0%></td>
									<td class="column100 width50" data-column="column1"><%= 0%></td>
								</tr>
							<%} %>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- Epics Table ended -->
		<!-- Epic Creation Div -->
			<jsp:include page="./newEpic.jsp" /> 
		<!-- Epic Creation Div ended -->


	</body>