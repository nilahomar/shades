import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ["banner", "navbar"];
  connect() {
    if (this.hasBannerTarget) {
      this.navbarTarget.classList.add("navbar-transparent-background");
    } else {
      this.navbarTarget.classList.add("navbar-background");
    }
  }

  scrollAxis() {
    if (
      this.hasBannerTarget &&
      window.scrollY >= this.bannerTarget.offsetHeight
    ) {
      this.navbarTarget.classList.add("navbar-background");
      this.navbarTarget.classList.remove("navbar-transparent-background");
    } else {
      this.navbarTarget.classList.remove("navbar-background");
      this.navbarTarget.classList.add("navbar-transparent-background");
    }
  }
}
