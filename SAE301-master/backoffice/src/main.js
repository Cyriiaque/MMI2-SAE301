import { ProductData } from "./data/product.js";
let C = {};

C.handler_addproduct = async function (ev) {
  ev.preventDefault();
  let form = ev.target.form;
  let formData = new FormData(form);
  let response = await ProductData.create(formData);
  if (response == false) {
    alert("Veuillez remplir tous les champs");
  } else {
    alert("Produit ajouté");
  }
};

let submit_addproduct = document.querySelector("#addproduct");
submit_addproduct.addEventListener("click", C.handler_addproduct);
