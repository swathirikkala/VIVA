function addSprint(){

	try {
		var sprint = new Object();
		sprint.sprintName= $("#sprintName").val();
		sprint.projectId= $("#projectName").val();
		sprint.sprintPriority= $("#sprintPriority").val();
		sprint.estimatedHours= $("#estimatedHours").val();
		sprint.consumedHours= '0';
		sprint.startDate = $("#startDate").val();
		sprint.endDate = $("#endDate").val();

		$.ajax({
			url : "./addSprint",
			type : 'POST',
			dataType : 'json',
			data : JSON.stringify(sprint),
			contentType : 'application/json',
			mimeType : 'application/json',

			success : function(data) {
				var respJSONString = JSON.stringify(data);
				console.log(respJSONString);
				var jsonObj = JSON.parse(respJSONString);
				console.log(jsonObj.responseCode + " : "+ jsonObj.responseMessage+" : " + data.responseObject );
				alert(jsonObj.responseMessage);
				closePopup('sprintRegistrationDiv');
			},

			error : function(data, status, er) {
				alert("error: " + data + " status: " + status + " er:" + er);
			}
		});
	} catch (ex) {
		alert(ex);
	}
}

function displaySprints(){
	try {
		var sprint = new Object();
		sprint.projectId = '2';
		//project.assignedManager = sessionStorage.getItem("userId");
		$.ajax({
			url : "./getSpintsByProject",
			type : 'POST',
			dataType : 'json',
			data : JSON.stringify(sprint),
			contentType : 'application/json',
			mimeType : 'application/json',

			success : function(data) {
				var respJSONString = JSON.stringify(data);
				console.log(respJSONString);
				var jsonObj = JSON.parse(respJSONString);
				console.log(jsonObj.responseCode + " : "
						+ jsonObj.responseMessage+" : " + data.responseObject );

				$('#sprintsBody').empty();
				//var userNames = sessionStorage.getItem("userNames");
				//console.log("userNames : " + userNames);
				$.each(data.responseObject, function (i, sprint) {
					console.log("sprintRow : " + sprint);
					var sprintRow = '<tr class="row100">';
					sprintRow+='<td class="column100 column1" data-column="column1">';

					sprintRow+='<a href="javascript:void(0);" onClick="javascript:updateSprint();">'+sprint.sprintId+'</a></td>';
					sprintRow+='<td class="column100 column2" data-column="column2">'+sprint.sprintName+'</td>';
					var pn = sessionStorage.getItem(sprint.projectId);
					sprintRow+='<td class="column100 column1" data-column="column1">'+pn+'</td>';
					sprintRow+='<td class="column100 column1" data-column="column1">'+sprint.sprintPriority+'</td>';
					sprintRow+='<td class="column100 column1" data-column="column1">'+sprint.startDate+' </td>';
					sprintRow+='<td class="column100 column6" data-column="column6">'+sprint.endDate+' </td>';
					sprintRow+='<td class="column100 column7" data-column="column7">'+sprint.estimatedHours+' </td>';
					sprintRow+='<td class="column100 column7" data-column="column7">'+sprint.consumedHours+' </td>';
					sprintRow += '</tr>';
					$('#sprintsBody').append(sprintRow);

				});
			},

			error : function(data, status, er) {
				alert("displaySprints error: " + data + " status: " + status + " er:" + er);
			}
		});
	} catch (ex) {
		alert(ex);
	}
}