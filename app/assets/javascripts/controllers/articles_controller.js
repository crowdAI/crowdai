Paloma.controller('Articles', {
  show: function(){
    var anchor = document.querySelector("#notebook-holder");
    var notebook_json = $('#notebook-data')[0].outerText;
    var ipynb = JSON.parse(notebook_json)
    var notebook = nb.parse(ipynb);
    while (anchor.hasChildNodes()) {
      anchor.removeChild(anchor.lastChild);
    }
    anchor.appendChild(notebook.render());
    Prism.highlightAll();
  }
});
