<%@page import="com.viva.dao.util.LookUp"%>
<%@page import="com.viva.dto.Project"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.viva.dao.ProjectDao"%>
<%
	ProjectDao projectDao = new ProjectDao();
	List<Project> projects = projectDao.getProjects();
	if(projects == null){
		projects = new ArrayList<Project>();
	}
%>
<meta charset="UTF-8">
<style type="text/css">
	.cellClass{
			width: 200px;
			padding-right: 25px;
		}
</style>
<h1 class="w3-xxxlarge w3-text-red"><b>Epic Edit Form </b></h1>
		
		<form method="post" name="epicEditForm" id="epicEditForm">
		    <div class="divClass">
		    
		    	<table>
		    		<tr>
		    			<th class="cellClass">
		    				<label>Project Name</label>
		    			</th>
		    			<td class="cellClass">
		    				   <select id="editEpicProjectName" name = "editEpicProjectName" >
						       <option value="" selected="selected">--Select Project--</option>
						      <%for(Project p : projects){%>
						      		<option value="<%= p.getId()%>"><%= p.getName()%></option>
						      <%}%>
						      </select>
		    			</td>
		    			<th class="cellClass">
		    				<label>Epic Name</label>
		    			</th>
		    			<td class="cellClass">
		    				<input type="text" name="editEpicName" id="editEpicName" readonly="readonly">
		    			</td>
		    		</tr>
		    		<tr>
			    		<th>
			    			<label>Priority</label>
			    			</th>
			    			<td>
			    				<select id="editEpicPriority" name = "editEpicPriority">
						      		<option value="0">--Select--</option>
						      		<% for(String p : LookUp.getPriorities()){ %>
						      			<option value="<%=p%>"><%=p%></option>
							      	<%} %>
						     	 </select>
			    			</td>
			    			
		    			<th>
		    				<label>VIVA%</label>
		    			</th>
		    			<td>
		    				<input type="text" name="sprintViva" id="sprintViva" disabled="disabled" value="">
		    			</td>
		    		</tr>
		    		<tr>
		    			<th>
		    				<label>Status</label>
		    			</th>
		    			<td>
		    				<select id="editSprintStatus" name = "editSprintStatus">
					      		<option value="0">--Select--</option>
					      		<% for(String s : LookUp.getStatuses()){ %>
					      			<option value="<%= s%>"><%= s%></option>
						      	<%} %>
					     	 </select>
		    			</td>
		    			
		    			<th class="cellClass">
		    				<label>Sprint Name</label>
		    			</th>
		    			<td class="cellClass">
		    				<select id="editSprintName" name = "editSprintName">
					      		<option value="0">--Select--</option>
					      		<% for(String s : LookUp.getStatuses()){ %>
					      			<option value="<%= s%>"><%= s%></option>
						      	<%} %>
					     	 </select>
		    			</td>
		    		</tr>
		    		<tr>
		    			
		    	
		    		</tr>
		    		<tr>
		    			<th>
		    				<label>Description</label>
		    			</th>
		    			<td colspan="3">
		    				<textarea rows="4" cols="50" placeholder="Sprint Description" name="editSprintDescription" id="editSprintDescription" 
		    				style="height: 70px;" required="required">
		      				</textarea>
		    			</td>
		    		</tr>
		    	</table>
		    </div>
		    
		    <div style="margin-left: 35%;">
			    	<button type="button" onclick="editSprint()" class="signupbtn" style="text-align: centre; width:100px;">Save</button>
			    	&nbsp;
			    	<button type="button" onclick="clearProjectEditFields();" class="cancelbtn" style="text-align: centre; width:100px;margin-left: 5px;">Clear</button>
		   	</div>
		  </form>