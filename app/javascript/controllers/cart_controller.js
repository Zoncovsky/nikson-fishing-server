import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="cart"
export default class extends Controller {
  initialize() {

    console.log("cart controller initialized")
    const cart = JSON.parse(localStorage.getItem("cart"))
    if (!cart) {
      return
    }

    let total = 0;
    const cartItemsContainer = document.getElementById("cartItems");
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
    });

    const translation = document.getElementById("total");
    const totalText = translation.dataset.totalText || "Total";
    const totalCurrency = translation.dataset.currencyText || "uah";
    
    const totalEl = document.createElement("div");
    totalEl.innerText = `${totalText}: ${total} ${totalCurrency}`;
    let totalContainer = document.getElementById("total");
    totalContainer.appendChild(totalEl);
  }

  clear() {
    localStorage.removeItem("cart")
    window.location.reload()
  }

  removeFromCart(event) {
    const cart = JSON.parse(localStorage.getItem("cart"))
    const values = JSON.parse(event.target.value)
    const {id, size} = values
    const index = cart.findIndex(item => item.id === id && item.size === size)
    if (index >= 0) {
      cart.splice(index, 1)
    }
    localStorage.setItem("cart", JSON.stringify(cart))
    window.location.reload()
  }

  checkout() {
    const cart = JSON.parse(localStorage.getItem("cart"))
    const payload = {
      authenticity_token: "",
      cart: cart
    }

    const csrfToken = document.querySelector("[name='csrf-token']").content

    fetch("/checkout", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": csrfToken
      },
      body: JSON.stringify(payload)
    }).then(response => {
        if (response.ok) {
          response.json().then(body => {
            window.location.href = body.url
          })
        } else {
          response.json().then(body => {
            const errorEl = document.createElement("div")
            errorEl.innerText = `There was an error processing your order. ${body.error}`
            let errorContainer = document.getElementById("errorContainer")
            errorContainer.appendChild(errorEl)
          })
        }
      })
  }
}
