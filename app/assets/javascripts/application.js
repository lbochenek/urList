//= require jquery
//= require jquery_ujs
//= require_tree


// test js link
console.log("application.js loaded");

// all code waits for the page to load
$(document).ready(function () {	
	
	// hide error messages by default
	$('.ur-fname').hide(); 
	$('.ur-lname').hide(); 
	$('.ur-email').hide(); 
	$('.ur-id').hide(); 
	$('.ur-class').hide();
	$('.ur-pass').hide(); 
	$('.ur-conf').hide(); 
	
	// first name cannot be blank
	$( "#user_fName" ).blur(function() {
		if ($( "#user_fName" ).val() == '') {
			$( "#user_fName" ).removeClass( "green-border" ).addClass( "red-border" );
			$('.ur-fname').fadeIn();
		} else { $( "#user_fName" ).removeClass( "red-border" ).addClass( "green-border" );
		$('.ur-fname').hide();
	}
	});
	
	// last name cannot be blank
	$( "#user_lName" ).blur(function() {
		if ($( "#user_lName" ).val() == '') {
			$( "#user_lName" ).removeClass( "green-border" ).addClass( "red-border" );
			$('.ur-lname').fadeIn();
		} else { $( "#user_lName" ).removeClass( "red-border" ).addClass( "green-border" );
		$('.ur-lname').hide();
	}
	});
	
	// email must end in 'rochester.edu'
	$( "#user_email" ).blur(function() {
		var email = $( "#user_email" ).val();
		var email_check = email.substr(email.length - 13);
		if(email_check != "rochester.edu"){
			$( "#user_email" ).removeClass( "green-border" ).addClass( "red-border" );
			$('.ur-email').fadeIn();
		} else {
			$( "#user_email" ).removeClass( "red-border" ).addClass( "green-border" );
			$('.ur-email').hide();
		}
	
	});

	// student id length of 8 numbers
	$( "#user_sID" ).blur(function() {
		var sID = $( "#user_sID" ).val().length;
		if(sID == 8){
			$( "#user_sID" ).removeClass( "red-border" ).addClass( "green-border" );
			$('.ur-id').hide();
		} else {
			$( "#user_sID" ).removeClass( "green-border" ).addClass( "red-border" );
			$('.ur-id').fadeIn();
		}
	});
	
	// class year between 2015-2018
	$( "#user_classYr" ).blur(function() {
		var classYr = $( "#user_classYr" ).val();
		if(classYr != ''){
			$( "#user_classYr" ).removeClass( "red-border" ).addClass( "green-border" );
			$('.ur-class').hide();
		} else {
			$( "#user_classYr" ).removeClass( "green-border" ).addClass( "red-border" );
			$('.ur-class').fadeIn();
		}
	});

	// password of >=6 characters
	$( "#user_password" ).blur(function() {
		var password = $( "#user_password" ).val();
		var password_count = password.length;
		if(password_count >= 6){
			$( "#user_password" ).removeClass( "red-border" ).addClass( "green-border" );
			$('.ur-pass').hide(); //THIS IS NOT GOING AWAY?!?
		} else {
			$( "#user_password" ).removeClass( "green-border" ).addClass( "red-border" );
			$('.ur-pass').fadeIn(); 
		}
	});

	// password confirmation = password
	$( "#user_password_confirmation" ).blur(function() {
		var password = $( "#user_password" ).val();
		var password_confirm = $( "#user_password_confirmation" ).val();
		if(password == password_confirm && password_confirm != ''){
			$( "#user_password_confirmation" ).removeClass( "red-border" ).addClass( "green-border" );
			$('.ur-conf').hide();
		} else {
			$( "#user_password_confirmation" ).removeClass( "green-border" ).addClass( "red-border" );
			$('.ur-conf').fadeIn();
		}
	});



});
