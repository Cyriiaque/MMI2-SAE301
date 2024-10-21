import { ProductData } from "./data/product.js";
import { ProductView } from "./ui/product/index.js";
import { CategoryData } from "./data/category.js";
import { CategoryView } from "./ui/category/index.js";

import { PanierData } from "./data/panier.js";
import { PanierView } from "./ui/panier/index.js";

async function loadAccueilTemplate() {
    const response = await fetch("./src/ui/accueil/templateaccueil.html.inc");
    const template = await response.text();
    document.querySelector("#main").innerHTML = template;
    let data = await ProductData.fetchAll();
    let html = ProductView.render(data);
    const productsElement = document.querySelector("#products");
    if (productsElement) {
      productsElement.innerHTML = html;
    } else {
      console.error("Element with ID 'products' not found.");
    }
  
    let dataCat = await CategoryData.fetchAll();
    let htmlCat = CategoryView.render(dataCat);
    const categoryElement = document.querySelector("#category");
    if (categoryElement) {
      categoryElement.innerHTML = htmlCat;
    } else {
      console.error("Element with ID 'category' not found.");
    }

}

async function loadLoginTemplate() {
  try {
    const response = await fetch("./src/ui/login/templatelogin.html.inc");
    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }
    const template = await response.text();
    document.querySelector("#main").innerHTML = template;
  } catch (error) {
    console.error("Error loading Login template:", error);
  }
}

async function loadSignTemplate() {
  try {
    const response = await fetch("./src/ui/sign/templatesign.html.inc");
    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }
    const template = await response.text();
    document.querySelector("#main").innerHTML = template;
  } catch (error) {
    console.error("Error loading Sign template:", error);
  }
}
async function loadPanierTemplate() {
  try {
    const response = await fetch("./src/ui/cart/templatecart.html.inc");
    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }
    const template = await response.text();
    document.querySelector("#main").innerHTML = template;
  } catch (error) {
    console.error("Error loading Panier template:", error);
  }
  let dataCart = await PanierData.fetchAll();
  let htmlCart = PanierView.render(dataCart);
  const cartElement = document.querySelector("#panier");
  if (cartElement) {
    cartElement.innerHTML = htmlCart;
  } else {
    console.error("Element with ID 'cart' not found.");
  }
}

let C = {};
C.init = async function () {
  loadSignTemplate();
  loadLoginTemplate();
  loadPanierTemplate();
  loadAccueilTemplate();
};

C.init();

const mobileMenuButton = document.getElementById("mobile-menu-button");
const mobileMenu = document.getElementById("mobile-menu");

mobileMenuButton.addEventListener("click", () => {
  mobileMenu.classList.toggle("hidden");
});

window.loadAccueilTemplate = loadAccueilTemplate;
window.loadLoginTemplate = loadLoginTemplate;
window.loadSignTemplate = loadSignTemplate;
window.loadPanierTemplate = loadPanierTemplate;
