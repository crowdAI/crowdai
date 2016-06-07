$(document).on('ready page:load', function() {
  /* --------------------------------- leaderboards / index --------------------------------------- */
  if (!_.isEmpty(gon) && gon.rails.controller == 'submissions' && gon.rails.action == 'index') {
    expandSidebar();
    adjustProgress(gon.percent_progress);
    adjustText(gon.percent_progress);
  } /* topics / index */
});
