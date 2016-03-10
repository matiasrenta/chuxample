//alert("chucky_config");
// ******** Date-time picker ********* -->
$(function() {
	$.datetimepicker.setLocale('es');

	$('.datetimepicker').datetimepicker({
		lazyint : true,
		format : 'd/m/Y H:i'

	});

	$('.date-picker').datetimepicker({
		lazyint : true,
		timepicker : false,
		//mask:true,
		format : 'd/m/Y',
		closeOnDateSelect : true,
		scrollInput : false
	});

	//Mask del datetimepicker
	$('.date-picker').mask('00/00/0000');
	$('.datetimepicker').mask('00/00/0000 00:00');
});

//Mostrar / ocutar detalles en timeline
$(function() {

	$(".show-details").click(function(event) {
		event.preventDefault();
		var elem = $(this).closest("p").next(".detalles");

		$(elem).toggle("slow");

		if ($(this).text() == 'Mostrar detalles') {
			$(this).text('Ocultar detalles');
		} else {
			$(this).text('Mostrar detalles');
		}

	});
});

// TOUR
$(function() {
	// Check width size - Hide for small screens
	function checkWidth() {
		var windowsize = $(window).width();
		if (windowsize < 768) {
			$(".div-tour").hide();

		} else {
			$(".div-tour").show();
		}
	}

	// Execute on load
	checkWidth();
	// Bind event listener
	$(window).resize(checkWidth);

	if ($('[data-step]').length < 4) {
		var ultima = "Sig. Página";
		var multi = true;
	} else {
		var ultima = "Terminar";
		var multi = false;
	}

	if (RegExp('tour2', 'gi').test(window.location.search)) {

		var currentStep = $('[data-step]').length;

		introJs().setOptions({
			'exitOnOverlayClick' : 'true',
			'skipLabel' : 'Cancelar',
			'doneLabel' : ultima,
			'tooltipPosition' : 'auto',
			'positionPrecedence' : ['right', 'left', 'bottom', 'top'],
			'nextLabel' : 'Siguiente',
			'prevLabel' : 'Anterior'
		}).goToStep(currentStep).start().oncomplete(function() {
			checkTour();
		});
	}

	$("#start-tour").click(function(event) {
		event.preventDefault();
		introJs().setOptions({
			'exitOnOverlayClick' : 'true',
			'skipLabel' : 'Cancelar',
			'doneLabel' : ultima,
			'tooltipPosition' : 'auto',
			'positionPrecedence' : ['right', 'left', 'bottom', 'top'],
			'nextLabel' : 'Siguiente',
			'prevLabel' : 'Anterior'
		}).start().oncomplete(function() {
			checkTour();
		});
	});

	function checkTour() {
		if (multi == true) {
			window.location.href = '/welcome/prueba.html?tour2=true';
		} else {
			window.location.search = "";
		}
	}

});

// Tooltips
$(document).ready(function() {
	$('[data-toggle="tooltip"]').tooltip();
	$('a.tooltipwithnofollow[rel="tooltip nofollow"]').tooltip();
});

// ******** Menu Minified ?? ********* -->
$(function() {
	$(".minifyme").click(function() {
		if (Cookies.get('nav') != "min") {
			Cookies.set('nav', 'min', {
				path : '/'
			});
		} else if (Cookies.get('nav') == "min") {
			Cookies.set('nav', 'max', {
				path : '/'
			});
		}
	});
});
$(document).ready(function() {

	//Bootstrap Wizard Validations
	var $validator = $("#wizard-1").validate({

		rules : {
			email : {
				required : true,
				email : "Your email address must be in the format of name@domain.com"
			},
			fname : {
				required : true
			},
			lname : {
				required : true
			},
			country : {
				required : true
			},
			city : {
				required : true
			},
			postal : {
				required : true,
				minlength : 4
			},
			wphone : {
				required : true,
				minlength : 10
			},
			hphone : {
				required : true,
				minlength : 10
			}
		},

		messages : {
			fname : "Please specify your First name",
			lname : "Please specify your Last name",
			email : {
				required : "We need your email address to contact you",
				email : "Your email address must be in the format of name@domain.com"
			}
		},

		highlight : function(element) {
			$(element).closest('.form-group').removeClass('has-success').addClass('has-error');
		},
		unhighlight : function(element) {
			$(element).closest('.form-group').removeClass('has-error').addClass('has-success');
		},
		errorElement : 'span',
		errorClass : 'help-block',
		errorPlacement : function(error, element) {
			if (element.parent('.input-group').length) {
				error.insertAfter(element.parent());
			} else {
				error.insertAfter(element);
			}
		}
	});
});

