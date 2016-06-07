$(document).on('ready page:load', function() {
  if (!_.isEmpty(gon) && gon.rails.controller == 'challenges' && gon.rails.action == 'edit') {

    function toggleEvents() {
      if ( $('#challenge_perpetual_challenge').is(':checked')){
        $('.events-configuration').hide();
      } else {
        $('.events-configuration').show();
      }
    }

    toggleEvents();  // page load
    $('#challenge_perpetual_challenge')[0].addEventListener('click',toggleEvents);  // user action

  }

  if (!_.isEmpty(gon) && gon.rails.controller == 'challenges' && gon.rails.action == 'show') {

    function adjustProgress() {
      var percent   = gon.percent_progress;
      var ai_red    = '#FF4E48';           // see also _variables.scss
      var ai_white  = '#FFFFFF';
      $('.ai-progressbar').width(percent + '%');
      if(percent < 60) {
        $('.ai-progress-percent').css({'color': ai_red, 'width': percent + '%', 'left': percent + 5 + '%'});
      }
      if(percent >= 60) {
        $('.ai-progress-percent').css({'color': ai_white, 'width': percent + '%'});
      }
    }

    adjustProgress(); 
  }

});
