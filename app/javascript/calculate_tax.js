function calculate_tax(){
  const priceInput = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  priceInput.addEventListener('keyup', () => {
    const price = priceInput.value;
    const tax = Math.floor(price * 0.1);
    addTaxPrice.innerHTML = tax.toLocaleString();
    profit.innerHTML = (price - tax).toLocaleString();
  });
};

window.addEventListener('turbo:load', calculate_tax);