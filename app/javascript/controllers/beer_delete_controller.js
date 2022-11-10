import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="beer-delete"
export default class extends Controller {
  static targets = ["remove"]

  connect() {
    console.log(this.element)
    console.log(this.removeTarget)
  }

  removeBeer() {
    this.removeTarget.classList.remove("fa-champagne-glasses")
    this.removeTarget.classList.add("fa-beer-mug-empty")
  }
}
