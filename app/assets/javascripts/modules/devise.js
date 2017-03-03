$(document).on('turbolinks:load', function() {
  $('.account-help-links').hide();
  $('.show-help-link').hover(function(){
    console.log('show');
    $('.show-help-link').stop(true,true).delay(750).hide(0);
    $('.account-help-links').stop(true,true).delay(750).show(0);
  })
});
