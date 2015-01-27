// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {	
	$(".status_list").sortable({
		connectWith: 'ul',	
		scroll: false,		
		revert: true
	});
});