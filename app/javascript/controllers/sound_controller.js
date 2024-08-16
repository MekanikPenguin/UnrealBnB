import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { correct: String }

  playsoundValidation() {
        this.audio = new Audio("/effect-sound.mp3");
        this.audio.play()
    }

  playsoundGotit() {
    this.audio = new Audio("/gotit.mp3");
    this.audio.play()
  }

  playsoundYahaha() {
    this.audio = new Audio("/yahaha.mp3");
    this.audio.play()
  }

  playsoundLetsgo() {
    this.audio = new Audio("/letsgo.mp3");
    this.audio.play()
  }
  }
