import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"

export default class extends Controller {
  static targets = ["start", "end", "bookButton"]

  connect() {
    flatpickr(this.startTarget, {
      onChange: this.updateButtonState.bind(this)
    })
    flatpickr(this.endTarget, {
      onChange: this.updateButtonState.bind(this)
    })
  }
}
