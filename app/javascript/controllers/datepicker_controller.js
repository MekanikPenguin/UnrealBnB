import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";


export default class extends Controller {
  static targets = ["start", "end", "bookButton"]

  connect() {

    console.log("connection")

    flatpickr(this.element, {
      dateFormat: "Y-m-d",
    });

    // flatpickr(this.endTarget, {
    //   dateFormat: "Y-m-d",
    // });

    // updateBookButtonState() {
    //   if (this.startTarget.value && this.endTarget.value) {
    //     this.bookButtonTarget.disabled = false;
    //   } else {
    //     this.bookButtonTarget.disabled = true;
    //   }
    // }
  }
}
