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
	List<Project> allProjects = (List<Project>)request.getSession().getAttribute("allProjects");
    if(null == allProjects){
    	allProjects = new ArrayList<>();
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

	$("#epicSearchProjectName").change(
			function() {
				console.log("epicSearchProjectName change event got called");
				var projectId= $("#epicSearchProjectName").val();
				console.log("Project id : " + projectId);
				$("#epicSearchEpicName").empty();
				$("#epicSearchEpicName").append('<option value="">Loading ....</option>');
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
							var option='<option value="" selected="selected">--Select Sprint--</option>';
			                if(jsonObj.responseCode == 1){
			                	console.log("data found");
								$("#epicSearchEpicName").empty();
								$("#epicSearchEpicName").append(option);
								$.each(response.responseObject, function (i, epic) {
									option='<option value="'+epic.id+'">'+epic.name+'</option>';
// 									console.log(option);
									$("#epicSearchEpicName").append(option);
								});
								
			                }else{
			                	alert("no epics found with this search criteria");
			                	var option='<option value="" selected="selected">--Select Epic--</option>';
								$("#epicSearchEpicName").empty();
								$("#epicSearchEpicName").append(option);
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
			
		function loadEpicForEdit() {
			var epicId = $("#epicSearchEpicName").val();
			console.log("loadEpicForEdit got called : epicId -> "
					+ epicId);
			$.ajax({
				type : 'post',
				url : './loadEpic',
				data : {
					epicId : epicId
				},
				success : function(response) {
					console.log("loadEpicForEdit completed..... " + response);
					if (response === "success") {
						loadPage('commonDiv','./epicHome.jsp')
					} else {
						console.log("No Data Found with search criteria");
					}
				}
			});
		}
	</script>
</head>
<body style="margin-top: 5%">
<label class="w3-xxxlarge w3-text-red"><b>Epic Home</b></label>
<label class="w3-xxxlarge" style="color: green;margin-left: 55%;">Welcome </label>
<label class="w3-xxxlarge" style="color: blue;"><%=userName %></label>
<br>
<form method="post" name="epicSearchForm" id="epicSearchForm">
		    <div class="divClass">
		    	<table>
		    		<tr>
		    			<td>
		    				<button type="button" onclick="openNewEpicModal()" class="signupbtn" 
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
		    				<button type="button" onclick="loadEpicForEdit()" class="signupbtn" style="text-align: centre; width:100px; margin-top: -10px;">Search</button>
		    				
		    			</td>
		    			<th class="cellClass">
		    				<label></label>
		    			</th>
		    		</tr>
		    		
		    	</table>
		    </div>
		  </form>
		  <hr>

</body>
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