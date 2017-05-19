$(document).on('turbolinks:load', function() {
  setTimeout(function() {
    $('.flash-success, .flash-info, .flash-notice').slideUp(500);
  }, 5000);
});
