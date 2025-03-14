import { Controller } from "@hotwired/stimulus"
import Toastify from 'toastify-js';

// Connects to data-controller="products"
export default class extends Controller {
  static values = { size: String, product: Object }

  initialize() {
    this.updateCartCount();
  }

  addToCart() {
    console.log("product: ", this.productValue);
    const cart = localStorage.getItem("cart");
    if (cart) {
      const cartArray = JSON.parse(cart);
      const foundIndex = cartArray.findIndex(item => item.id === this.productValue.id && item.size === this.sizeValue);
      if (foundIndex >= 0) {
        cartArray[foundIndex].quantity = parseInt(cartArray[foundIndex].quantity) + 1;
      } else {
        cartArray.push({
          id: this.productValue.id,
          name: this.productValue.name,
          price: this.productValue.price,
          size: this.sizeValue,
          quantity: 1
        });
      }
      localStorage.setItem("cart", JSON.stringify(cartArray));
    } else {
      const cartArray = [];
      cartArray.push({
        id: this.productValue.id,
        name: this.productValue.name,
        price: this.productValue.price,
        size: this.sizeValue,
        quantity: 1
      });
      localStorage.setItem("cart", JSON.stringify(cartArray));
    }

    Toastify({
      text: `"${this.productValue.name}" додано в кошик!`,
      duration: 3000,
      close: true,
      gravity: "top",
      position: "right",
      style: {
        background: "linear-gradient(to right, #00b09b, #96c93d)",
      }
    }).showToast();

    this.updateCartCount();
  }

  updateCartCount() {
    const cart = localStorage.getItem("cart");
    let cartCount = 0;
    if (cart) {
      const cartArray = JSON.parse(cart);
      cartArray.forEach(item => {
        cartCount += parseInt(item.quantity);
      });
    }
    const cartCountElement = document.querySelector('#cart-count');
    if (cartCountElement) {
      cartCountElement.textContent = cartCount.toString();
    }
  }
}
