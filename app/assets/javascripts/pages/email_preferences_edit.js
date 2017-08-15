$(document).on('turbolinks:load', function() {
  $('#email_preference_receive_every_email').change(function(){
    var self = this;
    if($(self).is(":checked")){
      $('#email_preference_receive_daily_digest').prop('disabled',false);
      $('#email_preference_receive_weekly_digest').prop('disabled',false);
      $('#email_preference_receive_daily_digest').attr('checked',false);
      $('#email_preference_receive_weekly_digest').attr('checked',false);
    }
  });

  $('#email_preference_receive_daily_digest').change(function(){
    var self = this;
    if($(self).is(":checked")){
      $('#email_preference_receive_every_email').prop('disabled',false);
      $('#email_preference_receive_weekly_digest').prop('disabled',false);
      $('#email_preference_receive_every_email').attr('checked',false);
      $('#email_preference_receive_weekly_digest').attr('checked',false);
    }
  });

  $('#email_preference_receive_weekly_digest').change(function(){
    var self = this;
    if($(self).is(":checked")){
      $('#email_preference_receive_every_email').prop('disabled',false);
      $('#email_preference_receive_daily_digest').attr('checked',false);
      $('#email_preference_receive_every_email').attr('checked',false);
      $('#email_preference_receive_daily_digest').attr('checked',false);
    }
  });
});
