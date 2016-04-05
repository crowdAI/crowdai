$(document).ready(function() {
  $("a[href='#preview-pane']").on('show.bs.tab', function(e) {
    var markdown_text = $("#markdown_textarea").val();
    $.ajax({
      type: 'GET',
      url: '/markdown_editor/create',
      data: {
        markdown_text: markdown_text
      }
    });
  });
});
