function calculation (){
  const priceInput = document.getElementById("item-price");
  const taxPrice = document.getElementById("add-tax-price");
  const profitPrice = document.getElementById("profit");

  priceInput.addEventListener("keyup", () => {
    const price = parseFloat(priceInput.value);
    const tax = Math.floor(price * 0.1);
    const profit = price - tax;

    taxPrice.textContent = tax; // 修正
    profitPrice.textContent = profit; // 修正
  });
}

window.addEventListener('turbo:load', calculation);
