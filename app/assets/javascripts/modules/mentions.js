$(document).on('turbolinks:load', function() {
  $('[data-behavior="mentions"]').atwho({
    at: "@",
    'data': "/participants.json"
  });
});
