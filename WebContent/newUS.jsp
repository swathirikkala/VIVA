<%@page import="com.viva.db.util.CacheUtil"%>
<%@page import="com.viva.dao.util.LookUp"%>
<%@page import="com.viva.dao.BusinessValuesDao"%>
<%@page import="com.viva.dto.BusinessValue"%>
<%@page import="com.viva.dao.EpicDao"%>
<%@page import="com.viva.dto.Epic"%>
<%@page import="com.viva.dao.ProjectDao"%>
<%@page import="com.viva.dao.UserDao"%>
<%@page import="com.viva.dto.Sprint"%>
<%@page import="com.viva.dto.Project"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.viva.dto.User"%>
<%@page import="java.util.List"%>

<%
	String userId = String.valueOf(request.getSession().getAttribute("userId"));
	String userName = String.valueOf(request.getSession().getAttribute("userName"));
	String projectId = String.valueOf(request.getSession().getAttribute("projectId"));
	if(projectId == null){
		projectId = "0";
	}
	
	EpicDao epicDao = new EpicDao();
	BusinessValuesDao businessValuesDao = new BusinessValuesDao();
	
	List<Project> projects = CacheUtil.allProjects;
	if(null == projects){
		projects = new ArrayList<Project>();
	}
	List<BusinessValue> bvs = CacheUtil.allBusinessValues;
	int pid = 0;
	try{
		pid = Integer.valueOf(projectId);
	}catch(Exception e){
		System.err.println("Project id format exception : " + e.getMessage());
	}
	
	List<Epic> epicsByProjectId = epicDao.getEpicsByProjectId(pid);
	if(null == epicsByProjectId){
		epicsByProjectId = new ArrayList<Epic>();
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<link href="./css/fSelect.css" rel="stylesheet">
		<script src="./js/jquery-3.4.0.min.js"></script>
		<script src="./js/fSelect.js"></script>
	<script type="text/javascript">
	 $(document).ready(function() {
		
	 });
	</script>
	</head>
	<body>
<!-- User story Creation Div start-->
		<div id="usModalDiv" class="modal">
		  <span onclick="javascript:closeUSPopup()" class="close" title="Close Sprint">&times;</span>
			<form class="modal-content" name="newUSForm" id="newUSForm">
		    <div class="container">
		      <h1 style="color:green">Add User Story</h1>
		      <p style="color:red">Please fill in the form to add the User Story</p>
		      <hr>
		      
			   <label for="usProjectName"><b>Project Name</b></label>
			   <select id="usProjectName" name = "usProjectName" >
		       <option value="0" selected="selected">--Select Project--</option>
		      <%for(Project p : projects){%>
		      		<option value="<%= p.getId()%>"><%= p.getName()%></option>
		      <%}%>
		      </select>
		      
		      <label for="usEpicName"><b>Epic Name</b></label><label style="color: red;">&nbsp;*</label>
		      <select id="usEpicName" name = "usEpicName" >
		       <option value="0" selected="selected">--Select Epic--</option>
		      <%for(Epic e : epicsByProjectId){%>
		      		<option value="<%= e.getId()%>"><%= e.getName()%></option>
		      <%}%>
		      </select>
		     
		     <label for="usName"><b>User Story Name</b></label><label style="color: red;">&nbsp;*</label>
			   <input type="text" placeholder="User Story Name" name="usName" id="usName" required>
		     
		     
			   <label for="severity"><b>User Story Priority</b></label>
			     <select id="usPriority" name = "usPriority" required>
		      		<option value="0">--Select--</option>
		      		<% for(String p : LookUp.getPriorities()){%>
		      			
		      		<option value="<%=p%>"><%=p%></option>
		      		<%} %>
		     	 </select>
		     	 
			   
			   <label for="usBusinessValues"><b>Business Values</b></label><label style="color: red;">&nbsp;*</label>
		       <select id="usBusinessValues" name = "usBusinessValues" multiple="multiple"  style="height: 150px;">
			      <%for(BusinessValue bv : CacheUtil.allBusinessValues){%>
			      		<option value="<%= bv.getId()%>"><%= bv.getName()%></option>
			      <%}%>
		      </select>

		      <label for="description"><b>User Story Description</b></label><label style="color: red;">&nbsp;*</label>
		      <textarea rows="4" cols="50" placeholder="Description" name="usDescription" id="usDescription">
		      </textarea>
		      
		      <div class="clearfix">
		        <button type="button" onclick="javascript:closeUSPopup()" class="cancelbtn">Cancel</button>
		        <button type="button" class="signupbtn" onclick="createUS()">Save</button>
		      </div>
		    </div>
		  </form>
		</div>
		<!-- User story Creation Div ended -->
	<script type="text/javascript">

	</script>
	<script type="text/javascript">
function openUSModal(){
	console.log("openUSModal got called");
	closeUSPopup();
	 var epicsCount = '<%=epicsByProjectId.size()%>';
	 console.log("epicsCount in user story creation : " + epicsCount);
	document.getElementById('usModalDiv').style.display='block';
	 if(epicsCount == 0){
		 //alert("No epics found under this project.");
	 }
}
function closeUSPopup(){
	clearUSForm();
	console.log("closeUSPopup got called");
	document.getElementById('usModalDiv').style.display='none';
}
function clearUSForm(){
	$("#usProjectName").val("0");
	$("#usEpicName").val("0");
	$("#usName").val("");
	$("#usPriority").val("0");
	$("#usBusinessValues").val("[]");
	$("#usDescription").val("");
}

function validateUSForm(){
	var isValid = true;
	var errorMessage = "";
	if($("#usProjectName").val() == "0"){
		isValid = false;
		errorMessage += "\r\nPlease Select Project";
	}
	if($("#usEpicName").val() == "0"){
		isValid = false;
		errorMessage += "\r\nPlease Select Epic";
	}
	if($("#usName").val() == ""){
		isValid = false;
		errorMessage += "\r\nPlease Give User Story Name";
	}
	if($("#usBusinessValues").val().length == 0){
		isValid = false;
		errorMessage += "\r\nPlease Select Atleast one Business Value";
	}
	if($("#usDescription").val() == ""){
		isValid = false;
		errorMessage += "\r\nPlease Give User Description";
	}
	
	if(isValid == false){
		alert(errorMessage);
	}
	console.log("validateUSForm : " + isValid);
	return isValid;
}
	</script>
	<script type="text/javascript">
	
    	function createUS() {
			console.log("createUS got called ....");
			var newUSFormData = $("form[name=newUSForm]").serialize();
			console.log(newUSFormData);
			var isValidForm = validateUSForm();
			console.log("isValidForm : " + isValidForm);
			if(isValidForm == true){
				$.ajax({
	                type: 'post',
	                url: './addUserStory',
	                data: newUSFormData,
	                success: function (response) {
	                   console.log("US creation call completed..... " + response);
	                   if(response === "success"){
	                	   alert("US creation Success");
	                   }else{
	                	   alert("US creation Failed");
	                   }
		       			closeUSPopup();
	                },
					error : function(data, status, er) {
						console.log("Error in createUS jsm : " + data + " status: " + status + " er:" + er);
		       			closeUSPopup();
					}
	            });
			}else{
				console.log("Form incomplete ......");
			}
	}
	</script>
<script type="text/javascript">

$("#usProjectName").change(
		function() {
			console.log("usProjectName change event got called");
			var projectId= $("#usProjectName").val();
			console.log("Project id : " + projectId);
			$("#usEpicName").empty();
			$("#usEpicName").append('<option value="">Loading ....</option>');

			$("#usBusinessValues").val("[]");
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
							$("#usEpicName").empty();
							$("#usEpicName").append(option);
							$.each(response.responseObject, function (i, epic) {
								option='<option value="'+epic.id+'">'+epic.name+'</option>';
//									console.log(option);
								$("#usEpicName").append(option);
							});
							
		                }else{
		                	alert("no epics found with this search criteria");
		                	var option='<option value="" selected="selected">--Select Epic--</option>';
							$("#usEpicName").empty();
							$("#usEpicName").append(option);
		                }
					},
					error : function(data, status, er) {
						console.log("Error in projectName Change event in US creation jsm  : " + data
								+ " status: " + status + " er:" + er);
					}
				});
			} catch (e) {
				console.log("Exception in projectName Change event in US creation jsm : " + e);
			}
		});
