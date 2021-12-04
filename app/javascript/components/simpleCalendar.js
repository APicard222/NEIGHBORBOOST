const getStartDay = (evt, start) => {
  if (start == 0) {
    evt.target.classList.add('start-booking')
    return parseInt(evt.target.innerText, 10)
  }

  return
}

const getEndDay = (evt, start, end) => {
  console.log(start);
  if (end == 0 && start != 0) {
    evt.target.classList.add('end-booking')
    return parseInt(evt.target.innerText, 10)
  }

  return
}

const renderBooking = (days) => {
  days.forEach( day => {
    
  })
}

const simpleCalendar = () => {
  const calendar = document.querySelector('.simple-calendar')
  let days = []
  let start = 0
  let end = 0

  if (calendar) {
    days = Array.from(calendar.children[1].children[1].children)
    days.forEach(element => {
      Array.from(element.children).forEach(day => {
        day.addEventListener('click', evt => {
          if (Array.from(evt.target.classList).find(name => name == 'past')) {
            alert('Vous avez choisi un jour qui est déjà passé')
            return
          }

          if (end == 0 && start != 0) {
            evt.target.classList.add('end-booking')
            console.log(days);
            end = parseInt(evt.target.innerText, 10)
          }

          if (start == 0) {
            evt.target.classList.add('start-booking')
            start = parseInt(evt.target.innerText, 10)
          }


        })
      })
    })
  }
}

export { simpleCalendar }
