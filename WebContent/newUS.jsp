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
	
	UserDao userDao = new UserDao();
	ProjectDao projectDao = new ProjectDao();
	EpicDao epicDao = new EpicDao();
	BusinessValuesDao businessValuesDao = new BusinessValuesDao();
	
	List<Project> projects = projectDao.getProjects();
	if(null == projects){
		projects = new ArrayList<Project>();
	}
	List<BusinessValue> bvs = businessValuesDao.getAllBusinessValues();
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
		       <option value="" selected="selected">--Select Project--</option>
		      <%for(Project p : projects){%>
		      		<option value="<%= p.getId()%>"><%= p.getName()%></option>
		      <%}%>
		      </select>
		      		   
		      
		      
		      <label for="usEpicName"><b>Epic Name</b></label><label style="color: red;">&nbsp;*</label>
		      <select id="usEpicName" name = "usEpicName" >
		       <option value="" selected="selected">--Select Epic--</option>
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
		     	 
			   
			   <label for="businessValues"><b>Business Values</b></label><label style="color: red;">&nbsp;*</label>
		       <select id="businessValues" name = "businessValues" multiple="multiple">
		       <option value="0">--Select--</option>
		     		<%for(BusinessValue bv : bvs){ %>
		     			<option value="<%=bv.getId()%>"><%=bv.getName() %></option>
		     		<%} %>
		      </select>

		      <label for="description"><b>User Story Description</b></label><label style="color: red;">&nbsp;*</label>
		      <textarea rows="4" cols="50" placeholder="Description" name="usDescription" id="usDescription" style="height: 100px;">
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
	//clearUSForm();
	closeUSPopup();
	document.getElementById('usModalDiv').style.display='block';
}
function closeUSPopup(){
	console.log("closeUSPopup got called");
	document.getElementById('usModalDiv').style.display='none';
}
function clearUSForm(){
	$("#usDescription").val("");
	$("#businessValues").val("0");
	$("#usPriority").val("0");
	$("#usDescription").val("");
	$("#usEpicName").val("");
}
	</script>
	<script type="text/javascript">
    	function createUS() {
			console.log("createUS got called ....");
			var newUSFormData = $("form[name=newUSForm]").serialize();
			console.log(newUSFormData);
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
                },
				error : function(data, status, er) {
					console.log("Error in createUS jsm : " + data + " status: " + status + " er:" + er);
				
				}
            });
			closeUSPopup();
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
