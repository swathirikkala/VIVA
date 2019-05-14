function addProject(){

	try {
		var project = new Object();
		project.projectName = $("#projectName").val();
		project.priority = $("#projectPriority").val();
		project.estimatedHours=$("#estimatedHours").val();
		project.consumedHours = '0';
		project.assignedManager = $("#assignedMenager").val();
		project.createdBy = sessionStorage.getItem("userId");
		$.ajax({
			url : "./addProject",
			type : 'POST',
			dataType : 'json',
			data : JSON.stringify(project),
			contentType : 'application/json',
			mimeType : 'application/json',

			success : function(data) {
				var respJSONString = JSON.stringify(data);
				console.log(respJSONString);
				var jsonObj = JSON.parse(respJSONString);
				console.log(jsonObj.responseCode + " : "+ jsonObj.responseMessage+" : " + data.responseObject );
				alert(jsonObj.responseMessage);
				closePopup('projectRegistrationDiv');
			},

			error : function(data, status, er) {
				alert("error: " + data + " status: " + status + " er:" + er);
			}
		});
	} catch (ex) {
		alert(ex);
	}
}

function displayProjects(){
	try {
		var project = new Object();
		project.assignedManager = sessionStorage.getItem("userId");
		$.ajax({
			url : "./assignedProjects",
			type : 'POST',
			dataType : 'json',
			data : JSON.stringify(project),
			contentType : 'application/json',
			mimeType : 'application/json',

			success : function(data) {
				var respJSONString = JSON.stringify(data);
				console.log(respJSONString);
				var jsonObj = JSON.parse(respJSONString);
				console.log(jsonObj.responseCode + " : "
						+ jsonObj.responseMessage+" : " + data.responseObject );

				$('#projectsBody').empty();
				//var userNames = sessionStorage.getItem("userNames");
				//console.log("userNames : " + userNames);
				$.each(data.responseObject, function (i, project) {
					var projectRow = '<tr class="row100">';
					projectRow+='<td class="column100 column1" data-column="column1">';
					console.log(JSON.stringify(project));
					console.log(JSON.stringify(project));
					projectRow+='<a href="javascript:void(0);" onClick="javascript:updateProject();">'+project.projectId+'</a></td>';
					projectRow+='<td class="column100 column2" data-column="column2">'+project.projectName+'</td>';
					projectRow+='<td class="column100 column1" data-column="column1">'+project.priority+'</td>';
					projectRow+='<td class="column100 column1" data-column="column1">'+project.estimatedHours+'</td>';
					projectRow+='<td class="column100 column1" data-column="column1">'+project.consumedHours+' </td>';
					var am = sessionStorage.getItem(project.assignedManager);
					var cb = sessionStorage.getItem(project.createdBy);
					projectRow+='<td class="column100 column6" data-column="column6">'+am+' </td>';
					projectRow+='<td class="column100 column7" data-column="column7">'+cb+' </td>';
					projectRow += '</tr>';
					$('#projectsBody').append(projectRow);

				});
			},

			error : function(data, status, er) {
				alert("error: " + data + " status: " + status + " er:" + er);
			}
		});
	} catch (ex) {
		alert(ex);
	}
}
function updateProject(){
	displayPopup('projectRegistrationDiv');
	$("#projectIdFieldDiv").show();
	$("#updateProjectBtn").show();
	$("#deleteProjectBtn").show();
	$("#addProjectBtn").hide();
	
}