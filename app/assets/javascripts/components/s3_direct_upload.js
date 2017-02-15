$(document).on('turbolinks:load', function() {
  $('.directUpload').find('.s3File').each(function(i, elem) {
    var fileInput     = $(elem);
    var form          = $(fileInput.parents('form:first'));
    var submitButton  = form.find('input[type="submit"]');
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
      maxFileSize:      20,

      add: function(e, data) {
        var modelFile = $('.s3File')[0].files[0];
        if (modelFile && modelFile.size > 681574400 ) {
          submitButton.prop('disabled', false);
          progressBar
            .css("background", "red")
            .text("Upload failed: please limit your archive to 650MB.");
        } else {
          console.log("submitted ");
          data.submit();
        }
      },

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
        progressBar.text("File uploaded");

        var key   = $(data.jqXHR.responseXML).find("Key").text();
        // create hidden field
        var input = $("<input />", { type:'hidden', name: fileInput.attr('name'), value: key })
        form.append(input);
        elem.remove();
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
