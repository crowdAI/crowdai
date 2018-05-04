Paloma.controller('Articles', {
  show: function(){
    if($('#notebook-data').length > 0){
      var notebook_json = $('#notebook-data')[0].outerText;
      var anchor = document.querySelector("#notebook-holder");

      var ipynb = null;
      try {
        var ipynb = JSON.parse(notebook_json);
      }
      catch(error) {
        console.log(error);
      }
      if(ipynb !== null){
        var notebook = nb.parse(ipynb);
        while (anchor.hasChildNodes()) {
          anchor.removeChild(anchor.lastChild);
        }
        anchor.appendChild(notebook.render());
        Prism.highlightAll();
      }
    }
  }
});
