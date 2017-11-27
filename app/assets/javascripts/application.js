// ---------------------- Gems ---------------------- //
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require jquery.remotipart
//= require cocoon
//= require rails.validations
//= require jQuery-File-Upload
//= require remodal
//= require isInViewport
//= require turbolinks
//= require paloma

// ---------------------- Modules ---------------------- //
//= require modules/site
//= require modules/subnav_tabs
//= require modules/inline_validations
//= require modules/rangy_inputs
//= require modules/markdown_editor
//= require modules/flash_messages
//= require modules/direct_s3_upload

// ---------------------- Pages ---------------------- //
//= require pages/participants_edit
//= require pages/email_preferences_edit

// -------------------- Controllers ------------------- //
//= require controllers/challenges_controller
//= require controllers/leaderboards_controller
//= require controllers/dataset_files_controller
//= require controllers/task_dataset_files_controller



$(document).on('ajax:error', function(xhr, status, error) {
  console.log(status.responseText);
  console.log(error);
});

$(document).on('turbolinks:load', function() {
  $('[data-remodal-id=modal]').remodal();
});

$(document).on('turbolinks:load', function() {
  Paloma.start();
});

function loadMathJax() {
  window.MathJax = null;
  $.getScript("https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.1/MathJax.js?config=TeX-MML-AM_CHTML", function() {
    MathJax.Hub.Config({
      tex2jax: {inlineMath: [["$","$"],["\\(","\\)"]]}
    });
  });
};

$(document).on('turbolinks:load', function() {
  loadMathJax();
});
