class SortTable {
  constructor(table) {
    this.$table = table
    this.control = this.$table.querySelector('.sort-by-title')
    this.arrowUp = this.$table.querySelector('.octicon-arrow-up')
    this.arrowDown = this.$table.querySelector('.octicon-arrow-down')    
  }

  call() {
    if (this.control) this.control.addEventListener('click', event => { this.sortRowsByTitle() })
  }

  sortRowsByTitle() {
    this.$table = document.querySelector('.sortable')
    let rows = this.$table.querySelectorAll('tr')
    let sortedRows = []

    for (let i = 1; i < rows.length; i++) {
      sortedRows.push(rows[i])
    }

    if (this.arrowUp.classList.contains('hide')) {
      sortedRows.sort(compareRowsAsc)
      this.arrowUp.classList.remove('hide')
      this.arrowDown.classList.add('hide')
    } else {
      sortedRows.sort(compareRowsDesc)
      this.arrowUp.classList.add('hide')
      this.arrowDown.classList.remove('hide')
    }    

    let sortedTable = document.createElement('table')
    let thead = document.createElement('thead')
    let tbody = document.createElement('tbody')

    sortedTable.classList.add('sortable','table', 'table-striped', 'mt-3')

    thead.appendChild(rows[0])
    sortedTable.appendChild(thead)

    for (let i = 0; i < sortedRows.length; i++) {
      tbody.appendChild(sortedRows[i])
    }

    sortedTable.appendChild(tbody)
    this.$table.parentNode.replaceChild(sortedTable, this.$table)
  }
}

function compareRowsAsc(row1, row2) {
  let testTitle1 = row1.querySelector('td').textContent
  let testTitle2 = row2.querySelector('td').textContent

  if (testTitle1 < testTitle2) { return -1 }
  if (testTitle1 > testTitle2) { return 1 }
  return 0
}

function compareRowsDesc(row1, row2) {
  let testTitle1 = row1.querySelector('td').textContent
  let testTitle2 = row2.querySelector('td').textContent

  if (testTitle1 < testTitle2) { return 1 }
  if (testTitle1 > testTitle2) { return -1 }
  return 0
}
