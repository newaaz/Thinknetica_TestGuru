class CheckPasswordConfirmation {
  constructor(form) {
    this.$form = form  
    this.password = this.$form.elements.user_password
    this.password_confirm = this.$form.elements.user_password_confirmation 
  }

  call() {
    if (this.password_confirm) {
      this.password_confirm.addEventListener('input', event => {
        if (this.password_confirm.value !== '') {
          this.checkConfirmation()
        } else {
          this.$form.querySelector('.octicon-alert').classList.add('hide')
          this.$form.querySelector('.octicon-check-circle-fill').classList.add('hide')
        }
      })
      this.password.addEventListener('input', event => {
        this.checkConfirmation()
      })
    }
  }

  checkConfirmation() {    
    if (this.password_confirm.value == this.password.value) {
      this.$form.querySelector('.octicon-alert').classList.add('hide')
      this.$form.querySelector('.octicon-check-circle-fill').classList.remove('hide')
    } else {    
      this.$form.querySelector('.octicon-alert').classList.remove('hide')
      this.$form.querySelector('.octicon-check-circle-fill').classList.add('hide')
    }
  }
}
