class ProgressBar {
  constructor(progressBar) {
    this.progressBar = progressBar
    this.currentQuestion = progressBar.dataset.currentQuestion
    this.questionsCount = progressBar.dataset.questionsCount
  }

  setProgress() {
    let progress = Math.round(this.progressBar.dataset.currentQuestion / this.progressBar.dataset.questionsCount * 100)
    this.progressBar.setAttribute('style', 'width:' + progress + '%')
    this.progressBar.innerText = Math.round(progress) + '%'
  }
}
