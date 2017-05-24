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
      editor.find('#md-preview').html(resp.data);
    },
    error: function(msg){
      console.log("markdown could not be rendered due to server error: " + msg);
    }
  }); // ajax
}


function insertText(beforeText, afterText, editor) {
    editor.focus();
    //if(typeof editor.data('lastSelection') == "undefined") {
    //  editor.data("lastSelection", editor.getSelection());
    //}
    editor.data("lastSelection", editor.getSelection());
    var selection = editor.data("lastSelection");
    editor.setSelection(selection.start, selection.end);
    editor.surroundSelectedText(beforeText, afterText);
}


$(document).on('turbolinks:load', function() {

  var toolbarButtons = [
    { class: ".md-h1", before: "\n# ", after: "\n"},
    { class: ".md-h2", before: "\n## ", after: "\n"},
    { class: ".md-h3", before: "\n### ", after: "\n"},

    { class: ".md-img", before: "![ ", after: " ](image_url)"},
    { class: ".md-link", before: "[ ", after: " ](link_url)"},

    { class: ".md-strong", before: "**", after: "**"},
    { class: ".md-italic", before: "_", after: "_"},
    { class: ".md-inline-code", before: "``` ", after: " ```"},
    { class: ".md-fenced-code", before: "\n```\n", after: "\n```\n"},

    { class: ".md-unord-list", before: "\n* ", after: "\n"},
    { class: ".md-ord-list", before: "\n1 ", after: "\n"},
    { class: ".md-blockquote", before: "\n> ", after: "\n"},
  ];


  toolbarButtons.forEach( function (button) {
    $(button.class).on('click', function (event) {
      event.preventDefault();
      var editor = $(event.target).closest('.md-editor').find('.txt-med');
      insertText(button.before, button.after, editor);
    });
  });


  $('.md-tab').click(function(event){
    var self = this;
    var tab_id = $(self).attr('data-tab');
    var editor = $(self).closest('.md-editor');

    switchTab(self,tab_id,editor);
    if(tab_id === 'tab-preview'){
      renderPreview(self,editor);
    }
  });

  function s3add(e,data){
    console.log('add');
    var filename = data.files[0].name;
    var contentType = data.files[0].type;
    var params = [];

    $.ajax({
      url: '/markdown_editor/presign?filename=' + filename,
      type: 'PUT',
      dataType: 'json',
      headers: {
        filename: filename
      },
      success: function(presign) {
        data.url = presign.presigned_url,
        data.submit();
        //debugger;
      },
      error: function(error) {
        console.log('error ' + error);
      }
    });

  }

  function onS3Done(){
    console.log('done');
  }

  $('#fileupload').fileupload({
    // acceptFileTypes: acceptFileType,
    // maxFileSize: maxFileSize,
    paramName: 'file',
    add: s3add,
    dataType: 'xml',
    done: onS3Done
  });


}); // turbolinks
