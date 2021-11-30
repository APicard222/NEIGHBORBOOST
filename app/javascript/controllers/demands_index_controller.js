import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "add", "form", "show", "info"]

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
    fetch(`/demands/${this.infoTarget.dataset.id}`, { headers: { 'Accept': 'text/plain' } })
      .then(response => response.text())
      .then((data) => {
        this.showTarget.innerHTML = data
      })
    // fetch()
    console.log(this.infoTarget.dataset.id);
    this.showTarget.style.display = 'flex'
  }
}
