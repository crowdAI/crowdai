$(document).on('turbolinks:load', function() {
  /* --------------------------------- leaderboards / index --------------------------------------- */
  if (!_.isEmpty(gon) && gon.rails.controller == 'topics' && gon.rails.action == 'index') {
    expandSidebar();
    adjustProgress(gon.percent_progress);
    adjustText(gon.percent_progress);
  } /* topics / index */
});
