

$(document).ready(function() {
	
	//-------- Admin navigation tab --------------//
	if (window.location.href.indexOf("do_admin_create_user") > -1) {
		expandUsersTab();
	}
	if (window.location.href.indexOf("edit_user") > -1) {
		highlightProfileTab();
	}
	if (window.location.href.indexOf("admin_edit_user") > -1) {
		expandUsersTab();
	}
	if (window.location.href.indexOf("delete_user") > -1) {
		expandUsersTab();
	}
	if (window.location.href.indexOf("do_create_article") > -1) {
		expandAriclesTab();
	}
	if (window.location.href.indexOf("edit_article") > -1) {
		expandAriclesTab();
	}
	if (window.location.href.indexOf("delete_article") > -1) {
		expandAriclesTab();
	}
	if (window.location.href.indexOf("do_create_session") > -1) {
		expandTimetableTab();
	}
	if (window.location.href.indexOf("edit_session") > -1) {
		expandTimetableTab();
	}
	if (window.location.href.indexOf("delete_session") > -1) {
		expandTimetableTab();
	}
	populateArticleTextarea();
	
	
	//-------- Home page --------------//
	if ($(".ff-topic").length) {
		$("div.wrapper div.topic").show();
	}
	
	//-------- Active nav buttons --------------//
	var uri = window.location.href.substr(window.location.href.lastIndexOf("/") + 1);
	$("ul.navbar-nav  li a").each(function() {
		var hrefUri = $($(this).attr("href").split("/")).get(-1);
		if (hrefUri == uri) {
			$(this).parent().addClass("active").siblings().removeAttr("active");
		}
	});
	
	var uri = window.location.href.substr(window.location.href.lastIndexOf("/rules") + 1);
	$("ul.navbar-nav  li a").each(function() {
		var hrefUri = $($(this).attr("href").split("/")).get(-1);
		if (hrefUri == uri) {
			$(this).parent().addClass("active").siblings().removeAttr("active");
		}
	});
	
	var uri = window.location.href.substr(window.location.href.lastIndexOf("/timetable") + 1);
	$("ul.navbar-nav  li a").each(function() {
		var hrefUri = $($(this).attr("href").split("/")).get(-1);
		if (hrefUri == uri) {
			$(this).parent().addClass("active").siblings().removeAttr("active");
		}
	});
	
	var uri = window.location.href.substr(window.location.href.indexOf("/view_article?articleid=") + 1);
	$("ul.navbar-nav  li a").each(function() {
		var hrefUri = $($(this).attr("href").split("/")).get(-1);
		if (hrefUri == uri) {
			$(this).parent().parent().parent().addClass("active").siblings().removeAttr("active");
		}
	});
	
	var uri = window.location.href.substr(window.location.href.lastIndexOf("/shop") + 1);
	$("ul.navbar-nav  li a").each(function() {
		var hrefUri = $($(this).attr("href").split("/")).get(-1);
		if (hrefUri == uri) {
			$(this).parent().addClass("active").siblings().removeAttr("active");
		}
	});

});



function highlightProfileTab() {
	$("#profileTab").addClass("current");
}

function expandUsersTab() {
	$("#usersTab").addClass("current");
	$("#usersTab ul").addClass("sub expand show");
	$("#usersTab ul li:nth-child(2)").addClass("current");
}

function expandAriclesTab() {
	$("#articlesTab").addClass("current");
	$("#articlesTab ul").addClass("sub expand show");
	$("#articlesTab ul li:nth-child(2)").addClass("current");
}

function expandTimetableTab() {
	$("#timetableTab").addClass("current");
	$("#timetableTab ul").addClass("sub expand show");
	$("#timetableTab ul li:nth-child(2)").addClass("current");
}


//-------- Article content textarea --------------//

function populateArticleTextarea() {
	var content = $("#articleTextareaOutput").text();
	$("#articleTextareaInput textarea").val(content);
}



