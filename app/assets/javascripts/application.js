//= require jquery
//= require jquery_ujs
//= require_tree
//= require jquery.remotipart

//used http://www.sitepoint.com/asynchronous-file-uploads-rails/ to learn how to use remotipart

// test js link
console.log("application.js loaded");

// all code waits for the page to load
$(document).ready(function () {	
	
	// hide error / account messages by default
	$('.ur-fname').hide(); 
	$('.ur-lname').hide(); 
	$('.ur-email').hide(); 
	$('.ur-id').hide(); 
	$('.ur-class').hide();
	$('.ur-pass').hide(); 
	$('.ur-conf').hide();
	$('.title-error').hide();
	$('.price-error').hide();
	$('.content-error').hide();
	$('.delete-account').hide();
	$("#temp-header").hide();
	$('.submit-error').hide();
	$('.no-results').hide();


	// all code waits for ajax call to finish
	$(document).ajaxComplete(function() {
		// hide error / account messages by default
		$('.ur-fname').hide(); 
		$('.ur-lname').hide(); 
		$('.ur-email').hide(); 
		$('.ur-id').hide(); 
		$('.ur-class').hide();
		$('.ur-pass').hide(); 
		$('.ur-conf').hide();
		$('.title-error').hide();
		$('.price-error').hide();
		$('.content-error').hide();
		$('.delete-account').hide();
		$("#temp-header").hide();
		$('.submit-error').hide();
		$('.no-results').hide();
	
	
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
	
	// class year
	$( "#user_classYr" ).focus(function() {
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
			$('.ur-pass').hide(); 
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

  
	
	
// // all code waits for ajax call to finish
// $(document).ajaxComplete(function() {
	// listings must have a title
	$( "#listing_title" ).keyup(function() {
		var title = $( "#listing_title" ).val();
		var title_count = title.length;
		if(title_count != 0){
			$( "#listing_title" ).removeClass( "red-border" ).addClass( "green-border" );
			$('.title-error').hide(); 
		} else {
			$( "#listing_title" ).removeClass( "green-border" ).addClass( "red-border" );
			$('.title-error').fadeIn(); 
		}
	});
	
	// listing price can be empty, or a number, but not text
	$( "#listing_price" ).keyup(function() {
		var price = $( "#listing_price" ).val();
		if($.isNumeric(price)){
			$( "#listing_price" ).removeClass( "red-border" ).addClass( "green-border" );
			$('.price-error').hide(); 
		} else if(price.length == 0) {
			$( "#listing_price" ).removeClass( "red-border" ).addClass( "green-border" );
			$('.price-error').hide();
	} else {
			$( "#listing_price" ).removeClass( "green-border" ).addClass( "red-border" );
			$('.price-error').fadeIn(); 
		}
	});
	
	// listing content of >=15 characters
	$( "#listing-content" ).keyup(function() {
		var content = $( "#listing-content" ).val();
		var content_count = content.length;
		if(content_count >= 15){
			$( "#listing-content" ).removeClass( "red-border" ).addClass( "green-border" );
			$('.content-error').hide(); 
		} else {
			$( "#listing-content" ).removeClass( "green-border" ).addClass( "red-border" );
			$('.content-error').fadeIn(); 
		}
	});
	
	
	// on sucussful post, remove boarders & any error messages. Display a nice post-success message
	
	
	$( "#post-submit" ).click(function() {
		var post_test = $( "#listing_title" ).hasClass( "green-border" ) && $( "#listing_price" ).hasClass( "green-border" ) && $( "#listing-content" ).hasClass( "green-border" );
		console.log(post_test);
		if(post_test == false){
			console.log('form error message');
			$('.submit-error').fadeIn();
		} else {
			$('.submit-error').hide();
			
			$( "#listing_title" ).removeClass( "red-border" ).removeClass( "green-border" );
			$('.title-error').hide(); 
			
			$( "#listing_price" ).removeClass( "red-border" ).removeClass( "green-border" );
			$('.price-error').hide();
			
			$( "#listing-content" ).removeClass( "red-border" ).removeClass( "green-border" );
			$('.content-error').hide(); 
		}
	});
// });
	
	
	
	// jQuery search bar
	//http://www.designchemical.com/blog/index.php/jquery/live-text-search-function-using-jquery/
	
	$("#filter").keyup(function(){
 
		var filter = $(this).val(), count = 0;
 
		$(".listing-link").each(function(){
 
			if ($(this).text().search(new RegExp(filter, "i")) < 0) {
	                $(this).fadeOut();
 
								} else {
	                $(this).show();
									count++;
	            }
						
	        });
			var listCount = count;
			console.log(count);
			
			if (count == 0){
			//put error message here
				$('.no-results').fadeIn();
			} else {
				$('.no-results').hide();
			}
	    });
		
	
			
			
	// disable serach submit via enter key
			$("#live-search").keypress(function(e) {
			  if (e.which == 13) {
			    return false;
			  }
			});
	// show all on clear
			$("#clear").click(function(){
				console.log('clear clicked');
				$(".listing-link").each(function(){
					$(this).show();
				});
			});
	
		
});