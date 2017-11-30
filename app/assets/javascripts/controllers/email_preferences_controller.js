function emailFrequencyVisiblity(){
  if(($('#email_preference_challenges_followed').is(':checked')) || ($('#email_preference_mentions').is(':checked'))){
    $('#email-frequency').show();
  } else {
    $('#email-frequency').hide();
  }
}


Paloma.controller('EmailPreferences', {
  edit: function(){
    emailFrequencyVisiblity();

    // checkboxes cannot be directly checked off
    $('#email_preference_receive_every_email,#email_preference_receive_daily_digest,#email_preference_receive_weekly_digest').each(function(){
      var self = this;
      if($(self).is(':checked')){
        $(self).prop('disabled',true);
      }
    });

    $('#email_preference_challenges_followed,#email_preference_mentions').change(function(){
      emailFrequencyVisiblity();
    })

    // checkboxes act as radio buttons and control each other
    $('#email_preference_receive_every_email').change(function(){
      var self = this;
      if($(self).is(":checked")){
        $(self).prop('disabled',true);
        $('#email_preference_receive_daily_digest').prop('disabled',false);
        $('#email_preference_receive_weekly_digest').prop('disabled',false);
        $('#email_preference_receive_daily_digest').attr('checked',false);
        $('#email_preference_receive_weekly_digest').attr('checked',false);
      }
    });

    $('#email_preference_receive_daily_digest').change(function(){
      var self = this;
      if($(self).is(":checked")){
        $(self).prop('disabled',true);
        $('#email_preference_receive_every_email').prop('disabled',false);
        $('#email_preference_receive_weekly_digest').prop('disabled',false);
        $('#email_preference_receive_every_email').attr('checked',false);
        $('#email_preference_receive_weekly_digest').attr('checked',false);
      }
    });

    $('#email_preference_receive_weekly_digest').change(function(){
      var self = this;
      if($(self).is(":checked")){
        $(self).prop('disabled',true);
        $('#email_preference_receive_every_email').prop('disabled',false);
        $('#email_preference_receive_daily_digest').attr('checked',false);
        $('#email_preference_receive_every_email').attr('checked',false);
        $('#email_preference_receive_daily_digest').attr('checked',false);
      }
    });

  }
});
