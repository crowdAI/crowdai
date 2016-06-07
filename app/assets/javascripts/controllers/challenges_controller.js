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

    function adjustProgress(percent) {
      $('.ai-progressbar').width(percent + '%');
    }


    function adjustText(percent) {
      var ai_red    = '#FF4E48';           // see also _variables.scss
      var ai_white  = '#FFFFFF';
      var screen_width = $(window).width();
      console.log(screen_width);
      console.log(percent);
      if(screen_width < 690) {
        $('.ai-progress-text').css('visibility','hidden');
      } else {
        if(percent < 60) {
          $('.ai-progress-text').css({'color': ai_red, 'width': percent + '%', 'left': percent + 5 + '%'});
        }
        if(percent >= 60) {
          $('.ai-progress-text').css({'color': ai_white, 'width': percent + '%'});
        }
      }
    }


    adjustProgress(gon.percent_progress);
    adjustText(gon.percent_progress);
  }

});
