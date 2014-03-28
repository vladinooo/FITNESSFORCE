/*------------------------------------------------------------------
Project:	Mosaic
Version:	1.2
Created: 		20/01/2014
Last change:	27/02/2014
-------------------------------------------------------------------*/

/* ===== Sticky Navbar ===== */

$(window).load(function(){
	$(".navbar").sticky({ topSpacing: 0 });
});

/* ====== Search box toggle ===== */

$('#nav-search').on('click', function() {
	$(this).toggleClass('show hidden');
	$(this).removeClass('animated flipInX');
	$("#nav-search-close").toggleClass('show hidden');
	$("#nav-search-form").toggleClass('show hidden animated flipInX');
	return false;
});

$('#nav-search-close').on('click', function() {
	$(this).toggleClass('show hidden');
	$("#nav-search").toggleClass('show hidden animated flipInX');
	$("#nav-search-form").toggleClass('show hidden animated flipInX');
	return false;
});

/* Navbar dropdown link bug fix */

$('.navbar-nav > li > a').hover (function() {
	$(this).toggleClass("nav-hover-fix");
	return false;
});

// Style Toggle
// ============

$('.style-toggle-btn').on('click', function() {
	$(".style-toggle").toggleClass("style-toggle-show");
	$(this).toggleClass("fa-gears fa-angle-double-right");
	return false;
});

// Navbar Style Change
// =================

$('#opt-navbar-dark').on('change', function() {
	$(".mini-navbar").addClass("mini-navbar-dark");
	$(".mini-navbar").removeClass("mini-navbar-white");
	$(".navbar").addClass("navbar-dark");
	$(".navbar").removeClass("navbar-white");
	return false;
});

$('#opt-navbar-white').on('change', function() {
	$(".mini-navbar").addClass("mini-navbar-white");
	$(".mini-navbar").removeClass("mini-navbar-dark");
	$(".navbar").addClass("navbar-white");
	$(".navbar").removeClass("navbar-dark");
	return false;
});

$('#opt-navbar-mixed').on('change', function() {
	$(".mini-navbar").addClass("mini-navbar-dark");
	$(".mini-navbar").removeClass("mini-navbar-white");
	$(".navbar").addClass("navbar-white");
	$(".navbar").removeClass("navbar-dark");
	return false;
});

// Footer Style Change
// =================

$('#opt-footer-dark').on('change', function() {
	$("footer").addClass("footer-dark");
	$("footer").removeClass("footer-white");
	return false;
});

$('#opt-footer-white').on('change', function() {
	$("footer").addClass("footer-white");
	$("footer").removeClass("footer-dark");
	return false;
});

// Body Style Change
// =================

$('.style-toggle-body .colors > .green').on('click', function() {
	$("body").addClass("body-green");
	$("body").removeClass("body-blue");
	$("body").removeClass("body-orange");
	$("body").removeClass("body-red");
	return false;
});

$('.style-toggle-body .colors > .blue').on('click', function() {
	$("body").addClass("body-blue");
	$("body").removeClass("body-green");
	$("body").removeClass("body-orange");
	$("body").removeClass("body-red");
	return false;
});

$('.style-toggle-body .colors > .orange').on('click', function() {
	$("body").addClass("body-orange");
	$("body").removeClass("body-green");
	$("body").removeClass("body-blue");
	$("body").removeClass("body-red");
	return false;
});

$('.style-toggle-body .colors > .red').on('click', function() {
	$("body").addClass("body-red");
	$("body").removeClass("body-green");
	$("body").removeClass("body-blue");
	$("body").removeClass("body-orange");
	return false;
});

/* ===== Our Services ===== */

$('.services-item').hover (function() {
	$(this).children("i").toggleClass("fa-rotate-90");
	return false;
});

/* ===== Lost password form ===== */

$('.pwd-lost > .pwd-lost-q > a').on('click', function() {
	$(".pwd-lost > .pwd-lost-q").toggleClass("show hidden");
	$(".pwd-lost > .pwd-lost-f").toggleClass("hidden show animated fadeIn");
	return false;
});

/* ===== Sign Up popovers ===== */

$(function(){
	$('#name').popover();
});

$(function(){
	$('#username').popover();
});

$(function(){
	$('#email').popover();
});

$(function(){
	$('#password').popover();
});

$(function(){
	$('#confirm_password').popover();
});

// Smooth scrolling for UI elements page
// =====================================
$(document).ready(function(){
	$('a[href*=#buttons],a[href*=#panels], a[href*=#info-boards], a[href*=#navs], a[href*=#headlines]').bind("click", function(e){
	  var anchor = $(this);
	  $('html, body').stop().animate({
		scrollTop: $(anchor.attr('href')).offset().top
	  }, 1000);
	  e.preventDefault();
	});
   return false;
});