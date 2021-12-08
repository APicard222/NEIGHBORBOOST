const showNavbar = () => {
  const navbar = document.querySelector('.navbar')
  const banner = document.querySelector('.banner')

  if (banner) {
    navbar.style.display = 'none'
  }
  else {
    navbar.style.display = 'flex'
  }
}

const menuItem = () => {
  const menu = document.querySelector('.menu')
  const items = Array.from(menu.children).slice(1, 6)

  items.forEach(item => item.classList.remove('menu-item-active'))

  items.forEach(item => {
    console.log(item)
    if (location.href.includes(item.dataset.item)) {
      item.classList.add('menu-item-active')
    }
  })
}

export { showNavbar, menuItem }
