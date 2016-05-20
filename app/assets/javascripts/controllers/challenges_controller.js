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
});
