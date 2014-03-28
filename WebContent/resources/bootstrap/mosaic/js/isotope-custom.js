/*------------------------------------------------------------------
Project:	Mosaic
Version:	1.2
Created: 		20/01/2014
Last change:	27/02/2014
-------------------------------------------------------------------*/

// Isotop Gallery 
// ==============

// Layout
$('#isotope-container').isotope({
	// options
	itemSelector : '.isotope-item',
	layoutMode : 'fitRows'
});

// Filtering
var $container = $('#isotope-container');
	$container.isotope({
});
$('#filters a').click(function(){
	var selector = $(this).attr('data-filter');
	$container.isotope({ filter: selector });
	return false;
});