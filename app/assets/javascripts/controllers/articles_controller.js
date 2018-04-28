Paloma.controller('Articles', {
  show: function(){
    if ($("#notebook-data").length > 1){
      var anchor = document.querySelector("#notebook-holder");
      var notebook_json = $('#notebook-data')[0].outerText;
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
