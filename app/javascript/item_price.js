function calculation (){
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profitPrice = document.getElementById("profit");

  priceInput.addEventListener("input", () => {
    const price = parseFloat(priceInput.value);
    const tax = Math.floor(price * 0.1);
    const profit = price - tax;

    addTaxDom.innerHTML = tax;
    profitPrice.innerHTML= profit;
  });
}

window.addEventListener('turbo:load', calculation);
