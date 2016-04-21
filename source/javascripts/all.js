// This is where it all goes :)

$(document).ready(function() {
  $('#nav-button').click(function(e) {
    e.preventDefault();
    $('.nav ul').toggle("fast");
  });
});
