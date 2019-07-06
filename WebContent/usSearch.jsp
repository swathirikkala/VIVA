<%@page import="com.viva.db.util.CacheUtil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.viva.dto.Project"%>
<%@page import="java.util.List"%>
<%@page import="com.viva.dao.ProjectDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userName = String.valueOf(request.getSession().getAttribute("userName"));
	if(userName == null){
		userName = "";
	} 
	List<Project> projects = CacheUtil.allProjects;
	if(projects == null){
		projects = new ArrayList<Project>();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	.cellClass{
			width: 200px;
			padding-right: 10px;
		}
</style>
</head>
<body style="margin-top: 5%">
<label class="w3-xxxlarge w3-text-red"><b>User Story Home</b></label>
<label class="w3-xxxlarge" style="color: green;margin-left: 55%;">Welcome </label>
<label class="w3-xxxlarge" style="color: blue;"><%=userName %></label>
<br>
<!-- <form method="post" name="epicSearchForm" id="epicSearchForm"> -->
		    <div class="divClass">
		    	<table>
		    		<tr>
		    			<th class="cellClass" style="width: 80px;">
		    				<button onclick="javascript:openUSModal()" style="width: 150px;">New User Story</button>
		    			</th>
		    			<th class="cellClass" style="width: 80px;">
		    				<label>Project</label>
		    			</th>
		    			<td class="cellClass" style="width: 300px;">
		    				   <select id="usSearchProjectName" name = "usSearchProjectName" >
						       <option value="0" selected="selected">--Select Project--</option>
						      <%for(Project p : projects){%>
						      		<option value="<%= p.getId()%>"><%= p.getName()%></option>
						      <%}%>
						      </select>
		    			</td>
		    			<th class="cellClass"  style="width: 80px;">
		    				<label>Epic</label>
		    			</th>
		    			<td class="cellClass"  style="width: 300px;">
		    				 <select id="usSearchEpicName" name = "usSearchEpicName">
						       <option value="0" selected="selected">--Select Epic--</option>
						      </select>
		    			</td>
		    			<th class="cellClass"  style="width: 80px;">
		    				<label>User Story</label>
		    			</th>
		    			<td class="cellClass"  style="width: 300px;">
		    				 <select id="userStorySearchUss" name = "userStorySearchUss">
						       <option value="0" selected="selected">--Select User Story--</option>
						      	
						      </select>
		    			</td>
		    		
		    			<td class="cellClass">
		    				<button type="button" onclick="loadUserStory()" class="signupbtn" 
		    				style="text-align: centre; width:100px; margin-top: -10px;">Search</button>
		    				
		    			</td>
		    		</tr>
		    		
		    	</table>
		    </div>
<!-- 		  </form> -->
</body>
<script type="text/javascript">

$("#usSearchProjectName").change(
		function() {
			console.log("usSearchProjectName change event got called");
			var projectId= $("#usSearchProjectName").val();
			console.log("Project id : " + projectId);
			$("#usSearchEpicName").empty();
			$("#usSearchEpicName").append('<option value="">Loading ....</option>');
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
						var option='<option value="" selected="selected">--Select Epic--</option>';
		                if(jsonObj.responseCode == 1){
		                	console.log("data found");
							$("#usSearchEpicName").empty();
							$("#usSearchEpicName").append(option);
							$.each(response.responseObject, function (i, epic) {
								option='<option value="'+epic.id+'">'+epic.name+'</option>';
//									console.log(option);
								$("#usSearchEpicName").append(option);
							});
							
		                }else{
		                	alert("no epics found with this search criteria");
		                	var option='<option value="" selected="selected">--Select Epic--</option>';
							$("#usSearchEpicName").empty();
							$("#usSearchEpicName").append(option);
		                }
					},
					error : function(data, status, er) {
						console.log("Error in usSearchProjectName jsm : " + data
								+ " status: " + status + " er:" + er);
					}
				});
			} catch (e) {
				console.log("Exception in usSearchProjectName jsm : " + e);
			}
		});
</script>

<script type="text/javascript">

$("#usSearchEpicName").change(
		function() {
			console.log("usSearchEpicName change event got called");
			var epicId= $("#usSearchEpicName").val();
			console.log("epicId : " + epicId);
			$("#userStorySearchUss").empty();
			$("#userStorySearchUss").append('<option value="">Loading ....</option>');
			try {
				$.ajax({
					type : 'post',
					url : './userStoriesByEpic',
					data : {epicId:epicId},
					success : function(response) {
						var respJSONString = JSON.stringify(response);
						var jsonObj = JSON.parse(respJSONString);
						console.log(respJSONString);
						console.log(jsonObj.responseCode + " : " + jsonObj.responseMessage);
						var option='<option value="" selected="selected">--Select User Story--</option>';
		                if(jsonObj.responseCode == 1){
		                	console.log("data found");
							$("#userStorySearchUss").empty();
							$("#userStorySearchUss").append(option);
							$.each(response.responseObject, function (i, userStory) {
								option='<option value="'+userStory.id+'">'+userStory.name+'</option>';
//									console.log(option);
								$("#userStorySearchUss").append(option);
							});
							
		                }else{
		                	alert("no User stories found with this search criteria");
		                	var option='<option value="" selected="selected">--Select User Story--</option>';
							$("#userStorySearchUss").empty();
							$("#userStorySearchUss").append(option);
		                }
					},
					error : function(data, status, er) {
						console.log("Error in us search epic change jsm : " + data
								+ " status: " + status + " er:" + er);
					}
				});
			} catch (e) {
				console.log("Exception in us search epic change jsm : " + e);
			}
		});
</script>

<script type="text/javascript">

		function loadUserStory()  {
			console.log("userStorySearchUss change event got called");
			var userStoryId= $("#userStorySearchUss").val();
			console.log("userStoryId : " + userStoryId);
			try {
				$.ajax({
					type : 'post',
					url : './loadUserStory',
					data : {userStoryId:userStoryId},
					success : function(response) {
						console.log("userStorySearchUss result : " + response);
						if(response != "success"){
							alert("User stories not found");
						}

						$("#userStoryEditDiv").load("./usEdit.jsp");
						$("#userStoryBusinessValuesDiv").load("./usBVlist.jsp");
					},
					error : function(data, status, er) {
						console.log("Error in user story loading jsm : " + data
								+ " status: " + status + " er:" + er);
					}
				});
			} catch (e) {
				console.log("Exception in user story loading jsm : " + e);
			}
		};
</script>
</html>