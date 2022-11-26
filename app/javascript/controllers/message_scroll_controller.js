import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="message-scroll"
export default class extends Controller {

  static targets = ["message"]

  connect() {
    window.scrollTo(0, document.body.scrollHeight);
    // console.log(this.messageTarget)
  }

  disconnect() {
    console.log("Unsubscribed from the chatroom")
  }
}
