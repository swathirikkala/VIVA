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
	
	
	UserDao userDao = new UserDao();
	ProjectDao projectDao = new ProjectDao();
	EpicDao epicDao = new EpicDao();
	BusinessValuesDao businessValuesDao = new BusinessValuesDao();
	
	List<Project> projects = projectDao.getProjects();
	if(null == projects){
		projects = new ArrayList<Project>();
	}
	List<BusinessValue> bvs = businessValuesDao.getAllBusinessValues();
	List<Epic> epics = epicDao.getEpics(); 
	if(null == epics){
		epics = new ArrayList<Epic>();
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
		      
			   <label for="projectName"><b>Project Name</b></label>
			   <select id="projectName" name = "projectName" >
		       <option value="" selected="selected">--Select Project--</option>
		      <%for(Project p : projects){%>
		      		<option value="<%= p.getId()%>"><%= p.getName()%></option>
		      <%}%>
		      </select>
		      		   
		      
		      
		      <label for="epicName"><b>Epic Name</b></label><label style="color: red;">&nbsp;*</label>
		      <select id="epicName" name = "epicName" >
		       <option value="" selected="selected">--Select Epic--</option>
		      <%for(Epic e : epics){%>
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
		       <select id="businessValues" name = "businessValues">
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
    $(document).ready(function() {
    	setTimeout(function(){ 
    		$("#projectName").val("<%=projectId%>");
        	$("#usDescription").val("");
    	}, 1000);
      });
	</script>
	<script type="text/javascript">
		function openUSModal(){
			  console.log("openUSModal got called");
			  document.getElementById('usModalDiv').style.display='block';
		}
		function closeUSPopup(){
			  console.log("closeUSPopup got called");
			  document.getElementById('usModalDiv').style.display='none';
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
