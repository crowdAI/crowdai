import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['challengesFollowed','mentions','frequency'];

  initialize(){
    if(this.challengesFollowedTarget.checked || this.mentionsTarget.checked) {
      this.frequencyTarget.style.display = 'block';
    } else {
      this.frequencyTarget.style.display = 'none';
    }
  }

  toggleFrequency(event){
    if(event.target.checked) {
      this.frequencyTarget.style.display = 'block';
    } else {
      this.frequencyTarget.style.display = 'none';
    }
  }

}
