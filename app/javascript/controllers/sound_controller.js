import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { correct: String }
    playsound() {
        this.audio = new Audio("home-audio.mp3");
        this.audio.play()

        // Attempt to play the audio after a brief delay
        // setTimeout(() => {
        //   this.audio.play().catch((error) => {
        //     console.error("Audio playback failed:", error);
        //   });
        // }, 1000); // Adjust the delay if necessary
    }
  }
