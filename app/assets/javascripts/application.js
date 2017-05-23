// ---------------------- Gems ---------------------- //
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require cocoon
//= require rails.validations

//= require turbolinks

// ---------------------- Modules ---------------------- //
//= require modules/site
//= require modules/subnav_tabs
//= require modules/inline_validations
//= require modules/markdown_preview

// ---------------------- Pages ---------------------- //



$(document).on('ajax:error', function(xhr, status, error) {
  console.log(status.responseText);
  console.log(error);
});
