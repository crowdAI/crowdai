import Flatpickr from "stimulus-flatpickr";

import "flatpickr/dist/themes/material_red.css";

export default class extends Flatpickr {

  connect() {
   //global options
    this.config = {
      enableTime: true,
      time_24hr: true,
      minute_increment: 1,
      format: "d-m-Y H:i"
    };
    //always call super.connect()
    super.connect();
  }

}
