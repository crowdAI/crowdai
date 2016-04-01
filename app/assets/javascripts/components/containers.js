// Ensure sidebar is the same height as the main container
$(document).ready(function(){
  var sidebar = $(".sidebar-container")[0];
  if(sidebar) {
    var page_content = $(".page-content-container")[0];
    if(page_content.offsetHeight > sidebar.offsetHeight) {
      sidebar.style.height = page_content.offsetHeight + 'px';
    }
  }
});
