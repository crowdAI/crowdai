Paloma.controller('TaskDatasetFiles', {
  index: function(){
    $('.dataset-file-download').on('click', function (e) {
      var self = this;
      var dataset_file_id = $(this).data('dataset-file-id');
      $.ajax({
        url: '/task_dataset_files/' + dataset_file_id + '/task_dataset_file_downloads',
        type: 'POST',
        complete: function() { console.log('file download logged')},
        error: function() { console.log('file download errored ' + status)}
      })
    });

  }
});
