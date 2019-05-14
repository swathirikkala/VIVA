<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.viva.dto.Project"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	List<Project> projects = (List<Project>)request.getSession().getAttribute("projectsByManagerId");
	    if(null == projects){
	    	projects = new ArrayList<>();
	    }
		String userName = String.valueOf(request.getSession().getAttribute("userName"));
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
</head>
<body>
		<h1 class="w3-xxxlarge w3-text-red"><b>Manager Home</b></h1>
		<hr>
		<form method="post" action="./addProject">
		    <div class="divClass">
		    
		    	<table>
		    		<tr>
		    			<th class="cellClass">
		    				<label>Project Name</label>
		    			</th>
		    			<td class="cellClass">
		    				<select id="projectManager" name = "projectManager" class="">
						      <%for(Project p : projects){%>
						      		<option value="<%= p.getId()%>"><%= p.getName()%></option>
						      <%}%>
						     </select>
		    			</td>
		    			<th class="cellClass">
		    				<label>Project Status</label>
		    			</th>
		    			<td class="cellClass">
					    	<select id="projectStatus" name = "projectStatus"  class="">
					      		<option value="0" selected="selected">--- Select ---</option>
					      		<option value="1">Open</option>
						      	<option value="2">Work in Progress</option>
						      	<option value="3">On Hold</option>
						      	<option value="4">Closed</option>
						      	<option value="5">InActive</option>
						      	<option value="5">Not Started</option>
					     	 </select>
		    			</td>
		    		</tr>
		    		<tr>
		    			<th class="cellClass">
		    				<label>Project VIVA%</label>
		    			</th>
		    			<td class="cellClass">
		    				<select id="viva" name = "viva" required>
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
					    	<input type="date" placeholder="Project Start Date" name="projectStartDate" id="projectStartDate"  class="">
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
					    	<input type="date" placeholder="Project End Date" name="projectEndDate" id="projectEndDate"  class="">
		    			</td>
		    		</tr>
		    		<tr>
		    			<th class="cellClass"></th>
		    			<td class="cellClass" style="text-align:right"><button type="submit" class="signupbtn" id="saveDepartmentDiv" style="text-align:right">Search</button></td>
		    			<th class="cellClass" style="text-align: left;"><button type="button" onclick="clearValues();" class="cancelbtn" style="text-align: left;">Clear</button></th>
		    			<td class="cellClass" style="text-align: left;"></td>
		    		</tr>
		    	</table>
		    </div>
		  </form>
</body>
</html>