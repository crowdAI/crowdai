function expandSidebar(){
  var sidebar = $(".sidebar-container")[0];
  if(sidebar) {
    var page_content = $(".page-content-container")[0];
    if(page_content.offsetHeight > sidebar.offsetHeight) {
      sidebar.style.height = page_content.offsetHeight + 'px';
    }
  }
}
