import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "add", "form", "show", "info"]

  connect() {
    console.log(this.addTarget)
    console.log(this.formTarget)
    console.log(this.showTarget)
  }

  openAddModal() {
    this.addTarget.style.display = 'flex'
  }

  closeAddModal() {
    this.addTarget.style.display = 'none'
  }

  openShowModal() {
    fetch(`/demands/${this.infoTarget.dataset.id}`, { headers: { 'Accept': 'text/plain' } })
      .then(response => response.text())
      .then((data) => {
        this.showTarget.innerHTML = data
      })

    this.showTarget.style.display = 'flex'
  }

  closeShowModal() {
    this.showTarget.style.display = 'none'
  }
}
