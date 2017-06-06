// ---------------------- Gems ---------------------- //
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require cocoon
//= require rails.validations
//= require jQuery-File-Upload
//= require turbolinks
//= require remodal.min


// ---------------------- Modules ---------------------- //
//= require modules/site
//= require modules/subnav_tabs
//= require modules/inline_validations
//= require modules/rangy_inputs
//= require modules/markdown_editor
//= require modules/remodal_turbolinks

// ---------------------- Pages ---------------------- //


$(document).on('ajax:error', function(xhr, status, error) {
  console.log(status.responseText);
  console.log(error);
});
