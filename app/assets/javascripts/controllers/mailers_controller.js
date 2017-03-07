$(document).on('turbolinks:load', function() {

  /* --------------------------------- mailers / index --------------------------------------- */
  if (!_.isEmpty(gon) && gon.rails.controller === 'mailers') {

    var container_fluid_height = $('.container-fluid')[0].offsetHeight;
    var viewport_height = $(window).height();
    var challenges_container_height = $('.mailers-container')[0].offsetHeight;
    var additional_height = viewport_height - container_fluid_height;

    if (additional_height > 0) {
      $('.mailers-container')[0].style.height = (challenges_container_height + additional_height) + 'px';
    }
    console.log('mailers');
} /* challenges / index */

});
