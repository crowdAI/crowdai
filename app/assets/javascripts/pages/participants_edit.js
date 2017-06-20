$(document).on('turbolinks:load', function() {
  $('.url').blur(function() {
    var self = this;
    $(self).val($(self).val().toLowerCase());
    var url = $(self).val();
    if (url && (url.substr(0,7) !== 'http://') && (url.substr(0,8) !== 'https://')){
      $(self).val('https://' + url);
    }
  });
});
