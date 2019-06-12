<%@page import="com.viva.dto.Project"%>
<%@page import="com.viva.dao.ProjectDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.viva.dto.Epic"%>
<%@page import="java.util.List"%>
<%

	ProjectDao projectDao = new ProjectDao();
	List<Project> projects = projectDao.getProjects();
	if(projects == null){
		projects = new ArrayList<Project>();
	}
	String userName = String.valueOf(request.getSession().getAttribute("userName"));
    if(userName == null){
    	userName = "";
    }
%>
<html>
<head>
    <script src="./js/jquery-3.4.0.min.js"></script>
    <script type="text/javascript">
    	function newSprint() {
    		console.log("new Sprint open modal got called in sprint home");
			displayPopup();
		}
    </script>
	<script type="text/javascript">
	$("#searchProjectName").change(
			function() {
				console.log("searchSprintsByProjectId got called");
				var projectId= $("#searchProjectName").val();
				console.log("Project id : " + projectId);
				$("#searchSprintName").empty();
				$("#searchSprintName").append('<option value="">Loading ....</option>');
				try {
					$.ajax({
						type : 'post',
						url : './sprintSearchByProjectId',
						data : {projectId:projectId},
						success : function(response) {
							var respJSONString = JSON.stringify(response);
							var jsonObj = JSON.parse(respJSONString);
							console.log(respJSONString);
							console.log(jsonObj.responseCode + " : " + jsonObj.responseMessage);
							var option='<option value="" selected="selected">--Select Sprint--</option>';
							if(jsonObj.responseCode == 1){
								console.log("data found");
								$("#searchSprintName").empty();
								$("#searchSprintName").append(option);
								$.each(response.responseObject, function (i, sprint) {
									option='<option value="'+sprint.sprintId+'">'+sprint.sprintName+'</option>';
									console.log(option);
									$("#searchSprintName").append(option);
								});
								
							}else{
								alert("Sprints not found in this project");
								var option='<option value="" selected="selected">--Select Sprint--</option>';
								$("#searchSprintName").empty();
								$("#searchSprintName").append(option);
							}
						},
						error : function(data, status, er) {
							console.log("Error in searchSprintsByProjectId jsm : " + data
									+ " status: " + status + " er:" + er);
						}
					});
				} catch (e) {
					console.log("Exception in searchSprintsByProjectId jsm : " + e);
				}
			});
	</script>
	<script type="text/javascript">
		function searchSprint(){
			var sprintId = $("#searchSprintName").val();
			console.log("searchSprint got called ... " +sprintId);
			try {
				$.ajax({
					type : 'post',
					url : './loadSprint',
					data : {sprintId:sprintId},
					success : function(response) {
						console.log("searchSprint result : " + response);
						if(response === "success"){
							loadPage('commonDiv','sprintHome.jsp');				
						}else{
							alert("Sprint not found");
						}
					},
					error : function(data, status, er) {
						console.log("Error in searchSprint jsm : " + data
								+ " status: " + status + " er:" + er);
					}
				});
			} catch (e) {
				console.log("Exception in searchSprint jsm : " + e);
			}
		}
	</script>
</head>
<body style="margin-top: 5%">
		<label class="w3-xxxlarge w3-text-red"><b>Sprint Home</b></label>
		<label class="w3-xxxlarge" style="color: green;margin-left: 55%;">Welcome </label>
		<label class="w3-xxxlarge" style="color: blue;"><%=userName %></label>
		<form method="post" name="editSprintForm" id="editSprintForm">
		    <div class="divClass">
		    	<table>
		    		<tr>
		    			<td>
		    				<button type="button" onclick="openSprintModal()" class="signupbtn" style="text-align: centre; width:150px; margin-top: -10px;">New Sprint </button>
		    			</td>
		    			<th class="cellClass" style="width: 80px;">
		    				<label>Project</label>
		    			</th>
		    			<td class="cellClass" style="width: 300px;">
		    				   <select id="searchProjectName" name = "searchProjectName" >
						       <option value="" selected="selected">--Select Project--</option>
						      <%for(Project p : projects){%>
						      		<option value="<%= p.getId()%>"><%= p.getName()%></option>
						      <%}%>
						      </select>
		    			</td>
		    			<th class="cellClass"  style="width: 80px;">
		    				<label>Sprint</label>
		    			</th>
		    			<td class="cellClass"  style="width: 300px;">
		    				 <select id="searchSprintName" name = "searchSprintName" >
						       <option value="" selected="selected">--Select Sprint--</option>
						      
						      </select>
		    			</td>
		    		
		    			<td class="cellClass">
		    				<button type="button" onclick="searchSprint()" class="signupbtn" style="text-align: centre; width:100px; margin-top: -10px;">Search</button>
		    				
		    			</td>
		    			<th class="cellClass">
		    				<label></label>
		    			</th>
		    		</tr>
		    		
		    	</table>
		    </div>
		  </form>
		  <hr>
	
		<!-- Sprint Creation Div -->
			<%@include file="./newSprint.jsp" %>
		<!-- Sprint Creation Div ended -->
  	<script type="text/javascript">
		$(document).ready(function() {
			if("" === <%=userName%>){
				alert("Session expired please login again.");
				window.location="./index.jsp";
			}
		});
</script>
</html>