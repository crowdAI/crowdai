Paloma.controller('TaskDatasetFiles', {
  index: function(){
    var himself = this;
    $('.dataset-file-download').on('click', function (e) {
      var self = this;
      var dataset_file_id = $(self).data('dataset-file-id');
      $.ajax({
        url: '/task_dataset_files/' + dataset_file_id + '/task_dataset_file_downloads',
        type: 'POST',
        complete: function() { console.log('file download logged')},
        error: function() { console.log('file download errored ' + status)}
      });
    });

    $('#eua-file').on('click', function(e){
      var self = this;
      var clefTaskId = $(self).data('clef-task-id');
      $.ajax({
        url: '/participant_clef_tasks/',
        type: 'POST',
        data: { "participant_clef_task": { "clef_task_id": clefTaskId, "challenge_id": himself.params.challenge_id } },
        complete: function() { console.log('download of eua logged')},
        error: function() { console.log('download logging of eua errored ' + status)}
      });
    });

  }
});