</script>
<script type="text/javascript">

$("#usEpicName").change(
		function() {
		console.log("loadBvs");	
		console.log("usEpicName change event got called");
		var epicId= $("#usEpicName").val();
		console.log("epicId : " + epicId);

		$("#usBusinessValues").val("[]");
		try {
			$.ajax({
				type : 'post',
				url : './bvsByEpic',
				data : {epicId:epicId},
				success : function(response) {
					var respJSONString = JSON.stringify(response);
					var jsonObj = JSON.parse(respJSONString);
					console.log(respJSONString);
					console.log(jsonObj.responseCode + " : " + jsonObj.responseMessage);
					$("#usBusinessValues").val("");
	                if(jsonObj.responseCode == 1){
	                	console.log("BVs found");
	                	var bvArray = [];
						$.each(response.responseObject, function (i, epicBv) {
							console.log("epicBv.bvId " + epicBv.bvId);
							bvArray.push(epicBv.bvId);
							
						});
						console.log("bvArray : " + bvArray)
						$("#usBusinessValues").val(bvArray);
						
	                }else{
	                	alert("no epics Business values found with this Epic");
	                }
				},
				error : function(data, status, er) {
					console.log("Error in loadBvs in US creation jsm  : " + data
							+ " status: " + status + " er:" + er);
				}
			});
		} catch (e) {
			console.log("Exception in loadBvs in US creation jsm : " + e);
		}
	});
		
</script>
</body>
</html>