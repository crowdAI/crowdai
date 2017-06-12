function toggleVideoPlayers(){
  var $videos = $('video');
  if ($videos.is(':in-viewport')) {
    $videos.each(function(){
      this.loop = true;
      this.play();
    });
  }
}


$(document).on('turbolinks:load', function() {
  var controller = $('#controller-action').data('controller');
  var action = $('#controller-action').data('action');

  if (controller === 'leaderboards' && action === 'index') {
    var scrollTimeout = null;
    $(window).scroll(function(){
      if (scrollTimeout) {
        clearTimeout(scrollTimeout);
      }
      scrollTimeout = setTimeout(function() {
        toggleVideoPlayers();
      }, 2000);
    });
  }

});
