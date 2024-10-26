import { ProductData } from "./data/product.js";
import { ProductView } from "./ui/product/index.js";
import { CategoryData } from "./data/category.js";
import { CategoryView } from "./ui/category/index.js";

import { PanierData } from "./data/panier.js";
import { PanierView } from "./ui/panier/index.js";

import { TypeCardData } from "./data/type.js";
import { TypeCardView } from "./ui/cardType/index.js";

import { CardData } from "./data/card.js";
import { CardView } from "./ui/card/index.js";

import { ColorData } from "./data/color.js";
import { ColorView } from "./ui/color/index.js";

import { SizeData } from "./data/size.js";
import { SizeView } from "./ui/size/index.js";

import { UserData } from "./data/user.js";

let C = {};

if (!localStorage.getItem("user")) {
  let orderCount = 0;
  localStorage.setItem("ordercount", JSON.stringify(orderCount));
}

C.loadAccueilTemplate = async function () {
  if (localStorage.getItem("user")) {
    let user = JSON.parse(localStorage.getItem("user"));
    let accountname = user.last_name + " " + user.first_name;
    document.querySelector("#accountname").textContent = accountname;
    document.querySelector("#logout").textContent = "Se déconnecter";
    document.querySelector("#logout").classList =
      "text-black-color hover:bg-light-grey-color font-medium rounded-lg text-sm px-4 py-2 md:px-5 md:py-2.5 border-solid border border-grey-color";
    document.querySelector("#logout").addEventListener("click", async () => {
      localStorage.removeItem("user");
      document.querySelector("#accountname").textContent = " ";
      document.querySelector("#logout").textContent = " ";
      document.querySelector("#logout").classList = " ";
      await UserData.signout("signout");
    });
  }

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
  let cardProduct = document.querySelector("#products");
  cardProduct.addEventListener("click", C.loadCardTemplate);
};
let accueil = document.querySelector("#accueil");
accueil.addEventListener("click", C.loadAccueilTemplate);

C.loadPanierTemplate = async function () {
  if (!localStorage.getItem("user")) {
    alert("Vous devez être connecté pour accéder à votre panier.");
    window.location.href = "./signin.html";
    return;
  }

  if (localStorage.getItem("user")) {
    let user = JSON.parse(localStorage.getItem("user"));
    let accountname = user.last_name + " " + user.first_name;
    document.querySelector("#accountname").textContent = accountname;
    document.querySelector("#logout").textContent = "Se déconnecter";
    document.querySelector("#logout").classList =
      "text-black-color hover:bg-light-grey-color font-medium rounded-lg text-sm px-4 py-2 md:px-5 md:py-2.5 border-solid border border-grey-color";
    document.querySelector("#logout").addEventListener("click", async () => {
      localStorage.removeItem("user");
      window.location.href = "./signin.html";
      await UserData.signout("signout");
    });
  }

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
  let promoElements = document.querySelectorAll("#promotion");
  let total = 0;
  promoElements.forEach((promoElement) => {
    let promoValueElement = promoElement.querySelector("#promo-value");
    let promo = document.querySelector("#promo");
    let quantity = promoElement.querySelector("#quantity");
    let code = document.querySelector("#code-value");
    C.updateTotal();
    let totalCount = document.querySelector("#total");
    let priceValueElement = promoElement.querySelector("#price-value");
    if (promoValueElement && priceValueElement) {
      let promoValue = parseFloat(promoValueElement.textContent);
      let priceValue = parseFloat(priceValueElement.textContent);
      let codeValue = parseFloat(code.textContent);
      let quantityValue = parseFloat(quantity.textContent);

      if (promoValue === 0) {
        promo.style.display = "none";
        total += priceValue * quantityValue;
      } else {
        let prixtotal = priceValue - (priceValue * promoValue) / 100;
        total += prixtotal * quantityValue;
        priceValueElement.textContent = prixtotal.toFixed(2);
        priceValueElement.style.textDecoration = "underline";
      }
      totalCount.textContent = total.toFixed(2);
      if (codeValue != 0) {
        let prixtotal = total - (total * codeValue) / 100;
        totalPromo.textContent = prixtotal.toFixed(2);
      } else {
        totalPromo.textContent = total;
      }
    } else {
      console.error("Promo or Price element not found within promoElement.");
    }
    let orderCountInputs = document.querySelectorAll("input[name='id_order']");
    if (orderCountInputs.length > 0) {
      orderCountInputs.forEach((input) => {
        let count = JSON.parse(localStorage.getItem("ordercount"));
        input.value = count;
      });
    } else {
      console.error("Input elements with name 'id_order' not found.");
    }
  });
  document.querySelectorAll("#addcart").forEach((element) => {
    element.addEventListener("click", C.addQuantity);
  });

  document.querySelectorAll("#delcart").forEach((element) => {
    element.addEventListener("click", C.lessQuantity);
  });
  document.querySelectorAll("#addcart").forEach((element) => {
    element.addEventListener("click", C.handler_addcart);
  });

  let validatecart = document.querySelector("#validatecart");
  validatecart.addEventListener("click", C.handler_ordercreate);

  document.querySelectorAll("#delcart").forEach((element) => {
    element.addEventListener("click", C.handler_delcart);
  });
};
document.querySelector("#cart").addEventListener("click", C.loadPanierTemplate);

