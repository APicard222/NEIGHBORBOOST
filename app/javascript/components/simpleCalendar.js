import Toastify from 'toastify-js'

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

const btnBooking = (start_day, end_day, month, year) => {
  const btn = document.querySelector('#booking')
  const id = document.querySelector('.card-trip-show').dataset.id
  const url = `/materials/${id}/bookings`

  function getMetaValue(name) {
    const element = document.head.querySelector(`meta[name="${name}"]`)

    return element.getAttribute("content")
  }

  btn.addEventListener('click', () => {
    console.log(url);
    fetch(url, {
      method: 'POST',
      headers: {
        'Accept': 'text/plain',
        'Content-type': 'application/json',
        "X-CSRF-Token": getMetaValue("csrf-token")
      },
      body: JSON.stringify({
        start_time: `${year}-${month}-${start_day}`,
        end_time: `${year}-${month}-${end_day}`
      })
    })
      .then(response => response.text())
      .then((data) => {
        Toastify({
          text: "Reservation créée avec succès!",
          duration: 3000,
          newWindow: true,
          close: true,
          gravity: "top", // `top` or `bottom`
          position: "left", // `left`, `center` or `right`
          stopOnFocus: true, // Prevents dismissing of toast on hover
          style: {
            background: "linear-gradient(to right, #00b09b, #96c93d)",
          },
        }).showToast();
        setTimeout(() => {

        }, 4000);
        window.location.href = "/users/dashboard";
      })
    })
}

const simpleCalendar = () => {
  const calendar = document.querySelector('.simple-calendar')
  const calendarMonth = document.querySelector('.calendar-title')
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

        if (Array.from(evt.target.classList).find(name => (name == 'past') || (name == 'has-events'))) {
          Toastify({
            text: "Vous ne pouvez pas choisir ce jour!",
            duration: 3000,
            newWindow: true,
            close: true,
            gravity: "top", // `top` or `bottom`
            position: "left", // `left`, `center` or `right`
            stopOnFocus: true, // Prevents dismissing of toast on hover
            style: {
              background: "linear-gradient(to right, #00b09b, #96c93d)",
            },
          }).showToast();

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
            days[ idx ].classList.add('start-booking')
          }

          // add event to btn booking
          btnBooking(start, end, calendarMonth.innerText.split(' ')[0], calendarMonth.innerText.split(' ')[1])
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
