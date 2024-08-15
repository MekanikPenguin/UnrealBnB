import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { correct: String }
    connect() {
      // Check if audio is already playing
      if (!this.audio) {
        console.log("Playing sound...");

        // Create a new Audio object
        this.audio = new Audio("/assets/home-audio.mp3");

        // Attempt to play the audio after a brief delay
        setTimeout(() => {
          this.audio.play().catch((error) => {
            console.error("Audio playback failed:", error);
          });
        }, 1000); // Adjust the delay if necessary
      }
    }
  }

