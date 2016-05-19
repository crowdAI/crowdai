
var $textBox;

// Due to turbolinks, it's necessary to reload on document ready and page load.
// Set 'ready' here, and call it on either document ready or page load (see last two lines of code)
var ready = (function () {
  var theButtons = [
    { id: "#add_strong", before: "**", after: "**"},
    { id: "#add_em", before: "_", after: "_"},
    { id: "#add_h1", before: "\n# ", after: "\n"},
    { id: "#add_h2", before: "\n## ", after: "\n"},
    { id: "#add_h3", before: "\n### ", after: "\n"},
    { id: "#add_h4", before: "\n#### ", after: "\n"},
    { id: "#add_h5", before: "\n##### ", after: "\n"},
    { id: "#add_h6", before: "\n###### ", after: "\n"},
    { id: "#add_paragraph", before: "\n", after: "\n\n"},
    { id: "#add_blockquote", before: "\n> ", after: "\n"},
    { id: "#add_unord_list", before: "\n* ", after: "\n"},
    { id: "#add_ord_list", before: "\n1 ", after: "\n"},
    { id: "#add_link", before: "[", after: "](link_url)"},
    { id: "#add_url_link", before: "<", after: ">"},
    { id: "#add_img", before: "![", after: "](image_url)"},
    { id: "#add_inline_code", before: "```", after: "```"},
    { id: "#add_fenced_code", before: "\n~~~ ruby\n", after: "\n~~~\n"}
  ];

  theButtons.forEach( function (button) {
    $(button.id).on('click', function (e) {
      debugger;
      e.preventDefault();
      insertText(button.before, button.after);
    });
  });

  $textBox = $("#markdown_textarea");

  function saveSelection() {
      $textBox.data("lastSelection", $textBox.getSelection());
  }

  $textBox.focusout(saveSelection);

  $textBox.bind("beforedeactivate", function () {
      saveSelection();
      $textBox.unbind("focusout");
  });
});

function insertText(before_text, after_text) {
    debugger;
    $textBox.focus();
    if(typeof $textBox.data('lastSelection') == "undefined") {
      $textBox.data("lastSelection", $textBox.getSelection());
    }
    var selection = $textBox.data("lastSelection");
    console.log(selection);
    $textBox.setSelection(selection.start, selection.end);
    $textBox.surroundSelectedText(before_text, after_text);
}

$(document).ready(ready);
$(document).on('page:load', ready);
