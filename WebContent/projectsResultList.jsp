<%@page import="java.util.Map"%>
<%@page import="com.viva.dao.UserDao"%>
<%@page import="com.viva.dao.util.LookUp"%>
<%@page import="com.viva.dto.Project"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.viva.dto.User"%>
<%@page import="java.util.List"%>

<%
	List<Project> projects = (List<Project>)request.getSession().getAttribute("projects");
	if(projects == null){
		projects = new ArrayList<Project>();
	}
	UserDao userDao = new UserDao();
	Map<String, User> allUsers = userDao.getAllUsers();
%>
<!DOCTYPE html>
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
			function loadProject(projectId) {
				console.log("Load project function got called : projectId -> " +projectId );
	            $.ajax({
	                type: 'post',
	                url: './loadProject',
	                data: {projectId:projectId},
	                success: function (response) {
	                   console.log("Project Loading completed..... " + response);
	                   if(response === "success"){
	                	   loadPage('commonDiv','projectEditHome.jsp');
	                   }else{
	                	   console.log("No Data Found with search criteria");
	                   }
	                }
	            });
			}
		</script>
		<script type="text/javascript">
			function openModal(){
				console.log("Open Project modal got called");
				$("#addPrjDiv").load("./newProject.jsp",clearProject());
			}
			function clearProject() {
				console.log("clearProject jsm got called..");
				$("#projectManager").val("");
				$("#projectName").val("");
				$("#projectPriority").val("0");
				$("#projectStartDate").val("");
				$("#projectEndDate").val("");
				$("#projectDescription").val("");
			}
		</script>
	</head>
	<body>
	<button onclick="openModal();" style="width:auto;">Create New Project</button>
	<% if(projects.isEmpty()) {%>
	<label id="projectResultInfo" style="color: red;margin-left: 20%;">No Projects found with search criteria</label>
	<%} else{%>
	<label id="projectResultInfo" style="color: blue;margin-left: 20%;"><%= projects.size()%> Projects Found</label>
	<%} %>
		<!-- Project Creation Div -->
		<div id="addPrjDiv">
		  <jsp:include page="newProject.jsp"/>
		</div>
		<!-- Project Creation Div ended -->
	<!-- Projects Table -->
			<div class="limiter">
				<div class="table100 ver2 m-b-110" style="overflow:scroll; max-height:500px; min-height:0px; overflow-x: none;">
					<table data-vertable="ver2">
						<thead>
							<tr class="row100 head">
								<th class="column100 width50" data-column="column1">ID</th>
								<th class="column100 width100" data-column="column2">Project</th>
								<th class="column100 width50" data-column="column1">Manager</th>
								<th class="column100 width75" data-column="column1">Start Date</th>
								<th class="column100 width75" data-column="column1">End Date</th>
								<th class="column100 width50" data-column="column6">Status</th>
								<th class="column100 width100" data-column="column7">VIVA</th>
							</tr>
						</thead>
						<tbody id="projectsBody">
							<% for(Project p : projects){ %>
								<tr class="row100 head">
									<td class="column100 width50" data-column="column1">
										<a href="javascript:void(0);" onclick="loadProject('<%=p.getId()%>')">PRJ<%=p.getId()%></a> 
									</td>
									<td class="column100 width100" data-column="column2"><%=p.getName() %></td>
									<%
										String manager = LookUp.getUserName(p.getManager(),allUsers);
										if(manager.isEmpty()){
											manager = "Not Assigned";
										}
									%>
									<td class="column100 width50" data-column="column1"><%=manager%></td>
									<%
										String sd = p.getStartDate();
										if("2000-01-01".equals(sd)){
											sd="Not Selected";
										}
										String ed = p.getEndDate();
										if("2000-01-01".equals(ed)){
											ed="Not Selected";
										}
									%>
									<td class="column100 width75" data-column="column1"><%=sd%></td>
									<td class="column100 width75" data-column="column1"><%=ed%></td>
									<td class="column100 width50" data-column="column6"><%=p.getStatus()%></td>
									<td class="column100 width100" data-column="column7"><%=p.getViva()%>%</td>
								</tr>
							<%} %>
						</tbody>
					</table>
				</div>
			</div>
		<!-- Projects Table ended -->
		
	</body>