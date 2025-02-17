import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="cart"
export default class extends Controller {
  initialize() {
    const cart = JSON.parse(localStorage.getItem("cart"));
    if (!cart) {
      return;
    }

    let total = 0;
    const cartItemsContainer = document.getElementById("cartItems");
    const orderItemsElement = document.getElementById('orderItems');
    cart.forEach(item => {
      const row = document.createElement("tr");
      const itemCell = document.createElement("td");
      itemCell.textContent = item.name;
      row.appendChild(itemCell);

      const priceCell = document.createElement("td");
      priceCell.textContent = `${item.price} грн`;
      row.appendChild(priceCell);

      const quantityCell = document.createElement("td");
      quantityCell.textContent = item.quantity;
      row.appendChild(quantityCell);

      const actionsCell = document.createElement("td");
      const deleteButton = document.createElement("button");
      deleteButton.innerText = "Remove";
      deleteButton.value = JSON.stringify({ id: item.id, size: item.size });
      deleteButton.classList.add("bg-primary", "rounded", "text-white", "px-2", "py-1", "ml-2");
      deleteButton.addEventListener("click", this.removeFromCart.bind(this));
      actionsCell.appendChild(deleteButton);
      row.appendChild(actionsCell);

      cartItemsContainer.appendChild(row);

      total += item.price * item.quantity;

      const productData = {
        product_id: item.id,
        quantity: item.quantity,
        price: item.price
      };

      const hiddenProductField = document.createElement("input");
      hiddenProductField.type = "hidden";
      hiddenProductField.name = `order[order_products_attributes][][product_id]`;
      hiddenProductField.value = productData.product_id;
      orderItemsElement.appendChild(hiddenProductField);

      const hiddenQuantityField = document.createElement("input");
      hiddenQuantityField.type = "hidden";
      hiddenQuantityField.name = `order[order_products_attributes][][quantity]`;
      hiddenQuantityField.value = productData.quantity;
      orderItemsElement.appendChild(hiddenQuantityField);

      const hiddenPriceField = document.createElement("input");
      hiddenPriceField.type = "hidden";
      hiddenPriceField.name = `order[order_products_attributes][][price]`;
      hiddenPriceField.value = productData.price;
      orderItemsElement.appendChild(hiddenPriceField);
    });

    const translation = document.getElementById("total");
    const totalText = translation.dataset.totalText || "Total";
    const totalCurrency = translation.dataset.currencyText || "uah";

    const totalEl = document.createElement("div");
    totalEl.innerText = `${totalText}: ${total} ${totalCurrency}`;
    let totalContainer = document.getElementById("total");
    totalContainer.appendChild(totalEl);

    const orderTotalElement = document.getElementById('orderTotal');
    if (orderTotalElement) {
      orderTotalElement.value = total;
      console.log('Order total set:', orderTotalElement.value);
    } else {
      console.error('Order total element not found.');
    }
  }

  clear() {
    localStorage.removeItem("cart");
    window.location.reload();
  }

  removeFromCart(event) {
    const cart = JSON.parse(localStorage.getItem("cart"));
    const values = JSON.parse(event.target.value);
    const {id, size} = values;
    const index = cart.findIndex(item => item.id === id && item.size === size);
    if (index >= 0) {
      cart.splice(index, 1);
    }
    localStorage.setItem("cart", JSON.stringify(cart));
    window.location.reload();
  }
}
