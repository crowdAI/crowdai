Paloma.controller('Articles', {
  show: function(){
    var anchor = document.querySelector("#notebook-holder");
    var ipynb = null;
    try {
      if($('#notebook-data').length > 0){
        var notebook_json = $('#notebook-data')[0].outerText;
        ipynb = JSON.parse(notebook_json);
      }
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
});
