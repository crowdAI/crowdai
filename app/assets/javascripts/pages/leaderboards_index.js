function startVideoPlayers(){
  var $videos = $('video');
  if ($videos.is(':in-viewport')) {
    $videos.each(function(){
      var playPromise = this.play();
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
        //startVideoPlayers();
      }, 2000);
    });
  }

});
