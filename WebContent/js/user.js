
function enableLogin(opName) {
	if(opName == 'Login'){
		$("#regDiv").hide();
		$("#loginDiv").show();
	}else{
		$("#regDiv").show();
		$("#loginDiv").hide();
	}
}

function registration() {

	// get inputs
	try {
        console.log("Registration call started...............");
		var user = new Object();
		user.firstName = $('#firstName').val();
		user.lastName = $('#lastName').val();
		user.dob = $('#dob').val();
		user.emailId = $('#emailId').val();
		user.department = $('#department').val();
		user.designation = $('#designation').val();
		user.password = $('#password').val();
		user.securityQuestion = $('#securityQuestion').val();
		user.securityAnswer = $('#securityAnswer').val();
		

		$.ajax({
			url : "./userRegistration",
			type : 'POST',
			dataType : 'json',
			data : JSON.stringify(user),
			contentType : 'application/json',
			mimeType : 'application/json',

			success : function(data) {
				var respJSONString = JSON.stringify(data);
				console.log(respJSONString);
				var jsonObj = JSON.parse(respJSONString);
				console.log(jsonObj.responseCode + " : " + jsonObj.responseMessage);
				if(jsonObj.responseCode == 1){
					alert("User Registration Success.");
					window.location="./index.html"
				}else{
					alert("User User Authorization Failed.\n please verify details");
				}
			},

			error : function(data, status, er) {
				alert("error: " + JSON.stringify(data) + " status: " + status + " er:" + er);
				window.location="./index.html"
			}
        });
        console.log("Registration call Ended...............");
	} catch (ex) {
		alert(ex);
		window.location="./index.html"
	}
}


function login() {

	// get inputs
	try {
		var user = new Object();
		user.emailId = $('#loginEmailId').val();
		user.password = $('#loginPassword').val();

		$.ajax({
			url : "./userLogin",
			type : 'POST',
			dataType : 'json',
			data : JSON.stringify(user),
			contentType : 'application/json',
			mimeType : 'application/json',

			success : function(data) {
				var respJSONString = JSON.stringify(data);
				console.log(respJSONString);
				var jsonObj = JSON.parse(respJSONString);
                console.log(jsonObj.responseCode + " : " + jsonObj.responseMessage);
                console.log(jsonObj.responseCode == 1);
				if(jsonObj.responseCode == 1){
					// Check browser support for session storage
					
					if (typeof(Storage) !== "undefined") {
						// Store
						var responseObject =JSON.parse(JSON.stringify(data.responseObject));
	                    var deptId = responseObject.department;
						sessionStorage.setItem("userId", responseObject.emailId);
						sessionStorage.setItem("deptId", deptId);
						console.log("User Id stored in session storage. " + sessionStorage.getItem("userId"));
	                    console.log("Department : " + deptId);
					} else {
						console.log("Sorry, your browser does not support Web Storage...");
					}
                    alert("User Login Success.");
                    var landingPage = '';
                    if(deptId == 1){
                        landingPage = "home.html";
                    }
                    
					
				}else{
					alert("User login Failed.\n please verify credentials");
				}
			},

			error : function(data, status, er) {
				alert("error: " + data + " status: " + status + " er:" + er);
			}
		});
	} catch (ex) {
		alert(ex);
	}
}
function getUsers(landingPage){
	try {
		var user = new Object();
		user.emailId = sessionStorage.getItem("userId");
		$.ajax({
			url : "./getAllUsers",
			type : 'POST',
			dataType : 'json',
			data : JSON.stringify(user),
			contentType : 'application/json',
			mimeType : 'application/json',

			success : function(data) {
				var respJSONString = JSON.stringify(data);
				console.log(respJSONString);
				var jsonObj = JSON.parse(respJSONString);
                console.log(jsonObj.responseCode + " : " + jsonObj.responseMessage);
                //var userNames = new Map();
                $.each(data.responseObject, function (i, user) {
                	var name = user.firstName + " " + user.lastName;
                	var emailId = user.emailId;
                	//userNames.set(emailId , name);
                	sessionStorage.setItem(emailId, name);
                });
                //console.log("User map :" + userNames);
                //sessionStorage.setItem("userNames", userNames);
                
                window.location="./"+landingPage;
			},

			error : function(data, status, er) {
				alert("error: " + data + " status: " + status + " er:" + er);
			}
		});
	} catch (ex) {
		alert(ex);
	}
}
function logout(){
	sessionStorage.setItem("userId", "");
	alert("Successfully log out.");
	window.location="./index.html"
}
function checkLogin(){
	var userId = sessionStorage.getItem("userId");
	if(userId == ""){
		alert("Please Login.");
		window.location = "./index.html";
	}
}