<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="javax.jws.soap.SOAPBinding.Use"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.viva.dto.User"%>
<%@page import="java.util.List"%>
<%@page import="com.viva.dto.Project"%>

<%
	List<User> managers = (List<User>)request.getSession().getAttribute("managers");
	if(managers == null)
		managers = new ArrayList();
	String userId = String.valueOf(request.getSession().getAttribute("userId"));
	String userName = String.valueOf(request.getSession().getAttribute("userName"));
	List<Project> lastUpdatedProjectsList = (List<Project>)request.getSession().getAttribute("lastUpdatedProjectsList");
	if(null == lastUpdatedProjectsList){
		lastUpdatedProjectsList = new ArrayList<>();
	}
%>
<style>
input[type=text] {
  width: 200px;
}
</style>
		<h1 class="w3-xxxlarge w3-text-red"><b>Projects</b></h1>
		<hr>
	    		<form action="">
	    		<table class="cleanClass">
	    			<tr class="cleanClass">
	    				<td class="cleanClass">
	    				<input type="text" id="searchProjectValue" name="searchProjectValue" required="required" style="width: 40%;">
	    					
	    				</td>
	    				<td class="cleanClass">
	    					<button type="submit" class="signupbtn" >Search</button>
	    				</td>
	    			</tr>
	    		</table>
	    		</form>
	    <p>
	   	 <button onclick="displayPopup('addProjectFormDiv')" style="width:auto;">Create New Project</button>
	    </p>
    	<!-- Project Creation Div -->
		<div id="addProjectFormDiv" class="modal">
		  <span onclick="closePopup('addProjectFormDiv')" class="close" title="Close Modal">&times;</span>
			<form class="modal-content" method="post" action="./addProject">
		    <div class="container">
		      <h1>Add Project</h1>
		      <p>Please fill in the form to add the Project</p>
		      <hr>
			   <label for="projectName"><b>Project Name</b></label><label style="color: red;">&nbsp;*</label>
			   <input type="text" placeholder="Project Name" name="projectName" id="projectName" required>
		      
		      
			   <label for="projectSeverity"><b>Project Severity</b></label><label style="color: red;">&nbsp;*</label>
			     <select id="projectSeverity" name = "projectSeverity" required>
		      		<option value="1">High</option>
			      	<option value="2">Medium</option>
			      	<option value="3">Low</option>
			      	<option value="4">No Severity</option>
		     	 </select>
			   <label for="projectStartDate"><b>Project Start Date</b></label><label style="color: red;">&nbsp;*</label>
			   <input type="date" placeholder="Project Start Date" name="projectStartDate" id="projectStartDate" required>
			   
			   <label for="projectEndDate"><b>Project End Date</b></label><label style="color: red;">&nbsp;*</label>
			   <input type="date" placeholder="Project End Date" name="projectEndDate" id="projectEndDate" required>
			   
			   
			   <label for="createdBy"><b>Created By</b></label><label style="color: red;">&nbsp;*</label>
			   <input type="hidden" placeholder="Created By" name="createdBy" id="createdBy" required value="<%= userId %>>">
			   <input type="text" placeholder="Created By" name="createdByName" id="createdByName" required value="<%= userName %>" disabled="disabled">
			   
		      <label for="departmentDescription"><b>Project Manager</b></label><label style="color: red;">&nbsp;*</label>
		      <select id="projectManager" name = "projectManager" required>
		      <%for(User user : managers){%>
		      		<option value="<%= userId%>"><%= userName%></option>
		      <%}%>
		      </select>
		      
		      <label for="projectDescription"><b>Project Description</b></label><label style="color: red;">&nbsp;*</label>
		      <textarea rows="4" cols="50" placeholder="Project Description" name="projectDescription" id="projectDescription" style="height: 100px;">
		      </textarea>
		      
		      <div class="clearfix">
		        <button type="button" onclick="closePopup('addProjectFormDiv')" class="cancelbtn">Cancel</button>
		        <button type="submit" class="signupbtn" id="saveDepartmentDiv">Save</button>
		      </div>
		    </div>
		  </form>
		</div>
		<!-- Project Creation Div ended -->
		
<!-- Projects Table -->
			<div class="limiter">
				<div class="table100 ver2 m-b-110" style="overflow:scroll; max-height:500px; min-height:0px; overflow-x: none;">
					<table data-vertable="ver2">
						<thead>
							<tr class="row100 head">
								<th class="column100 width50" data-column="column1">ID</th>
								<th class="column100 width100" data-column="column2">Project</th>
								<th class="column100 width50" data-column="column1">Priority</th>
								<th class="column100 width75" data-column="column1">Start Date</th>
								<th class="column100 width75" data-column="column1">End Date</th>
								<th class="column100 width50" data-column="column6">Status</th>
								<th class="column100 width100" data-column="column7">Created By</th>
								<th class="column100 width100" data-column="column7">Actions</th>
							</tr>
						</thead>
						<tbody id="projectsBody">
							<% for(Project p : lastUpdatedProjectsList){ %>
								<tr class="row100 head">
									<td class="column100 width50" data-column="column1">PRJ<%=p.getId()%></td>
									<td class="column100 width100" data-column="column2"><%=p.getName() %></ttdh>
									<td class="column100 width50" data-column="column1"><%=p.getPriority() %></td>
									<td class="column100 width75" data-column="column1"><%=p.getStartDate() %></td>
									<td class="column100 width75" data-column="column1"><%=p.getEndDate() %></td>
									<td class="column100 width50" data-column="column6"><%=p.getStatus() %></td>
									<td class="column100 width100" data-column="column7"><%=p.getCreatedBy() %></td>
									<td class="column100 width100" data-column="column7">
										<a href="./sprintHome?projectId=<%=p.getId()%>">view</a><br>
										<a href="#">edit</a>
									</td>
								</tr>
							<%} %>
						</tbody>
					</table>
				</div>
			</div>
		<!-- Projects Table ended -->
		
<script type="text/javascript">
	
	function displayPopup(divId){
		  document.getElementById(divId).style.display='block';
		}
		function closePopup(divId){
		  document.getElementById(divId).style.display='none';
		}
	function openModal(divName) {
		
	}
</script>

	<script>
    $(document).ready(function() {
    	try{
    	$(".cleanClass").removeAttr("style");
    	$('#searchProjectValue').attr('style','');
    	$("#searchProjectValue").removeAttr("style");
    	}catch(e){
    		
    		console.log(e);
    	}
      });
	
	
</script>