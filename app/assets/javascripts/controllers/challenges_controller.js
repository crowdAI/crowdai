
$(document).on('ready page:load', function() {
  /* --------------------------------- challenges / edit ---------------------------------------- */
  if (!_.isEmpty(gon) && gon.rails.controller == 'challenges' && gon.rails.action == 'edit') {

    function toggleEvents() {
      if ( $('#challenge_perpetual_challenge').is(':checked')){
        $('.events-configuration').hide();
      } else {
        $('.events-configuration').show();
      }
    }

    toggleEvents();  // page load
    expandSidebar();
    $('#challenge_perpetual_challenge')[0].addEventListener('click',toggleEvents);  // user action
  } /* challenges / edit */



  /* --------------------------------- challenges / index --------------------------------------- */
  if (!_.isEmpty(gon) && gon.rails.controller == 'challenges' && gon.rails.action == 'index') {

    var container_fluid_height = $('.container-fluid')[0].offsetHeight;
    var viewport_height = $(window).height();
    var challenges_container_height = $('.challenges-container')[0].offsetHeight;
    var additional_height = viewport_height - container_fluid_height;
    console.log(container_fluid_height);
    console.log(viewport_height);

    if (additional_height > 0) {
      $('.challenges-container')[0].style.height = (challenges_container_height + additional_height) + 'px';
    }
  } /* challenges / index */



  /* --------------------------------- challenges / show --------------------------------------- */
  if (!_.isEmpty(gon) && gon.rails.controller == 'challenges' && gon.rails.action == 'show') {

    function adjustProgress(percent) {
      $('.ai-progressbar').width(percent + '%');
    }

    function adjustText(percent) {
      var ai_red    = '#FF4E48';           // source: _variables.scss
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

    expandSidebar();
    adjustProgress(gon.percent_progress);
    adjustText(gon.percent_progress);
  } /* challenges / show */

});
