$(document).on('change', '.btn-file :file', function() {
	var input = $(this),
	numFiles = input.get(0).files ? input.get(0).files.length : 1,
	label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
	input.trigger('fileselect', [numFiles, label]);
});

$(document).ready( function() {
	$('.btn-file :file').on('fileselect', function(event, numFiles, label) {

		var input = $(this).parents('.input-group').find(':text'),
		log = numFiles > 1 ? numFiles + ' files selected' : label;

	if( input.length ) {
		input.val(log);
	} else {
		if( log ) alert(log);
	}

	});

	var clip = new ZeroClipboard($('.clip-emoji'));
});

$(function () {
	$('[data-toggle="popover"]').popover();

	$('body').on('click', function (e) {
		$('[data-toggle="popover"]').each(function () {
			if (!$(this).is(e.target) && $(this).has(e.target).length === 0 && $('.popover').has(e.target).length === 0) {
				$(this).popover('hide');
			}
		});
	});
})


//$(function () {
	//$('[data-toggle="tooltip"]').tooltip({
		//trigger: "manual",
		//template: '<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'	
	//});

	//$('[data-toggle="tooltip"]').on({
		//"click": function(){
			//$(this).tooltip("toggle");
		//}
	//});
//})

//$(document).on('shown.bs.tooltip', function() {
	//var tooltip = $('div .tooltip').children('.tooltip-inner');
	//var link = tooltip.html();
	//tooltip.remove();
	//$('div .tooltip').append('<input value="'+link+'" class="tooltip-inner" /> ');
	//$('div .tooltip').on('click', function() {
		//$(this).children('.tooltip-inner').focus();
	//});

//});

