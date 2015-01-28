// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var task_id = "";
$(document).ready(function() {	
	$(".status_list").sortable({
		connectWith: 'ul',	
		scroll: false,		
		revert: true,
		opacity: 0.4,
		scroll: true,
		update: function(){
			$.ajax({
				type: 'post',
				data: $(this).sortable('serialize'),
				dataType: 'script',
				complete: function(request){
					$('.status_list').effect('highlight');
				},
				url: 'tasks/sort'
			})
		},

		receive: function(event, ui) {
			$.ajax({
				type: 'post',
				data: {_method:'PUT',  task: {status: get_status($(this))}},
				url: 'tasks/' + ui.item.attr('id').split('_')[1]
			})
			// alert(ui.item.html());
		}
	})
});

function get_status(element) {
	if(element.attr('data-status') == "to_do") {
		return "To Do";
	}	else if(element.attr('data-status') == "in_progress") {
		return "In Progress";
	} else if(element.attr('data-status') == "complete") {
		return "Complete";
	}
}