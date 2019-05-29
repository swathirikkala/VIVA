<%@page import="com.viva.dto.Project"%>
<%@page import="com.viva.dao.ProjectDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.viva.dto.Epic"%>
<%@page import="java.util.List"%>
<%

	ProjectDao projectDao = new ProjectDao();
	List<Project> projects = projectDao.getProjects();
	if(projects == null){
		projects = new ArrayList<Project>();
	}

%>
<html>
<head>

</head>
<body>
<br>
<h1 class="w3-xxxlarge w3-text-red"><b>Sprint Search </b></h1>

<br>
<form method="post" name="editSprintForm" id="editSprintForm">
		    <div class="divClass">
		    	<table>
		    		<tr>
		    			<th class="cellClass" style="width: 80px;">
		    				<label>Project</label>
		    			</th>
		    			<td class="cellClass" style="width: 300px;">
		    				   <select id="searchProjectName" name = "searchProjectName" >
						       <option value="" selected="selected">--Select Project--</option>
						      <%for(Project p : projects){%>
						      		<option value="<%= p.getId()%>"><%= p.getName()%></option>
						      <%}%>
						      </select>
		    			</td>
		    			<th class="cellClass"  style="width: 80px;">
		    				<label>Sprint</label>
		    			</th>
		    			<td class="cellClass"  style="width: 300px;">
		    				 <select id="searchSprintName" name = "searchSprintName" >
						       <option value="" selected="selected">--Select Sprint--</option>
						      
						      </select>
		    			</td>
		    		
		    			<td class="cellClass">
		    				<button type="button" onclick="searchSprint()" class="signupbtn" style="text-align: centre; width:100px; margin-top: -10px;">Search</button>
		    			</td>
		    			<th class="cellClass">
		    				<label></label>
		    			</th>
		    		</tr>
		    		
		    	</table>
		    </div>
		  </form>
		  <hr>
	
<script type="text/javascript">
	$(document).ready(function() {
		
	});
</script>
</html>