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
    url: '/markdown_editors',
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
    //if(typeof editor.data('lastSelection') === "undefined") {
    //  editor.data("lastSelection", editor.getSelection());
    //}
    editor.data("lastSelection", editor.getSelection());
    var selection = editor.data("lastSelection");
    editor.setSelection(selection.start, selection.end);
    editor.surroundSelectedText(beforeText, afterText);
}


function uploadFile() {
  console.log(event.target);
  console.log(event.currentTarget);

  var markdownFieldID = $(event.target).closest('.md-tab-content').find('textarea.txt-med')[0].id;
  var file  = event.target.files[0];
  var reader  = new FileReader();

  reader.addEventListener("load", function () {
    console.log('load');
    var formData = new FormData();
    formData.append('attachment', file);
    $.ajax({
      url: "/markdown_editors?markdown_field_id=" + markdownFieldID,
      type: "POST",
      data: formData,
      processData: false,
      contentType: false
    });
  }, false);

  if (file) {
    reader.readAsDataURL(file);
  }
}


$(document).on('turbolinks:load', function() {

  var toolbarButtons = [
    { class: ".md-h1", before: "\n# ", after: "\n"},
    { class: ".md-h2", before: "\n## ", after: "\n"},
    { class: ".md-h3", before: "\n### ", after: "\n"},

    { class: ".md-img", before: "![ ", after: " ](image_url)"},
    { class: ".md-link", before: "[ ", after: " ](link_url){:target='_blank'}"},

    { class: ".md-strong", before: "**", after: "**"},
    { class: ".md-italic", before: "_", after: "_"},
    { class: ".md-inline-code", before: "~~~ ", after: " ~~~"},
    { class: ".md-fenced-code", before: "\n~~~\n", after: "\n~~~\n"},

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


  $('.fileUploadLink').on('click', function(e){
    e.preventDefault();
    $(this).closest('.md-tab-content').find('.markdownFileInput').trigger('click');
  });

}); // turbolinks
