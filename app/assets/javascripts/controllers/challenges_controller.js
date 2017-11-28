Paloma.controller('Challenges', {
  edit: function(){
    $('.active-switch').click(function(){
      var self = this;
      console.log(this);
    });

    $('.active-switch').each(function(){
      this.checked = false;
    });

  /*
    $('.active-switch').click(function(){
      var self = this;
      console.log('go');

      $('.active-switch').each(function(){
        this.checked = false;
      });

      // set values
      self.checked = true;
      // array of all fields
      var parent = self.closest('.nested-fields');
      var start_dates = $("input[name$='[start_dttm_date]']");
      var end_dates = $("input[name$='[end_dttm_date]']");
      var start_times = $("input[name$='[start_dttm_time]']");
      var end_times = $("input[name$='[end_dttm_time]']");

      // target the actual fields
      var start_date = $(parent).find(start_dates).val();
      var end_date = $(parent).find(end_dates).val();
      var start_time = $(parent).find(start_times).val();
      var end_time = $(parent).find(end_times).val();

      // update hidden fields
      $('#challenge_start_dttm_date').val(start_date);
      $('#challenge_end_dttm_date').val(end_date);
      $('#challenge_start_dttm_time').val(start_time);
      $('#challenge_end_dttm_time').val(end_time);
    }); */
  }
});
