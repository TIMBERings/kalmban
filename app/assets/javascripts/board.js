// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {


// Sorting the list
	$('#boards').sortable({
		axis: 'y',
		dropOnEmpty: false,
		cursor: 'crosshair',
		items: 'li',
		opacity: 0.4,
		scroll: true,
		update: function(){
			$.ajax({
				type: 'post',
				data: $('#boards').sortable('serialize'),
				dataType: 'script',
				complete: function(request){
					$('#boards').effect('highlight');
				},
				url: '/boards/sort'
			})
		}
	});
});
