import { ProductData } from "./data/product.js";
import { ProductView } from "./ui/product/index.js";

import { CategoryData } from "./data/category.js";
import { CategoryView } from "./ui/category/index.js";

// import './index.css';

let C = {};

C.init = async function () {
  let data = await ProductData.fetchAll();
  let html = ProductView.render(data);
  document.querySelector("#main").innerHTML = html;

  let dataCat = await CategoryData.fetchAll();
  let htmlCat = CategoryView.render(dataCat);
  document.querySelector("#category").innerHTML = htmlCat;
};

C.init();
