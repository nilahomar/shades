import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ["banner", "navbar"];
  connect() {
    if (this.hasBannerTarget) {
      this.navbarTarget.classList.add("navbar-transparent-background");
    } else {
      console.log("There is no banner");
    }
  }
}
