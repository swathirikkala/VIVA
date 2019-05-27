<html>
<head>

</head>
<body>
<h1 class="w3-xxxlarge w3-text-red"><b>Sprint View/Edit</b></h1>
<hr>
		<form method="post" action="./editProject">
		    <div class="divClass">
		    
		    	<table>
		    		<tr>
		    			<th class="cellClass">
		    				<label>Project Name</label>
		    			</th>
		    			<td class="cellClass">
		    				<input type="hidden" name="projectId" id="projectId" required="required" value="">
		    				<input type="text" name="editProjectName" id="editProjectName" required="required" value="">
		    			</td>
		    			<th>
		    				<label>VIVA%</label>
		    			</th>
		    			<td>
		    				<input type="text" name="viva" id="viva" disabled="disabled" value="">
		    			</td>
		    		
		    			<th class="cellClass">
		    				<label>Start Date</label>
		    			</th>
		    			<td class="cellClass">
		    				<input type="date" placeholder="Project Start Date" name="editProjectStartDate" id="editProjectStartDate"  class="">
		    			</td>
		    		</tr>
		    		<tr>
		    			<th>
		    			<label>Priority</label>
		    			</th>
		    			<td>
		    				<select id="editProjectPriority" name = "editProjectPriority">
					      		<option value="0">--Select--</option>
<%-- 					      		<% for(String p : LookUp.getPriorities()){ %> --%>
<%-- 					      			<option value="<%=p%>"><%=p%></option> --%>
<%-- 						      	<%} %> --%>
					     	 </select>
		    			</td>
		    			<th>
		    				<label>Status</label>
		    			</th>
		    			<td>
		    				<select id="editProjectStatus" name = "editProjectStatus">
					      		<option value="0">--Select--</option>
<%-- 					      		<% for(String s : LookUp.getStatuses()){ %> --%>
<%-- 					      			<option value="<%= s%>"><%= s%></option> --%>
<%-- 						      	<%} %> --%>
					     	 </select>
		    			</td>
		    			<th class="cellClass">
		    				<label>End date</label>
		    			</th>
		    			<td class="cellClass">
					    	<input type="date" placeholder="Project End Date" name="editEndDate" id="editEndDate"  class="">
		    			</td>
		    	
		    		</tr>
		    		<tr>
		    			<th>
		    				<label>Description</label>
		    			</th>
		    			<td colspan="5">
		    				<textarea rows="4" cols="50" placeholder="Project Description" name="editProjectDescription" id="editProjectDescription" style="height: 100px;" required="required">
		      				</textarea>
		    			</td>
		    		</tr>
		    	</table>
		    </div>
		    
		    <div style="margin-left: 35%;">
			    	<button type="submit" class="signupbtn" style="text-align: centre; width:100px;">Save</button>
			    	&nbsp;
			    	<button type="button" onclick="clearProjectEditFields();" class="cancelbtn" style="text-align: centre; width:100px;margin-left: 5px;">Clear</button>
		   	</div>
		  </form>
	
<script type="text/javascript">
	$(document).ready(function() {
// 		$("#sprintsTable").load("sprintsResultList.jsp");
  	});
</script>
</html>