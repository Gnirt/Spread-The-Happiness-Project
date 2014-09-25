$(document).ready(function($) {
	$('.datepicker').datepicker({
		format: "yyyy/mm/dd",
		weekStart: 0,
		endDate: "now",
		todayHighlight: true
	});
});