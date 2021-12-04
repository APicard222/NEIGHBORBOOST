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
  let tableRows = []
  let start = 0
  let end = 0

  if (calendar) {
    tableRows = Array.from(calendar.children[1].children[1].children)

    // create an array of the days
    const days = []
    tableRows.forEach(row => {
      Array.from(row.children).forEach( day => days.push(day))
    })

    // add event listener to all days
    days.forEach(day => {
      day.addEventListener('click', evt => {

        if (Array.from(evt.target.classList).find(name => name == 'past')) {
          alert('Vous avez choisi un jour qui est déjà passé')
          return
        }

        if (end == 0 && start != 0) {
          // verify if the end is greater than start
          if (parseInt(evt.target.innerText, 10) < start) {
            return
          }

          // set end
          evt.target.classList.add('end-booking')
          end = parseInt(evt.target.innerText, 10)

          // set class booking to all the elements inside the booking period
          let startIdx = days.findIndex(day => Array.from(day.classList).find(className => className == 'start-booking'))
          let endIdx = days.findIndex(day => Array.from(day.classList).find(className => className == 'end-booking'))

          for (let idx = startIdx; idx <= endIdx; idx++ ) {
            days[idx].classList.add('start-booking')
          }
        }

        // set start day
        if (start == 0) {
          evt.target.classList.add('start-booking')
          start = parseInt(evt.target.innerText, 10)
        }
      })
    })
  }
}

export { simpleCalendar }
