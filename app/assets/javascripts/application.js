//= require jquery
//= require jquery_ujs

//= require turbolinks
//= require site

$(document).on('ajax:error', function(xhr, status, error) {
  console.log(status.responseText);
  console.log(error);
});
