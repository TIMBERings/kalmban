// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var initialColumn;

$(document).ready(function() {	
	$("#to_do_status, #in_progress_status, #completed_status").sortable({
		connectWith: 'ul',	
		scroll: false,		
		revert: true,
		opacity: 0.4,
		scroll: true,

		activate: function(event, ui) {
			initialColumn = ui.item.parent('.status_list');
		},

		receive: function(event, ui) {
			$.ajax({
				type: 'post',
				data: {_method:'PUT',  task: {status: get_status($(ui.item.parent('.status_list')))}},
				complete: function(request){},
				url: 'tasks/' + ui.item.attr('id').split('_')[1]

			}),

			$.ajax({
				type: 'post',
				data: $(this).sortable('serialize'),
				dataType: 'script',
				complete: function(request){
					ui.item.children('div').effect('highlight', {color: '#375a7f'}, 1500);
				},
				url: 'tasks/sort'
			})

			delete_empty_task(get_status($(ui.item.parent('.status_list'))));
			add_empty_task(initialColumn)
		}
	})
});

function get_status(element) {
		return capitalize_every_word(element.attr('data-status').replace('_', ' '));
}

function capitalize_every_word(str) {
	return str.replace(/\w\S*/g, function(txt){
		return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();
	});
}
function delete_empty_task(status) {
	var fillerTaskId = '#'.concat(status).concat('-filler-task').replace(" ", "_");
	$(fillerTaskId).remove();
}

function add_empty_task(column) {
	if(column.children('.task').length == 0) {
		var columnName = get_status(column);
		column.append("<li id='" + columnName.replace(" ", "_") + "-filler-task' class='filler_task'></li>")
	}
}