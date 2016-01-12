$(document).ready(function(){
	$('#invite_button, #pending_button, #unpaid_button, #paid_button').off().on('click', function(){
		$('.item').removeClass('selected');
		$(this).addClass('selected');
	});

	$('#invite_button').on('click', function(){
		$('#invitation, #pending, #unpaid, #paid').addClass('hide');
		$('#invitation').removeClass('hide');
	});

	$('#pending_button').on('click', function(){
		$('#invitation, #pending, #unpaid, #paid').addClass('hide');
		$('#pending').removeClass('hide');
	});

	$('#unpaid_button').on('click', function(){
		$('#invitation, #pending, #unpaid, #paid').addClass('hide');
		$('#unpaid').removeClass('hide');
	});

	$('#paid_button').on('click', function(){
		$('#invitation, #pending, #unpaid, #paid').addClass('hide');
		$('#paid').removeClass('hide');
	});

	$('.drop_down').on('click', function(){
		$('.sub_item').addClass('hide');
		$(this).parent().next().removeClass('hide');
	});
});