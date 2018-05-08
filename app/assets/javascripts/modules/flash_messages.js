$(document).on('turbolinks:load', function() {
  setTimeout(function() {
    $('.flash-bar').slideUp(500);
  }, 10000);
});
