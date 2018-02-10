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

});
