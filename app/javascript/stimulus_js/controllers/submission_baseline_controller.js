import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['baseline','baselineComment'];

  initialize(){
    console.log('hi');
    if(this.baselineTarget.checked) {
      this.baselineCommentTarget.style.display = 'block';
    } else {
      this.baselineCommentTarget.style.display = 'none';
    }
  }

  toggleBaseline(event){
    if(event.target.checked) {
      this.baselineCommentTarget.style.display = 'block';
    } else {
      this.baselineCommentTarget.style.display = 'none';
    }
  }

}
