<%@page import="java.util.ArrayList"%>
<%@page import="com.viva.dao.BusinessValuesDao"%>
<%@page import="java.util.List"%>
<%@page import="com.viva.dto.BusinessValue"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	BusinessValuesDao bvDao = new BusinessValuesDao();
    
    	List<BusinessValue> bvs = bvDao.getAllBusinessValues();
    	if(bvs == null){
    		bvs = new ArrayList<BusinessValue>();
    	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
		<script src="./js/jquery-3.4.0.min.js"></script>
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
	<button onclick="openBVModal();" style="width:auto;">New Business Value</button>
	<div id="newBvModalDiv" class="modal">
		  <span onclick="javascript:closeBVModal()" class="close" title="Close Sprint">&times;</span>
			<form id="newBVForm" name="newBVForm" class="modal-content">
			    <div class="container">
			      <h1 style="color:green">Add Business Value</h1>
			      <p style="color:red">Please fill in the form to add the Business Value</p>
			      <hr>
			      
				   <label for="businessValueName"><b>Business Value Name</b></label><label style="color: red;">&nbsp;*</label>
				   <input type="text" id="businessValueName" name = "businessValueName" required placeholder="Business Value Name">
			      		   
			      <label for="businessValueDescription"><b>Business Value Description</b></label>
			      <textarea rows="4" cols="50" placeholder="Business Value Description" name="businessValueDescription" id="businessValueDescription" style="height: 100px;">
			      </textarea>
			      
			      <div class="clearfix">
			        <button type="button" onclick="javascript:closeBVModal()" class="cancelbtn">Cancel</button>
			        <button type="button" class="signupbtn" onclick="newBV()">Save</button>
			      </div>
			    </div>
		  </form>
		</div>
			<script type="text/javascript">
	    $(document).ready(function() {
	    	console.log("New BV creation form loading .....");
	    	$("#businessValueDescription").val("");
	    	
	      });
		function newBV() {
			console.log("create BV got called");
			var formData = $("form[name=newBVForm]").serialize();
			console.log(formData);
          
				$.ajax({
	                type: 'post',
	                url: './addBusinessValue',
	                data: formData,
	                success: function (response) {
	                   console.log("new BV creation call completed..... " + response);
	                   if(response === "success"){
	                	   alert($("#businessValueName").val() + " creation Success");
	                	   loadPage('commonDiv','./newBV.jsp');
	                   }else if(response === "exist"){
	                	   alert($("#businessValueName").val() + " Already Exist");
	                   }else{
	                	   alert($("#businessValueName").val() + " creation Failed");
	                   }
	                },
					error : function(data, status, er) {
						console.log("Error in create new BV jsm : " + data + " status: " + status + " er:" + er);
					
					}
	            });
				closeBVModal();
		}
		
		function closeBVModal(){
	    	$("#businessValueDescription").val("");
			document.getElementById('newBvModalDiv').style.display='none';
		}
		function openBVModal(){
			  document.getElementById('newBvModalDiv').style.display='block';
			  clearBVForm();
		}
		function clearBVForm(){
			$("#businessValueName").val("");
			$("#businessValueDescription").val("");
		}
	</script>
	<!-- BV Table -->
			<div class="limiter">
				<div class="table100 ver2 m-b-110" style="overflow:scroll; max-height:630px; min-height:0px; overflow-x: none;">
					<table data-vertable="ver2">
						<thead>
							<tr class="row100 head">
								<th class="column100 width50" data-column="column1">ID</th>
								<th class="column100 width100" data-column="column2">Name</th>
								<th class="column100 width50" data-column="column1">Description</th>
								<th class="column100 width75" data-column="column1">IsActive</th>
							</tr>
						</thead>
						<tbody id="projectsBody">
							<% for(BusinessValue bv : bvs){ %>
								<tr class="row100 head">
									<td class="column100 width50" data-column="column1">
									BV<%=bv.getId() %>
									</td>
									<td class="column100 width100" data-column="column2"><%=bv.getName() %></td>

									<td class="column100 width50" data-column="column1"><%=bv.getDescription()%></td>
									
									<td class="column100 width75" data-column="column1"><%=bv.isActive()%></td>
								</tr>
							<%} %>
						</tbody>
					</table>
				</div>
			</div>
		<!-- BV Table ended -->
</body>
</html>