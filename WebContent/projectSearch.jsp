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
	<script type="text/javascript">
		function clearProjectSearchValues() {
			console.log("clearProjectSearchValues got called");
			$("#projectId").val("0");
			$("#projectStatus").val("0");
			$("#projectViva").val("0");
			$("#projectStartDate").val("");
			$("#projectEndDate").val("");
		}
		function searchProjects() {
			console.log("searchProjects got called");
            $.ajax({
                type: 'post',
                url: './searchProjects',
                data: $('form').serialize(),
                success: function (response) {
                   console.log("Search completed..... " + response);
                   if(response === "success"){
                	   $("#homeDiv").load("projectHome.jsp");
                   }else{
                	   alert("No Data Found with search criteria");
                   }
                }
            });
			
		}
		$("#projectStartDate").change(function() {

			 if($("#projectStartDate").val() !== ""){
				 if (Date.parse($("#projectStartDate").val()) > Date.parse($("#projectEndDate").val())) {
		               alert('Project Start Date should not greater than End Date.');
		               $("#projectStartDate").val("");
		           }
			 }
		});
		
		$("#projectEndDate").change(function() {
			 if($("#projectEndDate").val() !== ""){
				 if (Date.parse($("#projectStartDate").val()) > Date.parse($("#projectEndDate").val())) {
		               alert('Project End Date should not lesser than Start Date.');
		               $("#projectEndDate").val("");
		           }
			 }
		});
	</script>
</head>
<body>
		<h1 class="w3-xxxlarge w3-text-red"><b>Manager Home</b></h1>
		<hr>
		<form method="post">
		    <div class="divClass">
		    
		    	<table>
		    		<tr>
		    			<th class="cellClass">
		    				<label>Project Name</label>
		    			</th>
		    			<td class="cellClass">
		    				<select id="projectId" name = "projectId" class="">
						      <option value="0">--Select--</option>
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
						      	<option value="6">Not Started</option>
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