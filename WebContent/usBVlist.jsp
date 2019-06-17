
<%@page import="com.viva.dao.util.LookUp"%>
<%@page import="com.viva.dto.BusinessValue"%>
<%@page import="com.viva.dto.UsBv"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%

	List<UsBv> bvsByUsId = (List<UsBv>)request.getSession().getAttribute("bvsByUsId");
	if(bvsByUsId == null){
		bvsByUsId = new ArrayList<UsBv>();
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
			
		<!-- User story business values Table -->
			<div class="limiter">
				<div class="table100 ver2 m-b-110" style="overflow:scroll; max-height:500px; min-height:0px; overflow-x: none;">
					<table data-vertable="ver2">
						<thead>
							<tr class="row100 head">
								<th class="column100 width50" data-column="column1">BV ID</th>
								<th class="column100 width100" data-column="column2">BV Name</th>
								<th class="column100 width75" data-column="column1">BV VIVA%</th>
								<th class="column100 width75" data-column="column1">Comment</th>
							</tr>
						</thead>
						<tbody id="projectsBody">
							<%for(UsBv ub: bvsByUsId) {%>
								<tr class="row100 head">
									<td class="column100 width50" data-column="column1">BV<%=ub.getBvId()%></td>
									<td class="column100 width100" data-column="column2"><%= LookUp.bvName(ub.getBvId())%></td>
									<td class="column100 width75" data-column="column1"><%= ub.getViva()%></td>
									<td class="column100 width50" data-column="column6"><%=ub.getComment()%></td>
									
								</tr>
							<%} %>
						</tbody>
					</table>
				</div>
			</div>
		<!-- User story business values Table ended -->
		
	</body>