C.handler_ordercreate = async function () {
  let orderCount = JSON.parse(localStorage.getItem("ordercount"));
  orderCount += 1;
  localStorage.setItem("ordercount", JSON.stringify(orderCount));
  let temp = JSON.parse(localStorage.getItem("user"));
  let UserId = temp.id_user;

  let tableaux = JSON.stringify({ UserId, orderCount });
  let tableau = encodeURI(tableaux);
  await PanierData.check(tableau);
  C.loadAccueilTemplate();
};

C.addQuantity = function (ev) {
  let quantityContainer = ev.target.closest("div");
  let quantity = quantityContainer.querySelector("#quantity");
  let stock = document.querySelector("#stock");
  let quantityValue = parseFloat(quantity.textContent);
  quantityValue += 1;
  quantity.textContent = quantityValue;
  if (quantityValue > 1) {
    quantityContainer.querySelector("#delcart").classList.remove("hidden");
  } else if (quantityValue == stock.textContent) {
    quantityContainer.querySelector("#addcart").classList.add("hidden");
  }
  C.updateTotal();
};

C.lessQuantity = function (ev) {
  let quantityContainer = ev.target.closest("div");
  let quantity = quantityContainer.querySelector("#quantity");
  let quantityValue = parseFloat(quantity.textContent);
  if (quantityValue >= 2) {
    quantityValue -= 1;
    quantity.textContent = quantityValue;
    if (quantityValue == 1) {
      C.loadPanierTemplate();
    }
  } else {
    C.loadPanierTemplate();
  }
  C.updateTotal();
};

C.updateTotal = function () {
  let promoElements = document.querySelectorAll("#promotion");
  let total = 0;
  promoElements.forEach((promoElement) => {
    let quantity = promoElement.querySelector("#quantity");
    let code = document.querySelector("#code-value");
    let totalPromo = document.querySelector("#totalPromo");
    let totalCount = document.querySelector("#total");
    let priceValueElement = promoElement.querySelector("#price-value");
    let priceValue = parseFloat(priceValueElement.textContent);
    let codeValue = parseFloat(code.textContent);
    let quantityValue = parseFloat(quantity.textContent);

    let maxQuantity = 0;
    let maxQuantityProduct = null;

    promoElements.forEach((promoElement) => {
      let quantity = promoElement.querySelector("#quantity");
      let quantityValue = parseFloat(quantity.textContent);
      let stock = promoElement.querySelector("#stock");
      let quantityPlusButton = promoElement.querySelector("#addcart");
      if (stock.textContent == quantity.textContent) {
        quantityPlusButton.classList.add("hidden");
      } else {
        quantityPlusButton.classList.remove("hidden");
      }
      if (quantityValue > maxQuantity) {
        maxQuantity = quantityValue;
        maxQuantityProduct = promoElement;
      }
    });

    promoElements.forEach((promoElement) => {
      let priceValueElement = promoElement.querySelector("#price-value");
      let labelPromoElement = promoElement.querySelector("#labelPromo");
      if (priceValueElement) {
        let originalPrice = parseFloat(
          priceValueElement.dataset.originalPrice ||
            priceValueElement.textContent
        );
        if (promoElement === maxQuantityProduct) {
          let discountedPrice = originalPrice * 0.8; // Apply 20% discount
          priceValueElement.textContent = discountedPrice.toFixed(2);
          if (labelPromoElement) {
            labelPromoElement.classList.remove("hidden");
          }
        } else {
          priceValueElement.textContent = originalPrice.toFixed(2);
          labelPromoElement.classList.add("hidden");
        }
        priceValueElement.dataset.originalPrice = originalPrice;
      }
    });

    if (priceValueElement) {
      let prixtotal = priceValue;
      total += priceValue * quantityValue;
      priceValueElement.textContent = prixtotal.toFixed(2);
      totalCount.textContent = total.toFixed(2);
      if (codeValue != 0) {
        let prixtotal = total - (total * codeValue) / 100;
        totalPromo.textContent = prixtotal.toFixed(2);
      } else {
        totalPromo.textContent = total;
      }
    } else {
      console.error("Promo or Price element not found within promoElement.");
    }
  });
};

