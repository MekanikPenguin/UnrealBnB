// import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { correct: String };

  playsound() {
      this.audio = new Audio("home-audio.mp3");
      this.audio.play()
  }
}
