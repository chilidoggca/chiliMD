document.addEventListener("DOMContentLoaded", () => {
  $( ".nav-link.bar" ).click(function(event) {
    event.preventDefault();
    $( "div.sidebar" ).toggleClass("hidesidebar");
    $( "div.maindiv" ).toggleClass("blur");
  });

  $( "div.maindiv" ).click(function(event) {
    $( "div.sidebar" ).addClass("hidesidebar");
    $( "div.maindiv.blur" ).removeClass("blur");
  });

  $( ".nav-link.signin" ).click(function(event) {
    event.preventDefault();
    $( "div.sidebar" ).removeClass("hidesidebar");
    $( "div.maindiv" ).addClass("blur");
    $( "#sign_up-tab" ).removeClass("active show");
    $( "#sign_up" ).removeClass("active show");
    $( "#sign_in-tab" ).addClass("active show");
    $( "#sign_in" ).addClass("active show");
  });

});
