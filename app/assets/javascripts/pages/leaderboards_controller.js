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
  /* --------------------------------- leaderboards / index --------------------------------------- */
  if (!_.isEmpty(gon) && gon.rails.controller == 'leaderboards' && gon.rails.action == 'index') {
    expandSidebar();
    adjustProgress(gon.percent_progress);
    adjustText(gon.percent_progress);

    var scrollTimeout = null;
    $(window).scroll(function(){
      if (scrollTimeout) {
        clearTimeout(scrollTimeout);
      }
      scrollTimeout = setTimeout(function() {
        toggleVideoPlayers();
      }, 1000);
    });
  }
});