C.loadTypeTemplate = async function (ev) {
  let div = ev.target.closest("a");
  if (div) {
    let type = div.textContent;
    try {
      const response = await fetch("./src/ui/type/templatetype.html.inc");
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      let template = await response.text();
      template = template.replace(/{{type}}/g, type);

      document.querySelector("#main").innerHTML = template;
    } catch (error) {
      console.error("Error loading Panier template:", error);
    }
    let dataType = await TypeCardData.fetchAll(type);
    let htmlType = TypeCardView.render(dataType);
    const typeElement = document.querySelector("#type");
    if (typeElement) {
      typeElement.innerHTML = htmlType;
    } else {
      console.error("Element with ID 'type' not found.");
    }
    let promoElements = document.querySelectorAll("#promotion");
    promoElements.forEach((promoElement) => {
      let promoValueElement = promoElement.querySelector("#promo-value");
      let promo = document.querySelector("#promo");
      let priceValueElement = promoElement.querySelector("#price-value");
      let newprice = promoElement.querySelector("#newprice");

      if (promoValueElement && priceValueElement) {
        let promoValue = parseFloat(promoValueElement.textContent);
        let priceValue = parseFloat(priceValueElement.textContent);

        if (promoValue === 0) {
          let newPromo = promoElement.querySelector("#promo");
          newPromo.style.display = "none";
        } else {
          let prixtotal = priceValue - (priceValue * promoValue) / 100;
          newprice.textContent = prixtotal.toFixed(2) + "€";
          priceValueElement.style.textDecoration = "line-through";
        }
      } else {
        console.error("Promo or Price element not found within promoElement.");
      }
    });
  } else {
    console.error("Element with data-id not found.");
  }
  let cardProduct = document.querySelector("#type");
  cardProduct.addEventListener("click", C.loadCardTemplate);
};
let category = document.querySelector("#category");
category.addEventListener("click", C.loadTypeTemplate);

C.loadCardTemplate = async function (ev) {
  let article = ev.target.closest("article");
  if (article) {
    let id = article.dataset.id;
    let datacard = await CardData.fetch(id);
    let html = CardView.render(datacard);
    document.querySelector("#main").innerHTML = html;

    let dataColor = await ColorData.fetchAll(id);
    let ColorElement = document.querySelector("#color");
    let htmlColor = ColorView.render(dataColor);
    let promoValueElement = document.querySelector("#promo-value");
    let priceValueElement = document.querySelector("#price-value");
    let promoValue = parseFloat(promoValueElement.textContent);
    let priceValue = parseFloat(priceValueElement.textContent);
    let stock = document.querySelector("#viewStock");
    let stockValue = parseFloat(stock.textContent);
    if (stockValue === 0) {
      let addcart = document.querySelector("#addToCart");
      addcart.classList.add("hidden");
      let infoElement = document.querySelector("#info");
      let infoStock = document.createElement("h3");
      infoStock.textContent = "Rupture de stock";
      infoElement.appendChild(infoStock);
    } else if (stockValue === 1) {
      let infoElement = document.querySelector("#info");
      let infoStock = document.createElement("h3");
      infoStock.textContent = "Dernier article en stock";
      infoElement.appendChild(infoStock);
    } else if (stockValue < 5) {
      let infoElement = document.querySelector("#info");
      let infoStock = document.createElement("h3");
      infoStock.textContent = "Bientôt en rupture de stock";
      infoElement.appendChild(infoStock);
    }

    if (promoValue > 0) {
      let discountedPrice = priceValue - (priceValue * promoValue) / 100;
      priceValueElement.textContent = discountedPrice.toFixed(2) + "€";
    }

    if (ColorElement) {
      ColorElement.innerHTML = htmlColor;
      let colorItems = ColorElement.querySelectorAll("div");
      colorItems.forEach((item, index) => {
        if (index < dataColor.length) {
          let color = dataColor[index];
          let classes = item.className.split(" ");
          let newClasses = classes.filter((cls) => !cls.includes(`bg-`));
          newClasses.push(`bg-${color}-color`);
          item.className = newClasses.join(" ");
        }
      });
    }
    let dataSize = await SizeData.fetch(id);
    let SizeElement = document.querySelector("#sizes");
    let htmlSizes = dataSize.map((size) => SizeView.render(size)).join("");
    if (SizeElement) {
      SizeElement.innerHTML = htmlSizes;
    }
    let SizeNotNull = document.querySelectorAll("option");
    SizeNotNull.forEach((sizeElement) => {
      if (sizeElement.textContent.trim() === "null") {
        sizeElement.remove();
      }
    });
  }

  let defaultSelectedSize = getSelectedSize();
  defaultSelectedSize = selectedSize;

  let selectedColorValue = getSelectedColor();
  selectedColorValue = selectedColor;

  let value = document.querySelector("#sizes");
  value.addEventListener("change", getSelectedSize);

  let colorsValue = document.querySelectorAll("#color div");
  colorsValue.forEach((colorElement) => {
    colorElement.addEventListener("click", (ev) => {
      selectedColorValue = getSelectedColor(ev);
    });
  });
  addtocart();

  let submit_addcart = document.querySelector("#addcart");
  submit_addcart.addEventListener("click", (ev) => {
    alert("Article ajouté au panier");
    C.handler_addcart(ev);
    let stockElement = document.querySelector("#viewStock");
    let stockValue = parseInt(stockElement.textContent, 10);
    stockValue -= 1;
    stockElement.textContent = stockValue;
    if (stockValue <= 0) {
      let addcart = document.querySelector("#addToCart");
      addcart.classList.add("hidden");
    }
  });
};

