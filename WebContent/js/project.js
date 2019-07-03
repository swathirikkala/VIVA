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

function searchProjects() {
	console.log("searchProjects got called");
	console.log($("form[name=projectSearchForm]").serialize());
	var isValid = isValidForm();
	console.log("isValid value in serach projects  : " + isValid);
	if(isValid == false){
		alert("Please give serch criteria before search");
		return;
	}else{
		try {
			$.ajax({
				type : 'post',
				url : './searchProjects',
				data : $("form[name=projectSearchForm]").serialize(),
				success : function(response) {
					console.log("Search completed..... " + response);
					if (response !== "success") {
						console.log("No Data Found with search criteria");
					}
					loadPage('projectsDiv','projectsResultList.jsp');
				},
				error : function(data, status, er) {
					console.log("Error in search prjects jsm : " + data
							+ " status: " + status + " er:" + er);
				}
	
			});
		} catch (e) {
			console.log("Exception in search prjects jsm : " + e);
		}
	}
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