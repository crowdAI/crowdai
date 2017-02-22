$(document).on('turbolinks:load', function() {

  function insertText(before_text, after_text, textBox) {
      textBox.focus();
      if(typeof textBox.data('lastSelection') == "undefined") {
        textBox.data("lastSelection", textBox.getSelection());
      }
      var selection = textBox.data("lastSelection");
      textBox.setSelection(selection.start, selection.end);
      textBox.surroundSelectedText(before_text, after_text);
  }

  var theButtons = [
    { class: ".add_strong", before: "**", after: "**"},
    { class: ".add_em", before: "_", after: "_"},
    { class: ".add_h1", before: "\n# ", after: "\n"},
    { class: ".add_h2", before: "\n## ", after: "\n"},
    { class: ".add_h3", before: "\n### ", after: "\n"},
    { class: ".add_h4", before: "\n#### ", after: "\n"},
    { class: ".add_h5", before: "\n##### ", after: "\n"},
    { class: ".add_h6", before: "\n###### ", after: "\n"},
    { class: ".add_paragraph", before: "\n", after: "\n\n"},
    { class: ".add_blockquote", before: "\n> ", after: "\n"},
    { class: ".add_unord_list", before: "\n* ", after: "\n"},
    { class: ".add_ord_list", before: "\n1 ", after: "\n"},
    { class: ".add_link", before: "[", after: "](link_url)"},
    { class: ".add_url_link", before: "<", after: ">"},
    { class: ".add_img", before: "![", after: "](image_url)"},
    { class: ".add_inline_code", before: "```", after: "```"},
    { class: ".add_fenced_code", before: "\n~~~ ruby\n", after: "\n~~~\n"}
  ];

  theButtons.forEach( function (button) {
    $(button.class).on('click', function (e) {
      e.preventDefault();
      var textBox = $(e.target).closest('.markdown-editor').find('.markdown-textarea');
      insertText(button.before, button.after, textBox);
    });
  });

}); // ready page:load
