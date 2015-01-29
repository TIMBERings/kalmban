// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require bootstrap
//= require_tree .


window.setTimeout(function() {
    $("#flash_notice").fadeTo(500, 0).slideUp(500, function(){
        $(this).remove(); 
    });
}, 3000);

$(document).ready(function() {
	$('.modal_link').click(function() {
		$('.modal').modal('hide');
	});
});