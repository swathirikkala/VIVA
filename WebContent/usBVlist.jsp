
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
		<script type="text/javascript">
			function updateBv(bvId, usId, vivaId) {
				console.log("updateBv got called......." +bvId+" "+ usId +" " + vivaId);
				var vivaValue = $("#"+vivaId).val();
				console.log("vivaValue : " + vivaValue);
				if(vivaValue < 0){
					alert("Business values should in range of 0 and 100 only");
				}else if(vivaValue >100){
					alert("Business values should in range of 0 and 100 only");
				}else{
					
					$.ajax({
			            type: 'post',
			            url: './usBvUpdate',
			            data: {bvId:bvId,usId:usId,vivaValue:vivaValue},
			            success: function (response) {
			               console.log("Update User Story Business Value : " + response);
			               //alert("Update User Story Business Value : " + response);
			               $("#messageDiv").html("<h3>Value updated</h3>");
			            }
			        });
				}
			}
			
			function removeBv(bvId, usId) {
				console.log("removeBv got called......." +bvId+" "+ usId );
					$.ajax({
			            type: 'post',
			            url: './removeBvFromUs',
			            data: {bvId:bvId,usId:usId},
			            success: function (response) {
			               console.log("removeBv Response : " + response);
			               alert("Remove Business Value from User Story Response : " + response);
			               $("#messageDiv").html("<h3>Business Value Remoived from this User Story</h3>");
			            }
			        });
			}
		</script>
	</head>
	<body>
		<div id="messageDiv"></div>
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
								<th class="column100 width75" data-column="column1">Action</th>
							</tr>
						</thead>
						<tbody id="projectsBody">
							<%for(UsBv ub: bvsByUsId) {
								int i=1; 
							%>
								<tr class="row100 head">
									<td class="column100 width50" data-column="column1">BV<%=ub.getBvId()%></td>
									<td class="column100 width100" data-column="column2"><%= LookUp.bvName(ub.getBvId())%></td>
									<td class="column100 width75" data-column="column1">
										<input type="number" id="usBv_<%=i %>" name="usBv_<%=i %>" value="<%= ub.getViva()%>" required="required"
										min="0" max="100" maxlength="3" onblur="updateBv('<%=ub.getBvId()%>','<%=ub.getUsId()%>','usBv_<%=i %>')">
									</td>
									<td class="column100 width50" data-column="column6"><%=ub.getComment()%></td>
									<td class="column100 width50" data-column="column6">
										<a href="#" onclick="removeBv('<%=ub.getBvId()%>','<%=ub.getUsId()%>')">Remove</a>
									</td>
								</tr>
							<% i++;} %>
						</tbody>
					</table>
				</div>
			</div>
		<!-- User story business values Table ended -->
		
	</body>