$(document).ready(function() {
  $("a[href='#preview-pane']").on('show.bs.tab', function(e) {
    console.log('shown - before tab has been shown');
    var markdown_text = $("#markdown_textarea").val();
    console.log("markdown: " + markdown_text);
    $.ajax({
      type: 'GET',
      url: '/markdown_editor/create',
      data: {
        markdown_text: markdown_text
      }
    });
  });
});
