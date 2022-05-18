document.addEventListener('turbolinks:load', function() {

  const form = document.getElementById('new_user')
  const passField = form.elements.user_password
  const confirmField = form.elements.user_password_confirmation

  if (confirmField) { confirmField.addEventListener('input', function() {
      if (this.value !== '') {
        checkConfirmation()
      } else {
        form.querySelector('.octicon-alert').classList.add('hide')
        form.querySelector('.octicon-check-circle-fill').classList.add('hide')
      }
    })
  }

  function checkConfirmation() { 
    if (confirmField.value == passField.value) {
      form.querySelector('.octicon-alert').classList.add('hide')
      form.querySelector('.octicon-check-circle-fill').classList.remove('hide')
    } else {    
      form.querySelector('.octicon-alert').classList.remove('hide')
      form.querySelector('.octicon-check-circle-fill').classList.add('hide')
    }
  }  
})
