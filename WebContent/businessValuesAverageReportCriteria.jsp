<%@page import="com.viva.db.util.CacheUtil"%>
<%@page import="com.viva.dto.Project"%>
<%@page import="com.viva.dao.ProjectDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.viva.dto.Epic"%>
<%@page import="java.util.List"%>
<%

	List<Project> projects = CacheUtil.allProjects;
	if(projects == null){
		projects = new ArrayList<Project>();
	}
	
%>
<html>
<head>
    
   <script type="text/javascript">
	function loadEpics() {
		console.log("epicSearchProjectName change event got called");
		var projectId= $("#reportProjectName").val();
		console.log("Project id : " + projectId);
		$("#reportEpicName").empty();
		$("#reportEpicName").append('<option value="">Loading ....</option>');
		try {
			$.ajax({
				type : 'post',
				url : './epicSearchByProjectId',
				data : {projectId:projectId},
				success : function(response) {
					var respJSONString = JSON.stringify(response);
					var jsonObj = JSON.parse(respJSONString);
					console.log(respJSONString);
					console.log(jsonObj.responseCode + " : " + jsonObj.responseMessage);
					var option='<option value="0" selected="selected">--Select Epic--</option>';
	                if(jsonObj.responseCode == 1){
	                	console.log("data found");
						$("#reportEpicName").empty();
						$("#reportEpicName").append(option);
						$.each(response.responseObject, function (i, epic) {
							option='<option value="'+epic.id+'">'+epic.name+'</option>';
//								console.log(option);
							$("#reportEpicName").append(option);
						});
						
	                }else{
	                	alert("no epics found with this search criteria");
	                	var option='<option value="0" selected="selected">--Select Epic--</option>';
						$("#reportEpicName").empty();
						$("#reportEpicName").append(option);
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
	};
	</script>
	<script type="text/javascript">
	$("#reportProjectName").change(
			function() {
				console.log("reportProjectName got called");
				var projectId= $("#reportProjectName").val();
				loadEpics();
				console.log("Project id : " + projectId);
				$("#reportSprintName").empty();
				$("#reportSprintName").append('<option value="0">Loading ....</option>');
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
							var option='<option value="0" selected="selected">--Select Sprint--</option>';
							if(jsonObj.responseCode == 1){
								console.log("data found");
								$("#reportSprintName").empty();
								$("#reportSprintName").append(option);
								$.each(response.responseObject, function (i, sprint) {
									option='<option value="'+sprint.sprintId+'">'+sprint.sprintName+'</option>';
									console.log(option);
									$("#reportSprintName").append(option);
								});
								
							}else{
								alert("Sprints not found in this project");
								var option='<option value="0" selected="selected">--Select Sprint--</option>';
								$("#reportSprintName").empty();
								$("#reportSprintName").append(option);
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
<body style="margin-top: 5%">
		
		<form method="post" name="reportForm" id="reportForm">
		    <div class="divClass">
		    	<table>
		    		<tr>
		    			<td class="cellClass" style="width: 80px;">
		    				<label>Project</label>
		    			</td>
		    			<td class="cellClass" style="width: 300px;">
		    				   <select id="reportProjectName" name = "reportProjectName" >
						       <option value="0" selected="selected">--Select Project--</option>
						      <%for(Project p : projects){%>
						      		<option value="<%= p.getId()%>"><%= p.getName()%></option>
						      <%}%>
						      </select>
		    			</td>
		    			<td class="cellClass"  style="width: 80px;">
		    				<label>Sprint</label>
		    			</td>
		    			<td class="cellClass"  style="width: 300px;">
		    				 <select id="reportSprintName" name = "reportSprintName" >
						       <option value="0" selected="selected">--Select Sprint--</option>
						      
						      </select>
		    			</td>
		    		</tr>
		    		<tr>
		    			<td class="cellClass"  style="width: 80px;">
		    				<label>Epic</label>
		    			</td>
		    			<td class="cellClass"  style="width: 300px;">
		    				 <select id="reportEpicName" name = "reportEpicName" >
						       <option value="0" selected="selected">--Select Epic--</option>
						      
						      </select>
		    			</td>
		    			<td class="cellClass">
		    				
		    			</td>
		    			<td>	
		    				<button type="button" onclick="businessValuesAverageReport()" class="signupbtn" style="text-align: centre; width:100px; margin-top: -10px;">Search</button>
		    				<span style="width: 10px"></span>
		    				<button type="button" onclick="clearSearch()" class="cancelbtn" style="text-align: centre; width:100px; margin-top: -10px;">clear</button>
		    			</td>
		    		</tr>
		    		
		    	</table>
		    </div>
		  </form>
		  <hr>
	
		<!-- Sprint Creation Div -->
			<jsp:include page="newSprint.jsp" />
		<!-- Sprint Creation Div ended -->
  	<script type="text/javascript">
		$(document).ready(function() {
			
		});
</script>
<script type="text/javascript">
	function businessValuesAverageReport() {
		console.log("businessValuesAverageReport.jsp got called");
		var projectId = $("#reportProjectName").val();
		var epicId = $("#reportEpicName").val();
		var sprintId = $("#reportSprintName").val();
		console.log("\r\nprojectId = " + projectId + "\r\nepicId = " + epicId +"\r\nsprintId = "+sprintId);
		try {
			$.ajax({
					type : 'post',
					url : './businessValuesAverageReport',
					data : {projectId:projectId,epicId:epicId,sprintId:sprintId},
					success : function(response) {
						console.log("businessValuesStatusReport response : " + response);
// 						if(response == "success"){
							$("#reportDisplayDiv").empty();
							$("#reportDisplayDiv").load("businessValuesAverageReport.jsp");
// 						}
					},
					error : function(data, status, er) {
						console.log("Error in businessValuesAverageReport.jsp jsm : " + data
								+ " status: " + status + " er:" + er);
					}
				});
			} catch (e) {
				console.log("Exception in businessValuesAverageReport.jsp jsm : " + e);
			}
	}
</script>
</html>