function w3_open() {
	document.getElementById("mySidebar").style.display = "block";
	document.getElementById("myOverlay").style.display = "block";
}

function w3_close() {
	document.getElementById("mySidebar").style.display = "none";
	document.getElementById("myOverlay").style.display = "none";
}

function loadFunctionalityDiv(funcDiv) {

	try {
		console.log("Selected func div : " + funcDiv);
		$("#stakeHoldersHome").hide();
		$("#projectManagersHome").hide();
		$("#technicalTeamHome").hide();
		$("#projectsHome").hide();
		$("#sprintsHome").hide();
		$("#epicsHome").hide();
		$("#userStoriesHome").hide();
		$("#dashBoardHome").hide();
		$("#adminPanelHome").hide();

		$("#" + funcDiv).show();

	} catch (e) {
		console.log("Error in loading function div : " + e);
	}
}
function displayPopup(divId) {
	document.getElementById(divId).style.display = 'block';
}
function closePopup(divId) {
	document.getElementById(divId).style.display = 'none';
}

function loadMenu(menuDiv, formDiv) {
	console.log(" Selected menu : " + menuDiv);
	$("#" + menuDiv).show();
	displayPopup(formDiv);
}