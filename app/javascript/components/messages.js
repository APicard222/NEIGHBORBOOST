const showFooter = () => {
  const footer = document.querySelector('.footer')
  const messages = document.querySelector('.messages')

  if (messages) {
    footer.style.display = 'none'
  }
  else {
    footer.style.display = 'flex'
  }
}

export { showFooter }
