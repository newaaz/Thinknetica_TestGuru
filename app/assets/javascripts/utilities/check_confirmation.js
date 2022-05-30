class CheckPasswordConfirmation {
  constructor(selector) {
    this.$form = document.querySelector(selector)
    this.password = this.$form.elements.user_password
    this.password_confirm = this.$form.elements.user_password_confirmation

    this.setup()
  }

  setup() {
    this.password_confirm.addEventListener('input', event => {
      if (this.password_confirm.value !== '') {
        this.checkConfirmation()
      } else {
        this.$form.querySelector('.octicon-alert').classList.add('hide')
        this.$form.querySelector('.octicon-check-circle-fill').classList.add('hide')
      }
    })
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


document.addEventListener('turbolinks:load', function() {
  var checkPassConfirm = new CheckPasswordConfirmation('#new_user')
})
