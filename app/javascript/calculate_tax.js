function calculate_tax(){
  // console.log('発火');
  const priceInput = document.getElementById("item-price")
  priceInput.addEventListener('keyup', () => {
    // console.log(priceInput.value);
    const price = Number(priceInput.value);
    const tax = Math.floor(price * 0.1);
    // console.log(tax);
    const profit = price - tax;
    // console.log(profit);
  });
};

window.addEventListener('turbo:load', calculate_tax);