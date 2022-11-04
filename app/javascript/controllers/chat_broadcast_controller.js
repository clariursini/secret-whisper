import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { conversationId: Number }
  static targets = ["messages"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatChannel", id: this.conversationIdValue },
      { received: data => console.log(data) }
    )

    console.log(`Subscribe to the conversation with the id ${this.conversationIdValue}.`)
  }

  // #insertMessageAndScrollDown(data) {
  //   this.messagesTarget.insertAdjacentHTML("beforeend", data)
  //   this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  // }

  // resetForm(event) {
  //   event.target.reset()
  // }

  // disconnect() {
  //   console.log("Unsubscribed from the chatroom")
  //   this.channel.unsubscribe()
  // }

}
