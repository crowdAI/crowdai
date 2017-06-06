$(document).on('turbolinks:load', function() {

   // data-remodal-target opens a modal window with the special Id
   $(document).on('click', '[data-' + PLUGIN_NAME + '-target]', function(e) {
     e.preventDefault();

     var elem = e.currentTarget;
     var id = elem.getAttribute('data-' + PLUGIN_NAME + '-target');
     var $target = $('[data-' + PLUGIN_NAME + '-id="' + id + '"]');

     $[PLUGIN_NAME].lookup[$target.data(PLUGIN_NAME)].open();
   });

   // Auto initialization of modal windows
   // They should have the 'remodal' class attribute
   // Also you can write the `data-remodal-options` attribute to pass params into the modal
   $(document).find('.' + NAMESPACE).each(function(i, container) {
     var $container = $(container);
     var options = $container.data(PLUGIN_NAME + '-options');

     if (!options) {
       options = {};
     } else if (typeof options === 'string' || options instanceof String) {
       options = parseOptions(options);
     }

     $container[PLUGIN_NAME](options);
   });

   // Handles the keydown event
   $(document).on('keydown.' + NAMESPACE, function(e) {
     if (current && current.settings.closeOnEscape && current.state === STATES.OPENED && e.keyCode === 27) {
       current.close();
     }
   });

   // Handles the hashchange event
   $(window).on('hashchange.' + NAMESPACE, handleHashChangeEvent);
 });
});
