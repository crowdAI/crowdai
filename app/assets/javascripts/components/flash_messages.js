$(document).on('turbolinks:load', function() {
  setTimeout(function() {
    $('.success, .info, .notice').slideUp(500);
  }, 5000);
});
