import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="beer-icon"
export default class extends Controller {

  static targets = ["beer"]

  connect() {
    console.log(this.element)
    console.log(this.beerTarget)
  }

  addBeer() {
    this.beerTarget.classList.toggle("fa-beer-mug-empty")
    this.beerTarget.classList.add("fa-champagne-glasses")
    // location.reload();
  }

  // removeBeer() {
  //   this.deleteTarget.classList.remove("fa-champagne-glasses")
  //   this.deleteTarget.classList.add("fa-beer-mug-empty")
  // }
}
