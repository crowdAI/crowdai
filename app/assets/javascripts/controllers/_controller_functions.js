function expandSidebar(){
  var sidebar = $(".sidebar-container")[0];
  if(sidebar) {
    var page_content = $(".page-content-container")[0];
    if(page_content.offsetHeight > sidebar.offsetHeight) {
      sidebar.style.height = page_content.offsetHeight + 'px';
    }
  }
}


function adjustProgress(percent) {
  $('.ai-progressbar').width(percent + '%');
}

function adjustText(percent) {
  var ai_red    = '#FF4E48';           // source: _variables.scss
  var ai_white  = '#FFFFFF';
  var screen_width = $(window).width();
  if(screen_width < 690) {
    $('.ai-progress-text').css('visibility','hidden');
  } else {
    if(percent < 30) {
      $('.ai-progress-text').css({'color': ai_red, 'width': '30%', 'left': '50%'});
    }
    if(percent >= 30 && percent < 65) {
      $('.ai-progress-text').css({'color': ai_red, 'width': '30%', 'left': percent + 5 + '%'});
    }
    if(percent >= 65) {
      $('.ai-progress-text').css({'color': ai_white, 'width': percent + '%'});
    }
    if(percent === 100) {
      $('.ai-progressbar').css({'border-radius': '0.3em'});
    }
  }
}
