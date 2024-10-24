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


let C = {};

C.loadAccueilTemplate = async function () {
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
}
let accueil = document.querySelector("#accueil");
accueil.addEventListener("click", C.loadAccueilTemplate);


// C.loadLoginTemplate= async function () {
//   try {
//     const response = await fetch("./src/ui/login/templatelogin.html.inc");
//     if (!response.ok) {
//       throw new Error(`HTTP error! status: ${response.status}`);
//     }
//     const template = await response.text();
//     document.querySelector("#main").innerHTML = template;
//   } catch (error) {
//     console.error("Error loading Login template:", error);
//   }
//   let sign = document.querySelector("#sign");
//   sign.addEventListener("click", C.loadSignTemplate);
// }



// C.loadSignTemplate= async function () {
//   try {
//     const response = await fetch("./src/ui/sign/templatesign.html.inc");
//     if (!response.ok) {
//       throw new Error(`HTTP error! status: ${response.status}`);
//     }
//     const template = await response.text();
//     document.querySelector("#main").innerHTML = template;
//   } catch (error) {
//     console.error("Error loading Sign template:", error);
//   }
//   let login1 =document.querySelector("#login1");
//   console.log(login1);
//   login1.addEventListener("click", C.loadLoginTemplate);
// }
// let login =document.querySelector("#login");
// login.addEventListener("click", C.loadLoginTemplate);

C.loadPanierTemplate= async function () {
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
  console.log(dataCart);
  let htmlCart = PanierView.render(dataCart);
  const cartElement = document.querySelector("#panier");
  if (cartElement) {
    cartElement.innerHTML = htmlCart;
  } else {
    console.error("Element with ID 'cart' not found.");
  }
  let promoElements = document.querySelectorAll("#promotion");
  let total = 0;
  promoElements.forEach(promoElement => {
    
    let promoValueElement = promoElement.querySelector("#promo-value");
    let promo = document.querySelector("#promo");
    let quantity = promoElement.querySelector("#quantity");
    let code = document.querySelector("#code-value");
    C.updateTotal();
    let totalCount = document.querySelector("#total");
    let priceValueElement = promoElement.querySelector("#price-value");
    console.log(promoValueElement);
    console.log(priceValueElement);
    if (promoValueElement && priceValueElement) {
    let promoValue = parseFloat(promoValueElement.textContent);
    let priceValue = parseFloat(priceValueElement.textContent);
    let codeValue = parseFloat(code.textContent);
    let quantityValue = parseFloat(quantity.textContent);
    console.log(quantityValue);

    if (promoValue === 0) {
      promo.style.display = "none";
      total += priceValue* quantityValue;
      console.log(total);
    } else {
      let prixtotal = priceValue - ((priceValue * promoValue) / 100);
      total += (prixtotal* quantityValue);
      console.log(total);
      priceValueElement.textContent = prixtotal.toFixed(2);
      priceValueElement.style.textDecoration = "underline";
    }
    totalCount.textContent = total.toFixed(2);
    if (codeValue != 0){
      let prixtotal = total - (total * codeValue / 100);
      totalPromo.textContent = prixtotal.toFixed(2);
    }
    else{
      totalPromo.textContent = total;
    }
    } else {
    console.error("Promo or Price element not found within promoElement.");
    }
  });
document.querySelectorAll("#quantityplus").forEach(element => {
  element.addEventListener("click", C.addQuantity);
});

document.querySelectorAll("#quantitymoins").forEach(element => {
  element.addEventListener("click", C.lessQuantity);
});

  
}
document.querySelector("#cart").addEventListener("click", C.loadPanierTemplate);

C.addQuantity = function(ev){
  let quantityContainer = ev.target.closest("div");
  let quantity = quantityContainer.querySelector("#quantity");
  let stock = document.querySelector("#stock");
  console.log(stock);
  let quantityValue = parseFloat(quantity.textContent);
  quantityValue += 1;
  quantity.textContent = quantityValue;
  if (quantityValue > 1){
    quantityContainer.querySelector("#quantitymoins").classList.remove("hidden");
  }
  else if (quantityValue == stock.textContent){
    quantityContainer.querySelector("#quantityplus").classList.add("hidden");
  }
  C.updateTotal();
}

