$(document).on('turbolinks:load', function() {
  $('[data-behavior="autocomplete"]').atwho({
    at: "@",
    'data': "/participants.json"
  });
});
