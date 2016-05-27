$(document).on('ready page:load', function() {
  $('a[data-toggle="tab"]').on('show.bs.tab', function(e) {
    var self = this;
    if ($(self).hasClass('preview-pane-link')) {
      var markdown_text = $(self).closest('.markdown-editor').find('.markdown-textarea')[0].value;
      var pane = $(self).closest('.markdown-editor').find('.markdown-preview-pane');

      $.ajax({
        type: 'GET',
        url: '/markdown_editor/show',
        data: {
          markdown: { markdown_text: markdown_text }
        },
        dataType: 'json',
        success: function(resp){
          console.log("markdown:" + resp.data);
          pane.html(resp.data);
        },
        error: function(msg){
          console.log("markdown could not be rendered due to server error: " + msg);
        }
      }); // ajax

    } // if
  });
});
