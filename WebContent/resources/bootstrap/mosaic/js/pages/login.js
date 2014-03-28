$(document).ready(function() {

	//------------- Validation -------------//
	$("#someTestId").validate({ 
		rules: {
			username: {
				required: true,
				minlength: 3
			}, 
			password: {
				required: true,
				minlength: 6
			}
		}, 
		messages: {
			user: {
				required: "Please provide a username",
				minlength: "Username must be at least 3 characters long"
			},
			password: {
				required: "Please provide a password",
				minlength: "Your password must be at least 5 characters long"
			}
		},
		submitHandler: function(form){
	        var btn = $('#loginBtn');
	        btn.removeClass('btn-primary');
	        btn.addClass('btn-danger');
	        btn.text('Checking ...');
	        btn.attr('disabled', 'disabled');
	        setTimeout(function() {
	        	btn.removeClass('btn-danger');
	        	btn.addClass('btn-success');
	        	btn.text('User find ...');
	        }, 1500);
	        setTimeout(function () {
	        	form.submit();
	        }, 2000);
		}
	});

});