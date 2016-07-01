$(document).on('ready page:load', function() {
  /* --------------------------------- challenges / edit ---------------------------------------- */
  if (!_.isEmpty(gon) && gon.rails.controller == 'articles') {
    expandSidebar();
  }
});
