//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require cocoon
//= require components/flash_messages

//= require turbolinks
//= require site
//= require subnav_tabs
//= require rails.validations
//= require inline_validations


$(document).on('ajax:error', function(xhr, status, error) {
  console.log(status.responseText);
  console.log(error);
});
