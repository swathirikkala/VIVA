<%@page import="com.viva.dao.util.LookUp"%>
<%@page import="com.viva.db.util.CacheUtil"%>
<%@page import="com.viva.dto.EpicBv"%>
<%@page import="com.viva.dto.BusinessValue"%>
<%@page import="java.util.List"%>
<%@page import="com.viva.dao.EpicBvDao"%>
<%@page import="com.viva.dto.Epic"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Epic epic = (Epic)request.getSession().getAttribute("epic");
	EpicBvDao epicBvDao = new EpicBvDao();
	List<EpicBv> epicBvs = epicBvDao.getEBvsByEpic(epic.getId());
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
function openUpdateBvsForEpicModalDiv(){
	closeUpdateBvsForEpicModalDiv();
	document.getElementById('updateBvsForEpicModalDiv').style.display='block';
}
function closeUpdateBvsForEpicModalDiv(){
	document.getElementById('updateBvsForEpicModalDiv').style.display='none';
	
}
function assignBvs(){
	var bvs = [];
	var selectedBvCbs='';
	var selectedBvComments = '';
	
	$("input[name='epicBvs']:checked").each(function () {
		bvs.push($(this).val());
		selectedBvCbs += '<input type="checkbox" name="updatedEpicBvs" value="'+$(this).val()+'" checked="checked"></br>';
		var comment = $("#comment_"+$(this).val()).val();
		selectedBvComments += '<input type="text" name="comment_'+$(this).val()+'" id="comment_'+$(this).val()+'" value="'+comment+'">';
		console.log(selectedBvCbs);
		console.log(selectedBvComments);
	});
	
	console.log("Selected bvs are : " + bvs);
	$("#selectedEbvs").html(selectedBvCbs);
	$("#epicCommentsDiv").html(selectedBvComments);
	closeUpdateBvsForEpicModalDiv();
}

$(document).ready(function() {
	
});
</script>
</head>
<body>
		
		<div id="updateBvsForEpicModalDiv" class="modal">
		  <span onclick="javascript:closeUpdateBvsForEpicModalDiv()" class="close" title="Close Assignment">&times;</span>
			<form class="modal-content" name="ussAssignmentToSprintForm" id="ussAssignmentToSprintForm">
		    <div class="container">
		      <h1 style="color:green">BVs</h1>
		      <p style="color:red">Please select BVs to assign to this Epic</p>
		      <hr>
			<div class="limiter">
				<div class="table100 ver2 m-b-110" style="overflow:scroll; max-height:500px; min-height:0px; overflow-x: none;">
					<table data-vertable="ver2">
					<thead>
							<tr class="row100 head">
								<th class="column100 width50" data-column="column1"></th>
								<th class="column100 width100" data-column="column2">BV Name</th>
								<th class="column100 width75" data-column="column1">Comment</th>
							</tr>
						</thead>
						<tbody id="projectsBody">
							<%for(BusinessValue bv: CacheUtil.allBusinessValues) {
								EpicBv ebv =  LookUp.searchEpicBv(epicBvs, bv.getId());
							%>
								<tr class="row100 head">
									<td class="column100 width50" data-column="column1">
										<% if(ebv != null){ %>
											<input type="checkbox" name="epicBvs" value="<%=bv.getId() %>" checked="checked">
										<%} else { %>
											<input type="checkbox" name="epicBvs" value="<%=bv.getId() %>">
										<%} %>
									</td>
									<td class="column100 width100" data-column="column2">
										<%=bv.getName()%>
									</td>
									<td class="column100 width75" data-column="column1">
										<% if(ebv != null){ %>
											<input type="text" name="<%= "comment_" + bv.getId() %>" id="<%= "comment_" + bv.getId() %>" value="<%=ebv.getComment()%>">
										<%} else { %>
											<input type="text" name="<%= "comment_" + bv.getId() %>" id="<%= "comment_" + bv.getId() %>">
										<%} %>
										
									</td>
								</tr>
							<%} %>
						</tbody>
					</table>
				</div>
			</div>
		    <div class="clearfix">
		     <button type="button" onclick="javascript:closeUpdateBvsForEpicModalDiv()" class="cancelbtn">Cancel</button>
		     <button type="button" class="signupbtn" onclick="javascript:assignBvs()">Assign</button>
		    </div>
		    </div>
		  </form>
		  </div>
</body>
</html>