let selectedSize;
let selectedColor;

async function addtocart() {
  const mainElement = document.querySelector("#main div");
  if (mainElement) {
    let nameClass = document.querySelector("#className");
    let nameClassValue = nameClass.textContent;

    const name = mainElement.dataset.id;
    let color = selectedColor;
    let size = selectedSize;
    let shoesize = selectedSize;
    if (nameClassValue == "Tshirt" || nameClassValue == "Short") {
      shoesize = "null";
    } else {
      size = "null";
    }
    let tableaux = JSON.stringify({ name, color, size, shoesize });
    let tableau = encodeURI(tableaux);
    let responseTab = await fetch("../api/products/" + tableau);
    let responseData = await responseTab.json();
    let imageElement = document.querySelector("#image");
    if (imageElement && responseData.image) {
      imageElement.src = responseData.image;
    } else {
      console.error("Image element or image URL not found in responseData.");
    }

    let id_product = document.querySelector("input[name='id_product']");
    if (id_product) {
      id_product.value = responseData.id_product;
    } else {
      console.error("Input element with name 'id_product' not found.");
    }
    let orderCountInput = document.querySelector("input[name='id_order']");
    if (orderCountInput) {
      let orderCount = JSON.parse(localStorage.getItem("ordercount"));
      orderCountInput.value = orderCount;
    } else {
      console.error("Input element with name 'orderCount' not found.");
    }
    return responseData;
  }
}

async function getSelectedColor(ev) {
  if (ev) {
    const colorElement = ev.target.closest("div");
    if (colorElement) {
      const colorClass = Array.from(colorElement.classList).find(
        (cls) => cls.startsWith("bg-") && cls.endsWith("-color")
      );
      if (colorClass) {
        selectedColor = colorClass.split("-")[1];
      }
    }
  } else {
    const firstColorElement = document.querySelector("#color div");
    if (firstColorElement) {
      const colorClass = Array.from(firstColorElement.classList).find(
        (cls) => cls.startsWith("bg-") && cls.endsWith("-color")
      );
      if (colorClass) {
        selectedColor = colorClass.split("-")[1];
      }
    }
  }

  addtocart();
  return selectedColor;
}

async function getSelectedSize() {
  const selectElement = document.getElementById("sizes");
  selectedSize = selectElement.value;
  addtocart();
  return selectedSize;
}

C.handler_addcart = async function (ev) {
  ev.preventDefault();
  let form = ev.target.form;
  let formData = new FormData(form);
  await PanierData.add(formData);
};

C.handler_delcart = async function (ev) {
  ev.preventDefault();
  let form = ev.target.form;
  let formData = new FormData(form);
  let urlEncoded = new URLSearchParams(formData).toString();
  await PanierData.del(urlEncoded);
};

C.init = async function () {
  C.loadAccueilTemplate();
};

C.init();

const mobileMenuButton = document.getElementById("mobile-menu-button");
const mobileMenu = document.getElementById("mobile-menu");
const menuMobile = document.getElementById("menu-mobile");
const menuCategory = document.getElementById("menu-category");

mobileMenuButton.addEventListener("click", () => {
  while (menuMobile.firstChild) {
    menuCategory.appendChild(menuMobile.firstChild);
  }

  mobileMenu.classList.toggle("hidden");
  menuMobile.classList.toggle("hidden");
});
