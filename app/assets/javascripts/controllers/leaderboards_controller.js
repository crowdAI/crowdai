function startVideoPlayers(){
  var $videos = $('video');
  if ($videos.is(':in-viewport')) {
    $videos.each(function(){
      console.log('starting video: ' + this);
      var playPromise = this.play();
    });
  }
}

Paloma.controller('Leaderboards', {
  index: function(){
    var scrollTimeout = null;
    $(window).scroll(function(){
      if (scrollTimeout) {
        clearTimeout(scrollTimeout);
      }
      scrollTimeout = setTimeout(function() {
        startVideoPlayers();
      }, 2000);
    });
  },
  show: function(){
    console.log('show');
  }
});
