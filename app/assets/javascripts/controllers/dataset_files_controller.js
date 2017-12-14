function fileFieldVisibility(){
  var radioValue = $("input[name='dataset_file[hosting_location]']:checked").val();
  if(radioValue === 'crowdAI') {
    $('#dataset-file-s3-key').show();
    $('#external-url').hide();
    $('#dataset_file_external_file_size').hide();
  } else {
    $('#dataset-file-s3-key').hide();
    $('#external-url').show();
    $('#dataset_file_external_file_size').show();
  }
};


Paloma.controller('DatasetFiles', {
  new: function(){
    fileFieldVisibility();
    $("input[name='dataset_file[hosting_location]']").on('click', fileFieldVisibility);
  },
  edit: function(){
    fileFieldVisibility();
    $("input[name='dataset_file[hosting_location]']").on('click', fileFieldVisibility);
  },
  index: function(){
    $('.dataset-file-download').on('click', function (e) {
      var self = this;
      var dataset_file_id = $(this).data('dataset-file-id');
      $.ajax({
        url: '/dataset_files/' + dataset_file_id + '/dataset_file_downloads',
        type: 'POST',
        complete: function() { console.log('file download logged')},
        error: function() { console.log('file download errored ' + status)}
      })
    });
  }
});
