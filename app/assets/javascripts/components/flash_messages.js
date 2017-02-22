$(document).on('turbolinks:load', function() {
  setTimeout(function() {
    $('.alert').filter('.alert-success, .alert-info').slideUp(500);
  }, 5000);
});
