import { ProductData } from "./data/product.js";
// import { ProductView } from "./ui/product/index.js";
// import { CategoryData } from "./data/category.js";
// import { CategoryView } from "./ui/category/index.js";

import { PanierData } from "./data/panier.js";
// import { PanierView } from "./ui/panier/index.js";

// import { TypeCardData } from "./data/type.js";
// import { TypeCardView } from "./ui/cardType/index.js";

// import { CardData } from "./data/card.js";
// import { CardView } from "./ui/card/index.js";

// import { ColorData } from "./data/color.js";
// import { ColorView } from "./ui/color/index.js";
let C = {};

C.handler_addproduct = async function (ev) {
  ev.preventDefault();
  let form = ev.target.form;
  let formData = new FormData(form);
  await ProductData.create(formData);
};

let submit_addproduct = document.querySelector("#addproduct");
submit_addproduct.addEventListener("click", C.handler_addproduct);

////////////////////////////////////////

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
  await PanierData.del(formData);
};

let submit_addcart = document.querySelector("#addcart");
submit_addcart.addEventListener("click", C.handler_addcart);

let submit_delcart = document.querySelector("#delcart");
submit_delcart.addEventListener("click", C.handler_delcart);

C.init = async function () {};

C.init();
