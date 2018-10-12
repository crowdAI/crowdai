import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['open','close','sidebar','form','query','submissions','submit','submissionStatus'];

  openSidebar(e) {
    e.preventDefault();
    this.openTarget.classList.add('display-none');
    this.closeTarget.classList.remove('display-none');
    this.sidebarTarget.classList.remove('display-none');
  }

  closeSidebar(e) {
    e.preventDefault();
    this.openTarget.classList.remove('display-none');
    this.closeTarget.classList.add('display-none');
    this.sidebarTarget.classList.add('display-none');
  }

  filterChanged(){
    console.log('keyup');
    console.log(this.queryTarget.value);
    this.submitTarget.click();
  }

  onPostSuccess(event) {
    console.log('posted');
    let [data, status, xhr] = event.detail;
    this.submissionsTarget.innerHTML = xhr.response;
  }

}
