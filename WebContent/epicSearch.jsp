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

	$("#epicSearchProjectName").change(
			function() {
				console.log("epicSearchProjectName change event got called");
				var projectId= $("#epicSearchProjectName").val();
				console.log("Project id : " + projectId);
				try {
					$.ajax({
						type : 'post',
						url : './epicSearchByProjectId',
						data : {projectId:projectId},
						success : function(response) {
							var respJSONString = JSON.stringify(response);
							console.log(respJSONString);
							var jsonObj = JSON.parse(respJSONString);
			                console.log(jsonObj.responseCode + " : " + jsonObj.responseMessage);
			                console.log(jsonObj.responseCode == 1);
							if(jsonObj.responseCode == 1){
								alert(jsonObj.responseObject);
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
</head>
<body>
<br>
<h1 class="w3-xxxlarge w3-text-red"><b>Epic Search </b></h1>

<br>
<form method="post" name="epicSearchForm" id="epicSearchForm">
		    <div class="divClass">
		    	<table>
		    		<tr>
		    			<td>
		    				<button type="button" onclick="newSprint()" class="signupbtn" 
		    				style="text-align: centre; width:150px; margin-top: -10px;">New Epic </button>
		    			</td>
		    			<th class="cellClass" style="width: 80px;">
		    				<label>Project</label>
		    			</th>
		    			<td class="cellClass" style="width: 300px;">
		    				   <select id="epicSearchProjectName" name = "epicSearchProjectName" >
						       <option value="" selected="selected">--Select Project--</option>
						      <%for(Project p : projects){%>
						      		<option value="<%= p.getId()%>"><%= p.getName()%></option>
						      <%}%>
						      </select>
		    			</td>
		    			<th class="cellClass"  style="width: 80px;">
		    				<label>Epic</label>
		    			</th>
		    			<td class="cellClass"  style="width: 300px;">
		    				 <select id="epicSearchEpicName" name = "epicSearchEpicName">
						       <option value="" selected="selected">--Select Epic--</option>
						      	
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
		
	});
	function displayPopup(){
		  document.getElementById('modalDiv').style.display='block';
		}
	function closePopup(){
		  document.getElementById('modalDiv').style.display='none';
		}
</script>
</html>