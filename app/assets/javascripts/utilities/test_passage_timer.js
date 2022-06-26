document.addEventListener('turbolinks:load', function() {

  const control = document.getElementById('timer')

  if (control) {
    let timer = setInterval(displayTimer, 1000)

    function displayTimer() {
      if (control.innerText == "0") {         
        sendToResult()        
      } else {
        control.innerText = parseInt(control.innerText) - 1
      }  
    }
  
    function sendToResult() {  
      clearInterval(timer)    

      let testPassageId = control.dataset.testPassageId
      let currentLocation = window.location
      let resultLocation = currentLocation.origin + '/test_passages/' + testPassageId + "/result"

      window.location.replace(resultLocation)
    }
  }  
})
