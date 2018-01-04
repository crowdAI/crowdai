$(document).on('turbolinks:load', function() {
  $('[data-behavior="mentions"]').atwho({
    at: "@",
    displayTpl: "<li><img src='${thumbnail_url}' height='20' width='20' /> ${name} </li>",
    data: "/participants.json"
  }).on("inserted.atwho", function(event, $li, browser_event) {
      var rails_id = $li.data('item-data')['id'];
      console.log('id:' + rails_id);
  });
});
