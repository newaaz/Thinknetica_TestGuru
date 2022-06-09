document.addEventListener('turbolinks:load', function() {
  // sort rows by title
  const sortableTables = [].slice.call(document.querySelectorAll('.sortable'))
  sortableTables.map(function(sortableTable) {
    new SortTable(sortableTable).call()
  })  

  // check password confirmation
  const inputForm = document.getElementById('new_user')
  if (inputForm) new CheckPasswordConfirmation(inputForm).call()

  // set progress bar
  const progressBar = document.querySelector('.progress-bar')
  if (progressBar) {    
    const setProgressBar = new ProgressBar(progressBar).setProgress()
  }
})
