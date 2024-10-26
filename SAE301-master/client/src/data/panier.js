import { getRequest } from "../lib/api-request.js";
import { postRequest } from "../lib/api-request.js";
import { deleteRequest } from "../lib/api-request.js";

let PanierData = {};

PanierData.fetch = async function (id) {
  let orderCount = JSON.parse(localStorage.getItem("ordercount"));
  let data = await getRequest("cart/" + orderCount);

  if (data[id].size == undefined) {
    data.size = "";
  }
  if (data[id].shoesize == undefined) {
    data.shoesize = "";
  }
  return data;
};

PanierData.fetchAll = async function () {
  let orderCount = JSON.parse(localStorage.getItem("ordercount"));
  let data = await getRequest("cart/" + orderCount);

  if (data === false) {
    let div = document.createElement("div");
    div.innerHTML = "Votre panier est vide";
    div.classList.add(
      "min-h-screen",
      "flex",
      "justify-center",
      "items-start",
      "text-2xl"
    );
    document.getElementById("panier").appendChild(div);
    let cartInfoDiv = document.getElementById("cartInfo");
    let cartTitre = document.getElementById("cartTitle");
    if (cartInfoDiv) {
      cartInfoDiv.remove();
      cartTitre.remove();
    }
  } else {
    data.forEach((element) => {
      if (element.size == undefined) {
        element.size = "";
      }
      if (element.shoesize == undefined) {
        element.shoesize = "";
      }
    });
  }

  return data;
};
PanierData.add = async function (formdata) {
  let data = await postRequest("cart/add", formdata);
  return data;
};

PanierData.del = async function (formdata) {
  let data = await deleteRequest("cart/del", formdata);
  return data;
};

PanierData.check = async function (dataorder) {
  let data = await postRequest("cart/check", dataorder);
  return data;
};

export { PanierData };
