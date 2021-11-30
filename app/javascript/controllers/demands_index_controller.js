import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "add", "form" ]

  connect() {
    console.log(this.addTarget);
    console.log(this.formTarget)
  }

  addModal() {
    this.addTarget.style.display = 'flex'
  }

  closeModal() {
    this.addTarget.style.display = 'none'
  }
}
