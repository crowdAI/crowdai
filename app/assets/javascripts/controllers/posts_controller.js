$(document).on('ready page:load', function() {
  /* --------------------------------- posts / new --------------------------------------- */
  if (!_.isEmpty(gon) && gon.rails.controller == 'posts' && gon.rails.action == 'new') {
    expandSidebar();
    adjustProgress(gon.percent_progress);
    adjustText(gon.percent_progress);
  } /* posts / new */
});
