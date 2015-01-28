// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {


// Sorting the list
	$('#boards').sortable({
		dropOnEmpty: false,
		cursor: 'crosshair',
		items: 'li',
		opacity: 0.4,
		scroll: true,
		update: function(event, ui){
			$.ajax({
				type: 'post',
				data: $('#boards').sortable('serialize'),
				dataType: 'script',
				complete: function(request){
					ui.item.children('div').effect('highlight', {color: '#375a7f'}, 1500);
				},
				url: '/boards/sort'
			})
		}
	});
});
