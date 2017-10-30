function startVideoPlayers(){
  var $videos = $('video');
  if ($videos.is(':in-viewport')) {
    $videos.each(function(){
      console.log('starting video: ' + this);
      var playPromise = this.play();
    });
  }
}

function pauseAndPlay(){
  var scrollTimeout = null;
  $(window).scroll(function(){
    if (scrollTimeout) {
      clearTimeout(scrollTimeout);
    }
    scrollTimeout = setTimeout(function() {
      startVideoPlayers();
    }, 2000);
  });
}


Paloma.controller('Leaderboards', {
  index: function(){
    pauseAndPlay();
  },
  show: function(){
    pauseAndPlay();
  }
});
