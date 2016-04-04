$(function() {
  $('.directUpload').find("input:file").each(function(i, elem) {
    var fileInput    = $(elem);
    //console.log(fileInput);
    var fileInput     = $(elem);
    var form          = $(fileInput.parents('form:first'));
    var submitButton  =   form.find('input[type="submit"]');
    var progressBar   = $("<div class='bar'></div>");
    var barContainer  = $("<div class='upload-progress'></div>").append(progressBar);
    fileInput.after(barContainer);
    fileInput.fileupload({
      fileInput:        fileInput,
      url:              form.data('url'),
      type:             'POST',
      autoUpload:       true,
      formData:         form.data('form-data'),
      paramName:        'file',
      dataType:         'XML',
      replaceFileInput: false,

      progressall: function (e, data) {
        var progress = parseInt(data.loaded / data.total * 100, 10);
        progressBar.css('width', progress + '%');
      },

      start: function (e) {
        submitButton.prop('disabled', true);
        progressBar
          .css('background', 'green')
          .css('display', 'block')
          .css('width', '0%')
          .text("Loading...");
      },

      done: function (e, data) {
        submitButton.prop('disabled', false);
        progressBar.text("Uploading completed");

        var key   = $(data.jqXHR.responseXML).find("Key").text();
        var url   = '//' + form.data('host') + '/' + key;

        // create hidden field
        //var input = $("<input />", { type:'hidden', name: fileInput.attr('name'), value: url })
        //form.append(input);
      },

      fail: function (e, data) {
        submitButton.prop('disabled', false);
        progressBar
          .css("background", "red")
          .text("Upload failed");
      }
    });
  });
});



// https://devcenter.heroku.com/articles/direct-to-s3-image-uploads-in-rails
