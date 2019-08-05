<%@page import="com.viva.dao.UsBvDao"%>
<%@page import="com.viva.dto.UsBv"%>
<%@page import="com.viva.dto.UserStory"%>
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

	UserStory userStoryForEdit = (UserStory)request.getSession().getAttribute("userStoryForEdit");
	if(userStoryForEdit == null){
		userStoryForEdit = new UserStory();
	}
	UsBvDao usBvDao = new UsBvDao();
	List<UsBv> usBvs = usBvDao.getUsBvsByUsId(userStoryForEdit.getId());
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
function openUpdateBvsForUsModalDiv(){
	closeUpdateBvsForUsModalDiv();
	document.getElementById('updateBvsForUsModalDiv').style.display='block';
}
function closeUpdateBvsForUsModalDiv(){
	document.getElementById('updateBvsForUsModalDiv').style.display='none';
}
function assignUsBvs(){
	var bvs = [];
	var selectedBvCbs='';
	var selectedBvComments = '';
	
	$("input[name='usBvs']:checked").each(function () {
		var bvId = $(this).val();
		bvs.push(bvId);
		selectedBvCbs += '<input type="checkbox" name="updatedusBvs" value="'+bvId+'" checked="checked"></br>';
		var comment = $("#us_comment_"+bvId).val();
		console.log("bvId :::::::::::::::::::::: " + bvId+" , comment :: " + comment);
		selectedBvComments += '<input type="text" name="updatedUsComment_'+bvId+'" id="updatedUsComment_'+bvId+'" value="'+comment+'">';
		console.log(selectedBvCbs);
		console.log(selectedBvComments);
	});
	
	console.log("Selected bvs are : " + bvs);
	$("#usbvs").html(selectedBvCbs);
	$("#usCommentsDiv").html(selectedBvComments);
	closeUpdateBvsForUsModalDiv();
}

$(document).ready(function() {
	
});
</script>
</head>
<body>
		
		<div id="updateBvsForUsModalDiv" class="modal">
		  <span onclick="javascript:closeUpdateBvsForUsModalDiv()" class="close" title="Close Assignment">&times;</span>
			<form class="modal-content" name="assignBvsToUsForm" id="assignBvsToUsForm">
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
								UsBv usBv =  LookUp.searchUsBv(usBvs, bv.getId());
								if(usBv == null){
							%>
								<tr class="row100 head">
									<td class="column100 width50" data-column="column1">
										<input type="checkbox" name="usBvs" value="<%=bv.getId() %>">
									</td>
									<td class="column100 width100" data-column="column2">
										<%=bv.getName() %>
									</td>
									<td class="column100 width75" data-column="column1">
										<input type="text" name="<%= "us_comment_" + bv.getId() %>" id="<%= "us_comment_" + bv.getId() %>">
									</td>
								</tr>
							<%} 
							}%>
						</tbody>
					</table>
				</div>
			</div>
		    <div class="clearfix">
		     <button type="button" onclick="javascript:closeUpdateBvsForUsModalDiv()" class="cancelbtn">Cancel</button>
		     <button type="button" class="signupbtn" onclick="javascript:assignUsBvs()">Assign</button>
		    </div>
		    </div>
		  </form>
		  </div>
</body>
</html>