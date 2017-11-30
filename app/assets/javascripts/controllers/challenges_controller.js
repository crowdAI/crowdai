Paloma.controller('Challenges', {
  edit: function(){
    $('.active-switch').click(function(){
      var self = this;
      $('.active-switch').each(function(){
        this.checked = false;
      });
      self.checked = true;
    });
  }
});
