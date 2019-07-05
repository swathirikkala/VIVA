<%@page import="com.viva.dto.Sprint"%>
<%@page import="com.viva.dto.Epic"%>
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
	Epic epic = (Epic)request.getSession().getAttribute("epic");
	if(epic == null){
		epic = new Epic();
	}
	List<Sprint> spintsByEpic = (List<Sprint>)request.getSession().getAttribute("spintsByEpic");
	if(spintsByEpic == null){
		spintsByEpic = new ArrayList<Sprint>();
	}
%>
<meta charset="UTF-8">

<h1 class="w3-xxxlarge w3-text-red"><b>Epic Edit Form </b></h1>
		
		<form method="post" name="epicEditForm" id="epicEditForm">
		    <div class="divClass">
		    	<input type="hidden" name="epicEditId" id="epicEditId">
		    	<table>
		    		<tr>
		    			<th class="cellClass">
		    				<label>Project Name</label>
		    			</th>
		    			<td class="cellClass">
		    				   <select id="editEpicProjectName" name = "editEpicProjectName" >
						       <option value="0" selected="selected">--Select Project--</option>
						      <%for(Project p : projects){%>
						      		<option value="<%= p.getId()%>"><%= p.getName()%></option>
						      <%}%>
						      </select>
		    			</td>
		    			<th class="cellClass">
		    				<label>Epic Name</label>
		    			</th>
		    			<td class="cellClass">
		    				<input type="text" name="editEpicName" id="editEpicName">
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
		    				<label>BV Achieved %</label>
		    			</th>
		    			<td>
		    				<input type="text" name="sprintViva" id="sprintViva" readonly="readonly" value="<%=epic.getViva()%>">
		    			</td>
		    		</tr>
		    		<tr>
		    			<th>
		    				<label>Status</label>
		    			</th>
		    			<td>
		    				<select id="editEpicStatus" name = "editEpicStatus">
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
		    				<select id="editEpicSprintName" name = "editEpicSprintName">
					      		<option value="0">--Select Sprint--</option>
					      		<% for(Sprint s:spintsByEpic){ %>
					      		<option value="<%=s.getSprintId()%>"><%=s.getSprintName() %></option>
					      		<%} %>
					     	 </select>
		    			</td>
		    		</tr>
		    		<tr>
		    			<th>
		    				<label>Description</label>
		    			</th>
		    			<td colspan="3">
		    				<textarea rows="4" placeholder="Epic Description" 
		    				name="editEpicDescription" id="editEpicDescription" 
		    				style="height: 70px;" required="required">
		      				</textarea>
		    			</td>
		    		</tr>
		    	</table>
		    </div>
		    <div>
		    			
		    </div>
		    
		    <div style="margin-left: 35%;">
			    	<button type="button" onclick="editSprint()" class="signupbtn" style="text-align: centre; width:100px;">Save</button>
			    	&nbsp;
			    	<button type="button" onclick="clearEpicEditFields();" class="cancelbtn" style="text-align: centre; width:100px;margin-left: 5px;">Clear</button>
		   	</div>
		  </form>
<script type="text/javascript">

	function clearEpicEditFields() {
		$("#editEpicProjectName").val("0");
		$("#editEpicPriority").val("0");
		$("#editEpicStatus").val("0");
		$("#editEpicSprintName").val("0");
		$("#editEpicDescription").val("");
		$("#editEpicName").val("");
	}
	function validateEditEpicForm(){
		var isValid  = true;
		var errorMessage = "";
		
			if($("#editEpicProjectName").val() === "0"){
				errorMessage+="\n Project Name is Required";
				isValid = false;
			}
			if($("#editEpicName").val() === ""){
				errorMessage+="\n Epic Name is Required";
				isValid = false;
			}
			if($("#editEpicDescription").val() === ""){
				errorMessage+="\n Epic Description is Required";
				isValid = false;
			}
			if(isValid === false){
				alert(errorMessage);
			}
		return isValid;
	}
	function editSprint() {
		var isValidForm = validateEditEpicForm();
		
		console.log("update Epic got called");
		var editEpicForm = $("form[name=epicEditForm]").serialize();
		console.log(editEpicForm);
		try {
			$.ajax({
				type : 'post',
				url : './updateEpic',
				data : editEpicForm,
				success : function(response) {
					console.log("update completed..... " + response);
					if (response !== "success") {
						alert("Update not successfull");
					}else{
						alert("Update successfull");
					}
				},
				error : function(data, status, er) {
					console.log("Error in update Epic jsm : " + data
							+ " status: " + status + " er:" + er);
				}

			});
		} catch (e) {
			console.log("Exception in update Epic jsm : " + e);
		}
	}
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#epicEditId").val("<%=epic.getId()%>");
		$("#editEpicProjectName").val("<%=epic.getProject()%>");
		$("#editEpicPriority").val("<%=epic.getPriority()%>");
		$("#editEpicStatus").val("<%=epic.getStatus()%>");
		$("#editEpicSprintName").val("<%=epic.getSprint()%>");
		$("#editEpicDescription").val("<%=epic.getDescription()%>");
		$("#editEpicName").val("<%=epic.getName()%>");
	});
</script>