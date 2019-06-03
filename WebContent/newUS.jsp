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
<!-- Project Creation Div -->
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
		      		<option value="1">High</option>
			      	<option value="2">Medium</option>
			      	<option value="3">Low</option>
			      	<option value="4">No Severity</option>
		     	 </select>
		     	 
			   
			   <label for="businessValues"><b>Business Values</b></label><label style="color: red;">&nbsp;*</label>
		       <select id="businessValues" name = "businessValues">
		       <option value="0">--Select--</option>
		     		<%for(BusinessValue bv : bvs){ %>
		     			<option value="<%=bv.getId()%>"><%=bv.getName() %></option>
		     		<%} %>
		      </select>

		      <label for="description"><b>User Story Description</b></label><label style="color: red;">&nbsp;*</label>
		      <textarea rows="4" cols="50" placeholder="Description" name="description" id="description" style="height: 100px;">
		      </textarea>
		      
		      <div class="clearfix">
		        <button type="button" onclick="javascript:closeUSPopup()" class="cancelbtn">Cancel</button>
		        <button type="button" class="signupbtn" onclick="createUS()">Save</button>
		      </div>
		    </div>
		  </form>
		</div>
		<!-- Project Creation Div ended -->
	<script type="text/javascript">
	
	function displayPopup(){
		  document.getElementById('usModalDiv').style.display='block';
		}
	function closeUSPopup()(){
		  document.getElementById('usModalDiv').style.display='none';
		}
	
    $(document).ready(function() {
    	displayPopup();
    	//alert("Create new sprint got called");
    	$("#projectName").val("<%=projectId%>");
    	$("#description").val("");
    	
      });
	
	</script>

