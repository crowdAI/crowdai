Paloma.controller('Challenges', {
  edit: function(){
    $('.switch').click(function(){
      var self = this;
      $('.switch').each(function(){
        this.checked = false;
      });

      // set values
      self.checked = true;
      var parent = self.closest('.nested-fields');
      var start_dates = $("input[name$='[start_date]']");
      var end_dates = $("input[name$='[end_date]']");
      var start_times = $("input[name$='[start_time]']");
      var end_times = $("input[name$='[end_time]']");

      var start_date = $(parent).find(start_dates).val();
      var end_date = $(parent).find(end_dates).val();
      var start_time = $(parent).find(start_times).val();
      var end_time = $(parent).find(end_times).val();

      $('#challenge_start_date').val(start_date);
      $('#challenge_end_date').val(end_date);
      $('#challenge_start_time').val(start_time);
      $('#challenge_end_time').val(end_time);

      //var x = parent.$( "input[name$='start_date']" ).val( "a letter" );
      //$('#challenge_start_date').val(self.)
    });
  }
});
