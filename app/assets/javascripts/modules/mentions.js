function startMentions(){
  $('[data-behavior="mentions"]').atwho({
    at: "@",
    displayTpl: "<li class='atwho_participant_suggestions'><img src='${thumbnail_url}' height='20' width='20' /> ${name} </li>",
    data: "/participants.json"
  })
  .on("inserted.atwho", function(event, $li, browser_event) {
      console.log('inserted: ' + $li.data('item-data')['name']);
      var cacheEntry = {
        id: $li.data('item-data')['id'],
        name: $li.data('item-data')['name']
      }
      var cacheArr = [];
      var mentionsCache = $('#comment_mentions_cache').val();
      if(mentionsCache){
        cacheArr = JSON.parse(mentionsCache);
        cacheArr.push(cacheEntry);
      } else {
        cacheArr.push(cacheEntry);
      }
      $('#comment_mentions_cache').val(JSON.stringify(cacheArr));
  });
}


document.addEventListener("turbolinks:load", function() {
  startMentions();
});
