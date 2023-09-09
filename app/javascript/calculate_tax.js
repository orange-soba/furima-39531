function calculate_tax(){
  // console.log('発火');
  const priceInput = document.getElementById("item-price")
  priceInput.addEventListener('keyup', () => {
    // console.log(priceInput.value);
  });
};

window.addEventListener('turbo:load', calculate_tax);