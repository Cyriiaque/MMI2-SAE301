import { getRequest } from "../lib/api-request.js";

let PanierData = {};

let fakePanier = [
  {
    id: 1,
    subtitle: "Tshirt",
    price: 20,
    image:"https://www.footcenter.fr/media/catalog/product/cache/82d5e29288185f6fc64d760e116074a6/m/a/maillot-france-domicile-2024-2025-0.jpg",
    name: "maillot pas bo",
    color: "black",   
    shoesize: "M",
  },
  {
    id: 2,
    subtitle: "Tshirt",
    price: 20,
    image:"https://www.footcenter.fr/media/catalog/product/cache/82d5e29288185f6fc64d760e116074a6/m/a/maillot-france-domicile-2024-2025-0.jpg",
    name: "maillot pas bo",
    color: "black",   
    size: "M",
  }
];

PanierData.fetch = async function (id) {
  let data = await getRequest("products/" + id);
  
  if (data[id].size == undefined) {
    data.size = "";
  }
  if (data[id].shoesize == undefined) {
    data.shoesize = "";
  }
  return data == false ? fakePanier.pop() : [data];
};

PanierData.fetchAll = async function () {
  let data = await getRequest("products");
  
  data.forEach(element => {
    if (element.size == undefined) {
      element.size = "";
    }
    if (element.shoesize == undefined) {
      element.shoesize = "";
    
  }
});
  return data == false ? fakePanier : data;

};

export { PanierData };
