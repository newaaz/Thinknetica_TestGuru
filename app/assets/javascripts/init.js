document.addEventListener('turbolinks:load', function() {
  const sortableTables = [].slice.call(document.querySelectorAll('.sortable'))
  sortableTables.map(function(sortableTable) {
    new SortTable(sortableTable).call()
  })  

  const inputForm = document.getElementById('new_user')
  if (inputForm) new CheckPasswordConfirmation(inputForm).call() 
})
