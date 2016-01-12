$(document).ready(function(){
	$('#expenses_button, #chat_button, #details_button').off().on('click', function(){
		$('.item').removeClass('selected');
		$(this).addClass('selected');
	});

	$('#expenses_button').on('click', function(){
		$('#trip_expenses, #trip_chat, #trip_details').addClass('hide');
		$('#trip_expenses').removeClass('hide');
	});

	$('#chat_button').on('click', function(){
		$('#trip_expenses, #trip_chat, #trip_details').addClass('hide');
		$('#trip_chat').removeClass('hide');
	});
	
	$('#details_button').on('click', function(){
		$('#trip_expenses, #trip_chat, #trip_details').addClass('hide');
		$('#trip_details').removeClass('hide');
	});

	$('.item').on('click', function(){
		$('.sub_items').addClass('hide');
		$(this).next('.sub_items').toggle();
	});
});