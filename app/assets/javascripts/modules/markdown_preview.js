function switchTab(self,tab_id,editor) {

  editor.find('.md-tab').removeClass('active');
  editor.find('.md-tab-content').removeClass('active');

  $(self).addClass('active');
  editor.find("#"+tab_id).addClass('active');
  $(this).addClass('active');
  $("."+tab_id).addClass('active');

  console.log('tabbed' + tab_id);
}


function renderPreview(self,editor) {
  var markdown_text = editor.find('.txt-med')[0].value;

  $.ajax({
    type: 'GET',
    url: '/markdown_editor/show',
    data: {
      markdown: { markdown_text: markdown_text }
    },
    dataType: 'json',
    success: function(resp){
      console.log("markdown:" + resp.data);
      editor.find('#md-preview').html(resp.data);
    },
    error: function(msg){
      console.log("markdown could not be rendered due to server error: " + msg);
    }
  }); // ajax
}


$(document).on('turbolinks:load', function() {
  $('.md-tab').click(function(event){
    var self = this;
    var tab_id = $(self).attr('data-tab');
    var editor = $(self).closest('.md-editor');

    switchTab(self,tab_id,editor);
    if(tab_id === 'tab-preview'){
      renderPreview(self,editor);
    }
  });
});
