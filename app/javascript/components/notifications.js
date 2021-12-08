class Notification {
  static _total = 0
  static _readed = 0
  static _notReaded = 0

  static setTotal(count) {
    this._total = count
  }

  static getTotal() {
    return this._total
  }

  static setReaded() {
    this._readed = this._total
  }

  static getReaded() {
    return this._readed
  }

  static setNotReaded() {
    this._notReaded = this._total - this._readed
  }

  static getNotReaded() {
    return this._notReaded
  }
}

const notifications = () => {
  // get dataset messages
  const messages = document.getElementById('messages')

  // firts time in app
  if (Notification.getTotal() != 0 && Notification.getReaded() == 0) {
    Notification.setReaded()
  }

  // verify if we are in the messages
  if (location.href.includes('messages')) {
    Notification.setReaded()
  } else if (Notification.getTotal() > Notification.getReaded()){
    Notification.setNotReaded()
    const notifHolder = document.getElementById('notifications')
    if (notifHolder) {
      notifHolder.style.display = 'flex'
      notifHolder.innerText = Notification.getNotReaded()
    }
  }
}

setInterval(async () => {
  let res = await fetch('/messages/count')
  let total = await res.json()
  Notification.setTotal(total)
  notifications()
}, 5000);

export { notifications }
