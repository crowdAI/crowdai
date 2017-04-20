//= require jquery
//= require jquery_ujs

//= require turbolinks


$(document).on('ajax:error', function(xhr, status, error) {
  console.log(status.responseText);
  console.log(error);
});
