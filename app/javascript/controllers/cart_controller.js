import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="cart"
export default class extends Controller {
  static values = {
    product: String,
  };

  static targets = ["shoppingCartCircle"];

  connect() {
    console.log("hello from cart controller");
    this.shoppingCartState = [];
    console.log(this.shoppingCartCircleTarget);
    console.log(this.productValue);
  }

  updateShopping() {
    console.log("Hello I have been clicked");
    let item = {};
    item.id = this.productValue;
    this.shoppingCartState.push(item);
    this.shoppingCartCircleTarget.style.display = "block";
    this.shoppingCartCircleTarget.innerHTML = `<h6>${this.shoppingCartState.length}</h6>`;
  }
}
