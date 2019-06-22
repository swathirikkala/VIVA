<%
	String userName = String.valueOf(request.getSession().getAttribute("userName"));
	if(userName == null){
		userName = "";
	}
%>
<html>
<head>
<style type="text/css">
	.cellClass{
			width: 200px;
			padding-right: 10px;
		}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		var uname = '<%=userName%>';
		console.log("user name : " + uname);
		if("null" === uname ){
			alert("Session expired please login again.");
			window.location="./index.jsp";
		}
	});
</script>
</head>
<body>

	<!-- User invitation  Div started-->
	<jsp:include page="inviteUser.jsp"/>
	<!-- User invitation Div ended -->
	<label class="w3-xxxlarge w3-text-red"><b>Sprint Home</b></label>
	<label class="w3-xxxlarge" style="color: green;margin-left: 55%;">Welcome </label>
	<label class="w3-xxxlarge" style="color: blue;"><%=userName %></label>	
	<button type="button" onclick="openUserInvitePopup();" class="signupbtn" 
		style="text-align: centre; width:150px; margin-top: 2px;">Invite User </button>
</html>