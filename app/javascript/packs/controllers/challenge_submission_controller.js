import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [
    "online",
    "post" ]

    connect(){
      this.toggleOnline();
    }

    toggleOnline(){
      if(this.onlineTarget.checked == true) {
        this.postTarget.disabled = false;
      } else {
        this.postTarget.checked = false;
        this.postTarget.disabled = true;
      }
    }

}
