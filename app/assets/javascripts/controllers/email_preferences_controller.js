function updateAll(checked) {
  $('#email_preference_newsletter').prop('checked',checked);
  $('#email_preference_my_leaderboard').prop('checked',checked);
  $('#email_preference_any_post').prop('checked',checked);
  $('#email_preference_my_topic_post').prop('checked',checked);
  $('#email_preference_any_leaderboard').prop('checked',checked);
}


function uncheckOptOutAll(){
  $('#email_preference_opt_out_all').prop('checked',false);
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
    if($(this).is(":checked")) {
      uncheckOptOutAll();
    }
  });

  $('#email_preference_my_leaderboard').change(function(){
    if($(this).is(":checked")) {
      uncheckOptOutAll();
    }
  });

  $('#email_preference_any_post').change(function(){
    if($(this).is(":checked")) {
      uncheckOptOutAll();
    }
  });

  $('#email_preference_my_topic_post').change(function(){
    if($(this).is(":checked")) {
      uncheckOptOutAll();
    }
  });

  $('#email_preference_any_leaderboard').change(function(){
    if($(this).is(":checked")) {
      uncheckOptOutAll();
    }
  });

});