C.lessQuantity = function(ev){
  let quantityContainer = ev.target.closest("div");
  let quantity = quantityContainer.querySelector("#quantity");
  let hide = quantityContainer.querySelector("#quantitymoins");
  let quantityValue = parseFloat(quantity.textContent);
  if (quantityValue > 1){
    quantityValue -= 1;
    quantity.textContent = quantityValue;
  }
  else{
    hide.classList.add("hidden");
  }
  C.updateTotal();
}

C.updateTotal = function() {
  let promoElements = document.querySelectorAll("#promotion");
  let total = 0;
  promoElements.forEach(promoElement => {
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

    promoElements.forEach(promoElement => {
      let quantity = promoElement.querySelector("#quantity");
      let quantityValue = parseFloat(quantity.textContent);

      if (quantityValue > maxQuantity) {
      maxQuantity = quantityValue;
      maxQuantityProduct = promoElement;
      }
    });

    promoElements.forEach(promoElement => {
      let priceValueElement = promoElement.querySelector("#price-value");
      let labelPromoElement = promoElement.querySelector("#labelPromo");
      if (priceValueElement) {
      let originalPrice = parseFloat(priceValueElement.dataset.originalPrice || priceValueElement.textContent);
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
      if (codeValue != 0){
        let prixtotal = total - (total * codeValue / 100);
        totalPromo.textContent = prixtotal.toFixed(2);
      }
      else{
        totalPromo.textContent = total;
      }
    } else {
      console.error("Promo or Price element not found within promoElement.");
    }
  });
}



C.loadTypeTemplate = async function (ev) {
  let div = ev.target.closest("a");
  console.log(div);
  if (div) {
    let type = div.textContent;
    console.log(type);
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
    promoElements.forEach(promoElement => {
      let promoValueElement = promoElement.querySelector("#promo-value");
      let promo = document.querySelector("#promo");
      let priceValueElement = promoElement.querySelector("#price-value");
      let newprice = promoElement.querySelector("#newprice");
      console.log(promoValueElement);
      console.log(priceValueElement);

      if (promoValueElement && priceValueElement) {
      let promoValue = parseFloat(promoValueElement.textContent);
      let priceValue = parseFloat(priceValueElement.textContent);

      if (promoValue === 0) {
        promo.style.display = "none";
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
}
let category = document.querySelector("#category");
category.addEventListener("click", C.loadTypeTemplate);

C.loadCardTemplate = async function (ev) {
  let article = ev.target.closest("article");
  console.log(article);
  if (article) {
    let id = article.dataset.id;
    console.log(article.dataset.id);
    let datacard = await CardData.fetch(id);
    let html = CardView.render(datacard);
    document.querySelector("#main").innerHTML = html;

    let dataColor = await ColorData.fetchAll(id);
    console.log(dataColor);
    let ColorElement = document.querySelector("#color");
    let htmlColor = ColorView.render(dataColor);   
    console.log(htmlColor);
    console.log(ColorElement);
    let promoValueElement = document.querySelector("#promo-value");
    let priceValueElement = document.querySelector("#price-value");
    let promoValue = parseFloat(promoValueElement.textContent);
    let priceValue = parseFloat(priceValueElement.textContent);
    console.log(promoValue);
    console.log(priceValue);

    if (promoValue > 0) {
      let discountedPrice = priceValue - (priceValue * promoValue / 100);
      priceValueElement.textContent = discountedPrice.toFixed(2);
    }

    if (ColorElement) {
      ColorElement.innerHTML = htmlColor;
      let colorItems = ColorElement.querySelectorAll("div");
      colorItems.forEach((item, index) => {
      if (index < dataColor.length) {
        let color = dataColor[index];
        let classes = item.className.split(" ");
        let newClasses = classes.filter(cls => !cls.includes(`bg-`));
        newClasses.push(`bg-${color}-color`);
        item.className = newClasses.join(" ");
      }
      });
    }
    let dataSize = await SizeData.fetch(id);
    let SizeElement = document.querySelector("#sizes");
    let htmlSizes = dataSize.map(size => SizeView.render(size)).join('');   
    if (SizeElement) {
      SizeElement.innerHTML = htmlSizes;
    }
    let SizeNotNull = document.querySelectorAll("option");
      SizeNotNull.forEach(sizeElement => {
        if (sizeElement.textContent.trim() === "null") {
          sizeElement.remove();
        }
      });
    }
    let selectedColorValue = getSelectedColor();
    console.log("Default selected color:", selectedColorValue);

    let defaultSelectedSize = getSelectedSize();
    console.log("Default selected size:", defaultSelectedSize);

    let value = document.querySelector("#sizes");
    value.addEventListener("change", getSelectedSize);

    let colorsValue = document.querySelectorAll("#color div");
    colorsValue.forEach(colorElement => {
      colorElement.addEventListener("click", (ev) => {
        selectedColorValue = getSelectedColor(ev);
        console.log("Selected color:", selectedColorValue);
      });
    });
    addtocart(); 
    let buttonAdd = document.querySelector("#addToCart");
    buttonAdd.addEventListener("click", addtocart);

    let submit_addcart = document.querySelector("#addcart");
    submit_addcart.addEventListener("click", C.handler_addcart);
}
let orderCount = 1;
  async function addtocart() {
    const selectedSize = getSelectedSize();
    const selectedColorValue = getSelectedColor();
    const mainElement = document.querySelector("#main div");
    if (mainElement) {
    let nameClass = document.querySelector("#className");
    let nameClassValue = nameClass.textContent;

    const name = mainElement.dataset.id;
    console.log(name);
    let color = selectedColorValue;
    let size = selectedSize;
    let shoesize =selectedSize;
    if (nameClassValue == "Tshirt" || nameClassValue == "Short"){
      shoesize = "null";
    } else {
      size = "null";
    }
    let tableaux = JSON.stringify({name,color, size,shoesize});
    console.log(tableaux);
    let tableau = encodeURI(tableaux);
    console.log(tableau);
    let responseTab = await fetch(`../api/products/` + tableau);
    let responseData = await responseTab.json();
    console.log(responseData);

    let id_product = document.querySelector("input[name='id_product']");
    if (id_product) {
      id_product.value = responseData.id_product;
    } else {
      console.error("Input element with name 'id_product' not found.");
    }
    console.log(orderCount);
    let orderCountInput = document.querySelector("input[name='id_order']");
    if (orderCountInput) {
      orderCountInput.value = orderCount;
    } else {
      console.error("Input element with name 'orderCount' not found.");
    }

    console.log(id_product);
    return responseData;
  }
}
function getSelectedColor(ev) {
  let selectedColor = null;
  if (ev) {
    const colorElement = ev.target.closest('div');
    if (colorElement) {
      const colorClass = Array.from(colorElement.classList).find(cls => cls.startsWith('bg-') && cls.endsWith('-color'));
      if (colorClass) {
        selectedColor = colorClass.split('-')[1];

        return selectedColor;
      }
    }
  }
    const firstColorElement = document.querySelector("#color div");
    if (firstColorElement) {
      const colorClass = Array.from(firstColorElement.classList).find(cls => cls.startsWith('bg-') && cls.endsWith('-color'));
      if (colorClass) {
        selectedColor = colorClass.split('-')[1];
        return selectedColor;
      }
    }
    return selectedColor;
  }

function getSelectedSize() {
  const selectElement = document.getElementById('sizes');
  const selectedSize = selectElement.value;
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

C.handler_adduser = async function (ev) {
  ev.preventDefault();
  let form = ev.target.form;
  let formData = new FormData(form);
  await UserData.add(formData);
};



C.init = async function () {
  C.loadAccueilTemplate();
};

C.init();

const mobileMenuButton = document.getElementById("mobile-menu-button");
const mobileMenu = document.getElementById("mobile-menu");

mobileMenuButton.addEventListener("click", () => {
  mobileMenu.classList.toggle("hidden");
});
