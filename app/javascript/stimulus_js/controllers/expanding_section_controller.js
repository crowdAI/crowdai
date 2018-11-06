import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = [ "expand", 'collapse', "section" ];

  showSection() {
    this.expandTarget.classList.add('display-none');
    this.collapseTarget.classList.remove('display-none');
    this.sectionTarget.classList.remove('display-none');
  }

  hideSection() {
    this.expandTarget.classList.remove('display-none');
    this.collapseTarget.classList.add('display-none');
    this.sectionTarget.classList.add('display-none');
  }

}
