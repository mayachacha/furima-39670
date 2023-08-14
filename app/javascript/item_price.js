document.addEventListener("DOMContentLoaded", () => {
  const priceInput = document.getElementById("item-price");
  
  priceInput.addEventListener("input", () => {
    const addTaxDom = document.getElementById("add-tax-price");
    const addPofitDom = document.getElementById("profit");
    
    const price = parseFloat(priceInput.value);
    const tax = Math.floor(price * 0.1);
    const profit = price - tax;
    
    addTaxDom.textContent = tax.toLocaleString();
    addPofitDom.textContent = profit.toLocaleString();
  });
});