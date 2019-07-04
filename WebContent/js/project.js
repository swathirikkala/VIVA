function clearProjectSearchValues() {
	console.log("clearProjectSearchValues got called");
	$("#projectId").val("0");
	$("#projectStatus").val("select");
	$("#projectViva").val("0");
	$("#projectStartDate").val("");
	$("#projectEndDate").val("");
	$("#createdByName").val("");
}

function isValidForm() {
	var isValid = false;
	console.log("isValidForm got called...........");
	if($("#projectId").val() != "0"){
		isValid = true;
	}
	if($("#projectStatus").val() != "select"){
		isValid = true;
	}
	if($("#projectViva").val() != "0"){
		isValid = true;
	}
	if($("#projectStartDate").val() != ""){
		isValid = true;
	}
	if($("#projectEndDate").val() != ""){
		isValid = true;
	}
	if($("#createdByName").val() != ""){
		isValid = true;
	}
	console.log("isValidForm() : " + isValid);
	return isValid;
}




$("#projectStartDate")
.change(
		function() {
			if ($("#projectStartDate").val() !== "") {
				if (Date.parse($("#projectStartDate").val()) > Date
						.parse($("#projectEndDate").val())) {
					alert('Project Start Date should not greater than End Date.');
					$("#projectStartDate").val("");
				}
			}
		});


$("#projectEndDate")
.change(
		function() {
			if ($("#projectEndDate").val() !== "") {
				if (Date.parse($("#projectStartDate").val()) > Date
						.parse($("#projectEndDate").val())) {
					alert('Project End Date should not lesser than Start Date.');
					$("#projectEndDate").val("");
				}
			}
		});