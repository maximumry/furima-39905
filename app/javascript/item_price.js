document.addEventListener('turbo:load', () => {

  const calc = document.getElementById("item-price")
  const addTaxPrice = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")

  calc.addEventListener('input', () => {
    const inputValue = calc.value;
    if(inputValue >= 300 && inputValue <= 9999999){
      addTaxPrice.innerHTML = Math.floor(inputValue * 0.1)
      profit.innerHTML = Math.floor(inputValue * 0.9)
    } else {
      addTaxPrice.innerHTML = "---"
      profit.innerHTML = "---" 
    }
  })
})


