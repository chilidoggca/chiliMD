document.addEventListener("DOMContentLoaded", () => {
  $( ".nav-link.bar" ).click(function(event) {
    event.preventDefault();
    $( "div.sidebar" ).toggleClass("hidesidebar");
    $( "div.maindiv" ).toggleClass("blur");
  });

  $( "div.maindiv" ).click(function(event) {
    console.log('i\'ve been clicked!');
    $( "div.sidebar" ).addClass("hidesidebar");
    $( "div.maindiv.blur" ).removeClass("blur");
  });

});
