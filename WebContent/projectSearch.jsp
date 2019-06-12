<%@page import="com.viva.dao.util.LookUp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.viva.dto.Project"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	List<Project> allProjects = (List<Project>)request.getSession().getAttribute("allProjects");
	    if(null == allProjects){
	    	allProjects = new ArrayList<>();
	    }
		String userName = String.valueOf(request.getSession().getAttribute("userName"));
	    if(userName == null){
	    	userName = "";
	    }
    %>
<!DOCTYPE html>
<html>
<head>
	<style type="text/css">
		.divClass{
			margin-bottom: 2px; margin-top: 2px; margin-left: 2px; margin-right: 2px; border: thin;
		}
		.cellClass{
			width: 200px;
			padding-right: 25px;
		}
	</style> 
	<script src="./js/jquery-3.4.0.min.js"></script>
  	<script src="./js/project.js"></script>
  	<script type="text/javascript">
		$(document).ready(function() {
			var uname = '<%=userName%>';
			if('' === uname){
				alert("Session expired please login again.");
				window.location="./index.jsp";
			}
		});
	</script>
</head>
<body style="margin-top: 5%">
		<label class="w3-xxxlarge w3-text-red"><b>Project</b></label>
		<label class="w3-xxxlarge" style="color: green;margin-left: 55%;">Welcome </label>
		<label class="w3-xxxlarge" style="color: blue;"><%=userName%></label>
		<hr>
		<form method="post" name="projectSearchForm" id="projectSearchForm">
		    <div class="divClass">
		    
		    	<table>
		    		<tr>
		    			<th class="cellClass">
		    				<label>Project Name</label>
		    			</th>
		    			<td class="cellClass">
		    				<select id="projectId" name = "projectId" class="">
						      <option value="0">--Select--</option>
						      <%for(Project p : allProjects){%>
						      		<option value="<%= p.getId()%>"><%= p.getName()%></option>
						      <%}%>
						     </select>
		    			</td>
		    			<th class="cellClass">
		    				<label>Project Status</label>
		    			</th>
		    			<td class="cellClass">
					    	<select id="projectStatus" name = "projectStatus"  class="">
					      		<option value="select" selected="selected">--- Select ---</option>
					      		<%
					      			for(String o:LookUp.getStatuses()){
					      		%>
					      			<option value="<%=o %>"><%=o %></option>
					      		<%
					      			}
					      		%>
					     	 </select>
		    			</td>
		    		</tr>
		    		<tr>
		    			<th class="cellClass">
		    				<label>Project VIVA%</label>
		    			</th>
		    			<td class="cellClass">
		    				<select id="projectViva" name = "projectViva" required>
					      		<option value="0">--Select--</option>
					      		<option value="10">10</option>
						      	<option value="20">20</option>
						      	<option value="30">30</option>
						      	<option value="40">40</option>
						      	<option value="50">50</option>
						      	<option value="60">60</option>
						      	<option value="70">70</option>
						      	<option value="80">80</option>
						      	<option value="90">90</option>
						      	<option value="100">100</option>
					     	 </select>
		    			</td>
		    			<th class="cellClass">
		    				<label>Project start date</label>
		    			</th>
		    			<td class="cellClass">
					    	<input type="date" placeholder="DD/MM/YYYY" name="projectStartDate" id="projectStartDate"  class="">
		    			</td>
		    		</tr>
		    		<tr>
		    			<th class="cellClass">
		    				<label>Project Created by</label>
		    			</th>
		    			<td class="cellClass">
		    				<input type="text" placeholder="Created By" name="createdByName" id="createdByName" required value="<%= userName %>" disabled="disabled"  class="">
		    			</td>
		    			<th class="cellClass">
		    				<label>Project End date</label>
		    			</th>
		    			<td class="cellClass">
					    	<input type="date" placeholder="DD/MM/YYYY" name="projectEndDate" id="projectEndDate"  class="">
		    			</td>
		    		</tr>
		    	</table>
		    </div>
		    
		    <div style="margin-left: 35%;">
			    	<button type="button" class="signupbtn" style="text-align: centre; width:100px;" onclick="searchProjects()">Search</button>
			    	&nbsp;
			    	<button type="button" onclick="clearProjectSearchValues();" class="cancelbtn" style="text-align: centre; width:100px;margin-left: 5px;">Clear</button>
		   	</div>
		  </form>
</body>
</html>