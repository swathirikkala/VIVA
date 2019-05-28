function clearProjectSearchValues() {
	console.log("clearProjectSearchValues got called");
	$("#projectId").val("0");
	$("#projectStatus").val("0");
	$("#projectViva").val("0");
	$("#projectStartDate").val("");
	$("#projectEndDate").val("");
}


function searchProjects() {
	console.log("searchProjects got called");
	console.log($("form[name=projectSearchForm]").serialize());
	try {
		$.ajax({
			type : 'post',
			url : './searchProjects',
			data : $("form[name=projectSearchForm]").serialize(),
			success : function(response) {
				console.log("Search completed..... " + response);
				if (response !== "success") {
					alert("No Data Found with search criteria");
				}
				$("#homeDiv").load("projectHome.jsp");
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