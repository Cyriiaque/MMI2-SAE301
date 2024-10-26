import { getRequest } from "../lib/api-request.js";
import { postRequest } from "../lib/api-request.js";
import { deleteRequest } from "../lib/api-request.js";

let PanierData = {};

let fakePanier = [
  {
    id: 1,
    subtitle: "dfhhdfhfdshjsfkdjdfsjhdfjdfsjhhfdjfhsdjfhsdjfhdsjfhsdfjsdhfjdsh",
    price: 20,
    image:
      "https://www.footcenter.fr/media/catalog/product/cache/82d5e29288185f6fc64d760e116074a6/m/a/maillot-france-domicile-2024-2025-0.jpg",
    name: "maillot pas bo",
    color: "black",
    shoesize: "M",
    size: "",
  },
  {
    id: 2,
    subtitle: "Tshirt",
    price: 20,
    image:
      "https://www.footcenter.fr/media/catalog/product/cache/82d5e29288185f6fc64d760e116074a6/m/a/maillot-france-domicile-2024-2025-0.jpg",
    name: "maillot pas bo",
    color: "black",
    size: "42",
    shoesize: "",
  },
];

PanierData.fetch = async function (id) {
  let data = await getRequest("cart/" + id);

  if (data[id].size == undefined) {
    data.size = "";
  }
  if (data[id].shoesize == undefined) {
    data.shoesize = "";
  }
  return data == false ? fakePanier.pop() : [data];
};

PanierData.fetchAll = async function () {
  let data = await getRequest("cart/1");

  data.forEach((element) => {
    if (element.size == undefined) {
      element.size = "";
    }
    if (element.shoesize == undefined) {
      element.shoesize = "";
    }
  });
  return data == false ? fakePanier : data;
};

PanierData.add = async function (formdata) {
  let data = await postRequest("cart/add", formdata);
  return data;
};

PanierData.del = async function (formdata) {
  let data = await deleteRequest("cart/del", formdata);
  return data;
};

export { PanierData };
