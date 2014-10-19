//= require jquery
//= require jquery_ujs
//= require_tree

// start off by hiding success and error messages 
$('.send-success').hide();
$('.send-error').hide();




// make sure user entered first name
  $('form input[name="fname"]').blur(function () {
    var fname = $(this).val();
      if (fname == 0) {
        $('form input[name="fname"]').removeClass("green-border").addClass("red-border");
}     else {
    $('form input[name="fname"]').removeClass("red-border").addClass("green-border");
}

});  

// make sure user entered last name
  $('form input[name="lname"]').blur(function () {
    var fname = $(this).val();
      if (fname == 0) {
        $('form input[name="lname"]').removeClass("green-border").addClass("red-border");
}     else {
    $('form input[name="lname"]').removeClass("red-border").addClass("green-border");
}

});  


// make sure user entered password
  $('form input[name="password"]').blur(function () {
    var fname = $(this).val();
      if (fname == 0) {
        $('form input[name="password"]').removeClass("green-border").addClass("red-border");
}     else {
    $('form input[name="password"]').removeClass("red-border").addClass("green-border");
}

});  



// email verification
//requirements: A-Z characters, numbers + @, .edu domain
$('form input[name="email"]').blur(function () {
    var email = $(this).val();
    var re = /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.edu/igm;
if (re.test(email)) {
    $('form input[name="email"]').removeClass("red-border").addClass("green-border");
    $('.email-error').hide();
} else {
    $('form input[name="email"]').removeClass("green-border").addClass("red-border");
    $('.email-error').fadeIn();
}

});  
  
// studentid verification
// requirements: 8 integers
  $('form input[name="studentid"]').blur(function () {
    var studentid = $(this).val();
    var re = /^[0-9]{8}$/;
      if (re.test(studentid)) {
        $('form input[name="studentid"]').removeClass("red-border").addClass("green-border");
        $('.id-error').hide();
}     else {
    $('form input[name="studentid"]').removeClass("green-border").addClass("red-border");
    $('.id-error').fadeIn();
}

});  



// check that each entry meets criteria
function fNameCheck(){
  var fname = $('#fname').val();
  return fname.length > 0;
};

function lNameCheck(){
  var lname = $('#lname').val();
  return lname.length > 0;
};

function passwordCheck(){
  var pass = $('#password').val();
  return pass.length > 0;
};

function emailCheck(){
  var email = $('#email').val();
  var re = /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.edu/igm;
  return (re.test(email));
};

function studentidCheck(){
  var studentid = $('#studentid').val();
  var re = /^\d{8}(-\d{4})?(?!-)$/;
  return (re.test(studentid));
};


// check if all entries meet criteria
function canSubmit(){
  return fNameCheck() && lNameCheck() && emailCheck() && studentidCheck() && passwordCheck();
};

// post data to mySQL if all meets criteria
function enableSubmit(){
  if(canSubmit()){
    // insert function to post to mySQL here... ruby gem??
    //
    //
    //
    //
    //
    console.log("success");
    
    // reset form borders and remove entered text
    // remove error message, if there
    // add success message
    
    document.getElementById("form").reset();
    $('.send-error').hide();
    $('form input[name="studentid"]').removeClass("green-border");
    $('form input[name="email"]').removeClass("green-border");
    $('form input[name="password"]').removeClass("green-border");
    $('form input[name="lname"]').removeClass("green-border");
    $('form input[name="fname"]').removeClass("green-border");
    $('.send-success').fadeIn(); 
    $('.send-success').fadeOut(3000);
    // source: http://api.jquery.com/fadeout/

   
  } else {
    console.log("submit blocked");
    $('.send-error').fadeIn();
  }
}