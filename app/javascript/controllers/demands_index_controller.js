import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "add", "form", "show", "info", "list"]

  connect() {
  }

  openAddModal() {
    this.addTarget.style.display = 'flex'
  }

  closeAddModal() {
    this.addTarget.style.display = 'none'
  }

  openShowModal(evt) {
    const url = `/demands/${evt.target.closest(".card-demand").dataset.id}`

    fetch(url, { headers: { 'Accept': 'text/plain' } })
      .then(response => response.text())
      .then((data) => {
        this.showTarget.innerHTML = data
        this.showTarget.style.display = 'flex'
      })

  }

  closeShowModal() {
    this.showTarget.style.display = 'none'
  }

  updateStatus(evt) {
    const status = evt.target.dataset.status
    const id = evt.target.closest('.show-card-demand-container').dataset.id
    const url = `/demands/${id}`

    function getMetaValue(name) {
      const element = document.head.querySelector(`meta[name="${name}"]`)

      return element.getAttribute("content")
    }

    fetch(url, {
      method: 'PATCH',
      headers: {
        'Accept': 'text/plain',
        'Content-type': 'application/json',
        "X-CSRF-Token": getMetaValue("csrf-token")
      },
      body: JSON.stringify({
        status: status,
      })
    })
      .then(response => response.text())
      .then((data) => {
        this.listTarget.innerHTML = data
        this.closeShowModal()
      })
  }
}
