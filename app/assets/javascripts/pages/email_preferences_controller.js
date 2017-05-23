function updateAll(checked) {
  $('#email_preference_newsletter').prop('checked',checked);
  $('#email_preference_my_leaderboard').prop('checked',checked);
  $('#email_preference_any_post').prop('checked',checked);
  $('#email_preference_my_topic_post').prop('checked',checked);
  $('#email_preference_any_leaderboard').prop('checked',checked);
}



function optOutAllSetting(){
  if( $('#email_preference_newsletter').is(":checked")
      || $('#email_preference_my_leaderboard').is(":checked")
      || $('#email_preference_any_post').is(":checked")
      || $('#email_preference_my_topic_post').is(":checked")
      || $('#email_preference_any_leaderboard').is(":checked") ) {
        $('#email_preference_opt_out_all').prop('checked',false);
        console.log('some checked');
      } else {
        $('#email_preference_opt_out_all').prop('checked',true);
        console.log('none checked');
      }
}


$(document).on('turbolinks:load', function() {
  $('#email_preference_opt_out_all').change(function(){
    if($(this).is(":checked")) {
      updateAll(false);
    } else {
      updateAll(true);
    }
  });

  $('#email_preference_newsletter').change(function(){
    optOutAllSetting();
  });

  $('#email_preference_my_leaderboard').change(function(){
    optOutAllSetting();
  });

  $('#email_preference_any_post').change(function(){
    optOutAllSetting();
  });

  $('#email_preference_my_topic_post').change(function(){
    optOutAllSetting();
  });

  $('#email_preference_any_leaderboard').change(function(){
    optOutAllSetting();
  });

});
