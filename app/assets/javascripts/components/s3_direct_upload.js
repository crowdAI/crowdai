$(function() {
  $('.directUpload').find('.s3File').each(function(i, elem) {
    var fileInput     = $(elem);
    var form          = $(fileInput.parents('form:first'));
    var submitButton  = form.find('input[type="submit"]');
    var progressBar   = $("<div class='bar'></div>");
    var barContainer  = $("<div class='upload-progress'></div>").append(progressBar);
    fileInput.after(barContainer);


    function checkFile(file) {
      //debugger;
    }


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
        if (modelFile.size > 681574400 ) {
          console.log("file type " + modelFile.type)
          console.log("file is too big " + modelFile.size);
          submitButton.prop('disabled', false);
          progressBar
            .css("background", "red")
            .text("Upload failed: please limit your archive to 650MB.");
        } else {
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
        // var url   = '//' + form.data('host') + '/' + key;
        // create hidden field
        //var input = $("<input />", { type:'hidden', name: fileInput.attr('name'), value: url })
        var input = $("<input />", { type:'hidden', name: fileInput.attr('name'), value: key })
        form.append(input);
        console.log("removing: " + elem);
        elem.remove();
      },

      fail: function (e, data) {
        submitButton.prop('disabled', false);
        progressBar
          .css("background", "red")
          .text("Upload failed");
          debugger;
      }
    });
  });
});



// https://devcenter.heroku.com/articles/direct-to-s3-image-uploads-in-rails
