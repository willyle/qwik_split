$(document).ready(function() {
	var page_url = window.location.href;
	var page_parts = page_url.split('/');

	var dispatcher = new WebSocketRails(page_parts[2] +'/websocket');

	dispatcher.on_open = function(data) {
		console.log('Connection has been established: ', 	data);
	};

	$("#chat_window").scrollTop(function() { return this.scrollHeight; });

	$('#new_message').keydown(function(event){    
		if(event.keyCode==13){
			$('#message_button').trigger('click');
		}
	});

	$("#message_button").click(function() {
		console.log("message button clicked");

		dispatcher.trigger('new_message', {
			trip_id: page_url[page_url.length-1],
			body: $("#new_message").val()
		});

		$("#new_message").val("").focus();
	});

	id = "trip" + page_url[page_url.length-1]
	channel = dispatcher.subscribe(id);

	channel.bind('broadcast', function(data) {
		newest_message = '(' + data.time + ') ' + data.name + ': ' + data.body;
		console.log(newest_message);
		$("#chat_window").append('<div class="message">'+ newest_message + '</div>');
		$("#chat_window").scrollTop(function() { return this.scrollHeight; });
	});
});