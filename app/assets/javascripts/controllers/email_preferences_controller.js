function updateAll(checked) {
  $('#email_preference_newsletter').prop('checked',checked);
  $('#email_preference_leaderboard_entry').prop('checked',checked);
  $('#email_preference_any_post').prop('checked',checked);
  $('#email_preference_my_topic_post').prop('checked',checked);
  $('#email_preference_new_leader').prop('checked',checked);
}

$(document).on('ready page:load', function() {
  $('#email_preference_opt_out_all').change(function(){
    if($(this).is(":checked")) {
      updateAll(false);
   } else {
      updateAll(true);
   }
  })
});
