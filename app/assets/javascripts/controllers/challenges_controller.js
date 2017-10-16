Paloma.controller('Challenges', {
  edit: function(){
    $('.active-switch').click(function(){
      var self = this;
      $('.active-switch').each(function(){
        this.checked = false;
      });

      // set values
      self.checked = true;
      // array of all fields
      var parent = self.closest('.nested-fields');
      var start_dates = $("input[name$='[start_date]']");
      var end_dates = $("input[name$='[end_date]']");
      var start_times = $("input[name$='[start_time]']");
      var end_times = $("input[name$='[end_time]']");

      // target the actual fields
      var start_date = $(parent).find(start_dates).val();
      var end_date = $(parent).find(end_dates).val();
      var start_time = $(parent).find(start_times).val();
      var end_time = $(parent).find(end_times).val();

      // update hidden fields
      $('#challenge_start_date').val(start_date);
      $('#challenge_end_date').val(end_date);
      $('#challenge_start_time').val(start_time);
      $('#challenge_end_time').val(end_time);
    });
  }
});
