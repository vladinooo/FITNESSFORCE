$(document).ready(function() {
	if (window.location.href.indexOf("admin_edit_user") > -1) {
		expandUsersTab();
	}
	if (window.location.href.indexOf("delete_user") > -1) {
		expandUsersTab();
	}
});

function expandUsersTab() {
	$("#usersTab").addClass("current");
	$("#usersTab ul").addClass("sub expand show");
	$("#usersTab ul li:nth-child(2)").addClass("current");
}