// ---------------------- Gems ----------------------- //
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require jquery.remotipart
//= require cocoon
//= require rails.validations
//= require isInViewport
//= require turbolinks
//= require paloma
//= require jquery.atwho
//= require social-share-button
//= require codemirror

// --------------------- Vendor ------------------------ //
//= require jQuery-File-Upload
//= require remodal

// ------------------ Vendor / Notebooks --------------- //
//= require ansi_up.min
//= require es5-shim.min
//= require marked.min
//= require notebook.min
//= require prism.min

// ---------------------- Modules ---------------------- //
//= require modules/site
//= require modules/subnav_tabs
//= require modules/inline_validations
//= require modules/rangy_inputs
//= require modules/markdown_editor
//= require modules/flash_messages
//= require modules/direct_s3_upload
//= require modules/mentions

// ---------------------- Pages ---------------------- //
// require pages/participants_edit
// require pages/email_preferences_edit

// -------------------- Controllers ------------------- //
//= require controllers/articles_controller
//= require controllers/challenges_controller
//= require controllers/leaderboards_controller
//= require controllers/dataset_files_controller
//= require controllers/task_dataset_files_controller
//= require controllers/participants_controller
//= require controllers/email_preferences_controller


// ------------------------ STARTUP -------------------------- //
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
      tex2jax: {
            inlineMath: [ ["$","$"],["\\(","\\)"] ],
            displayMath: [ ['$$','$$'], ["\\[","\\]"] ],
            processEscapes: true
      }
    });
  });
};

$(document).on('turbolinks:load', function() {
  loadMathJax();
});

// Remove default Turbolinks loader
Turbolinks.ProgressBar.prototype.refresh = function() {}
Turbolinks.ProgressBar.defaultCSS = ""
var loaderTimer;

$(document).on('turbolinks:click', function() {
  loaderTimer = setTimeout(function(){
    $('#page-content').hide();
    $('#loader-container').show();
  }, 250);
});

$(document).on('turbolinks:load', function() {
  clearTimeout(loaderTimer);
  $('#page-content').show();
  $('#loader-container').hide();
});