$(document).ready(function() {

	$('#bootstrap-wizard-1').bootstrapWizard({
		'tabClass' : 'form-wizard',
		'onNext' : function(tab, navigation, index) {
			var $valid = $("#wizard-1").valid();
			if (!$valid) {
				$validator.focusInvalid();
				return false;
			} else {
				$('#bootstrap-wizard-1').find('.form-wizard').children('li').eq(index - 1).addClass('complete');
				$('#bootstrap-wizard-1').find('.form-wizard').children('li').eq(index - 1).find('.step').html('<i class="fa fa-check"></i>');
			}
		}
	});

	// fuelux wizard
	var wizard = $('.wizard').wizard();

	wizard.on('finished', function(e, data) {
		//$("#fuelux-wizard").submit();
		//console.log("submitted!");
		$.smallBox({
			title : "Congratulations! Your form was submitted",
			content : "<i class='fa fa-clock-o'></i> <i>1 seconds ago...</i>",
			color : "#5F895F",
			iconSmall : "fa fa-check bounce animated",
			timeout : 4000
		});

	});
});
// Filtros
$(function() {
	$("#filtrar").click(function(event) {
		$("#filter-zone").slideToggle("slow");
	});
});

//Append help button
var inputWork = $('.field_with_image_rt');
var rel = $(inputWork).attr('data-pop');
var placement = $(inputWork).attr('data-placement');
var title = $(inputWork).attr('data-title');
var content = $(inputWork).attr('data-content');
var icon = $(inputWork).attr('data-icon');
$(inputWork).parent().addClass('input-group add-on').append('<div class="input-group-btn"><button type="button" class="btn btn-default" data-rel="'+rel+'" data-placement="'+placement+'" data-original-title="'+title+'" data-content="'+content+'"><i class="'+icon+'"></i></button></div>');
// activate popovers with hover states
$("[rel=popover-hover], [data-rel=popover-hover]").popover({
	trigger : "hover"
});

// Dropzone
//var thumbnail;
//function back_files(type){
//	thumbnail = $('.dz-image:last');
//	cases_background(type);
//};

//function back_files_news(file, done){
//	thumbnail = $('.dropzone .dz-preview.dz-file-preview .dz-image:last');
//	cases_background(file.type);
//	done();
//}

//function cases_background(type){
//	switch (type) {
//	  case 'application/pdf':
//	  thumbnail.css('background', 'url(../../assets/pdf-icon.png)');
//	  break;
//	  case 'application/vnd.openxmlformats-officedocument.wordprocessingml.document':
//	  thumbnail.css('background', 'url(../../assets/word-icon.png)');
//	  break;
//	  case 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet':
//	  thumbnail.css('background', 'url(../../assets/xls-icon.png)');
//	  break;
//	  case 'text/csv':
//	  thumbnail.css('background', 'url(../../assets/xls-icon.png)');
//	  break;
//	}
//}
//
//function noImage(mockFile){
//	var thumbnail = $('.dz-image:last');
//	var type = mockFile.type;
//		$(thumbnail).each(function (i) {
//			if (type != 'image/png' && type != 'image/jpeg' && type != 'image/jpg' && type != 'image/gif') {
//				$(thumbnail).children().removeAttr('src alt');
//				back_files(type);
//			}
//			return false;
//		});
//}
console.log( $('.bounceIn') );
$('#activity').click(function(e) {
	var $this = $(this);
	//
	// if ($this.find('.badge').hasClass('bg-color-red')) {
	// 	$this.find('.badge').removeClassPrefix('bg-color-');
	// 	$this.find('.badge').text("0");
	// }
	//
	if (!$this.next('.ajax-dropdown').is(':visible')) {
		var theUrlVal = $('input[name="activity"]').attr('id');
		container = $('.ajax-notifications');
		loadURL(theUrlVal, container);
		//clear memory reference
		$this = null;
		theUrlVal = null;
		e.preventDefault();
	}

});

// $('input[name="activity"]').change(function() {
// 	var $this = $(this);
//
// 	url = $this.attr('id');
// 	container = $('.ajax-notifications');
//
// 	loadURL(url, container);
//
// 	//clear memory reference
// 	$this = null;
// });
