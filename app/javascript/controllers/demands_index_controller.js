import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "add", "form", "show" ]

  connect() {
    console.log(this.addTarget)
    console.log(this.formTarget)
    console.log(this.showTarget)
  }

  addModal() {
    this.addTarget.style.display = 'flex'
  }

  closeModal() {
    this.addTarget.style.display = 'none'
  }

  showModal() {
    this.showTarget.style.display = 'flex'
  }
}
