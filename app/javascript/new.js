function calc() {
  const price = document.getElementById("item-price")
  price.addEventListener('input', () => {
   const value_price = price.value
   const sum1 = value_price * 0.1
   const sum2 = value_price - sum1
   
   const commission = document.getElementById("add-tax-price")
   commission.innerHTML = sum1;

   const profits = document.getElementById("profit")
   profits.innerHTML = sum2;
  })
}
window.addEventListener('load', calc);



