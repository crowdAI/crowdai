import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['challenges-followed','mentions','frequency'];

  toggleFrequency(event){
    if(event.target.checked == true) {
      console.log('show');
      this.frequencyTarget.display = 'block';
    } else {
      console.log('hide');
      this.frequencyTarget.display = 'none';
    }
  }
}
