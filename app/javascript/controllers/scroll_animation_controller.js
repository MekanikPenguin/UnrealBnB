import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["card"];

  connect() {
    this.observer = new IntersectionObserver(this.observeCards.bind(this), {
      threshold: 0.05,
    });

    this.cardTargets.forEach((card, index) => {
      card.classList.add("fade-out");
      card.style.transitionDelay = `${index * 0.2}s`; // Ajout d'un délai en cascade
      this.observer.observe(card);
    });

    window.addEventListener("scroll", this.handleInitialScroll.bind(this));
  }

  handleInitialScroll() {
    this.cardTargets.forEach((card) => {
      if (card.classList.contains("fade-out") && this.isInViewport(card)) {
        card.classList.add("fade-in");
      }
    });
  }

  isInViewport(element) {
    const rect = element.getBoundingClientRect();
    return (
      rect.top >= 0 &&
      rect.left >= 0 &&
      rect.bottom <= (window.innerHeight || document.documentElement.clientHeight) &&
      rect.right <= (window.innerWidth || document.documentElement.clientWidth)
    );
  }

  observeCards(entries) {
    entries.forEach((entry) => {
      if (entry.isIntersecting) {
        entry.target.classList.add("fade-in");
        this.observer.unobserve(entry.target);
      }
    });
  }
}
