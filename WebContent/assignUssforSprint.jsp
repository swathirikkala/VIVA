<%@page import="com.viva.dto.UserStory"%>
<%@page import="java.util.List"%>
<%@page import="com.viva.dao.UserStoryDao"%>
<%@page import="com.viva.dto.Sprint"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%

	Sprint sprint = (Sprint)request.getSession().getAttribute("sprint");
	if(sprint == null){
		sprint = new Sprint();
	}
	UserStoryDao userStoryDao = new UserStoryDao();
	List<UserStory> ussUnderSprint = userStoryDao.getAllUserStoriesForSprintAddition(sprint.getSprintId());
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
function openUssAssignmentToSprintModalDiv(){
	closeUssAssignmentToSprintModalDiv();
	document.getElementById('ussAssignmentToSprintModalDiv').style.display='block';
}
function closeUssAssignmentToSprintModalDiv(){
	document.getElementById('ussAssignmentToSprintModalDiv').style.display='none';
}
function ussAssignmentToSprint(){
	var assignedUss = [];
	var option='';
	$("#sprintUss").empty();
	$("input[name='sprintUss']:checked").each(function () {
		assignedUss.push($(this).val());
		option='<option value="'+$(this).val()+'" selected="selected">'+$(this).val()+'</option>';
		console.log(option);
		$("#sprintUss").append(option);
	});
	console.log("Selected uss are : " + assignedUss);
	closeUssAssignmentToSprintModalDiv();
}

$(document).ready(function() {
	
});
</script>
</head>
<body>
		<!-- User stories for Sprint Div -->
		<div id="ussAssignmentToSprintModalDiv" class="modal">
		  <span onclick="javascript:closeUssAssignmentToSprintModalDiv()" class="close" title="Close Assignment">&times;</span>
			<form class="modal-content" name="ussAssignmentToSprintForm" id="ussAssignmentToSprintForm">
		    <div class="container">
		      <h1 style="color:green">User Stories</h1>
		      <p style="color:red">Please select User Stories to assign to this Sprint</p>
		      <hr>
			<!--  User stories for Sprint Table -->
			<div class="limiter">
				<div class="table100 ver2 m-b-110" style="overflow:scroll; max-height:500px; min-height:0px; overflow-x: none;">
					<table data-vertable="ver2">
						<tbody id="projectsBody">
							<%	boolean isSprintAssigned = false;
								for(UserStory us: ussUnderSprint) {
							%>
								<tr class="row100 head">
									<td class="column100 width50" data-column="column1">
										<% if(us.getSprint() != 0) {%>
										<input type="checkbox" name="sprintUss" value="<%= us.getId()%>" checked="checked">
										<%}else{ %>
										<input type="checkbox" name="sprintUss" value="<%= us.getId()%>">
										<%} %>
									</td>
									<td>
										<label><%=us.getName() %></label>
									</td>
									<td>
										<input type="text" name="comment" id="comment" placeholder="Add Comment Here">
									</td>
								</tr>
							<% } %>
						</tbody>
					</table>
				</div>
			</div>
			<!-- User stories for Sprint Table ended -->
		    <div class="clearfix">
		     <button type="button" onclick="javascript:closeUssAssignmentToSprintModalDiv()" class="cancelbtn">Cancel</button>
		     <button type="button" class="signupbtn" onclick="ussAssignmentToSprint()">Assign</button>
		    </div>
		    </div>
		  </form>
		  </div>
		<!-- User stories for Sprint Div ended -->
</body>
</html>