import { getRequest } from "../lib/api-request.js";

let ProductData = {};

let fakeProducts = [
  {
    id: 1,
    name: "Pain",
    id_products: 2,
    image:"https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/d56ebd9e-15f9-4aa3-9e52-c23f5b5c5930/M+NK+DF+STRK+TOP+SS.png"
  },
  {
    id: 2,
    name: "Lait",
    id_products: 1,
    image:"https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/d56ebd9e-15f9-4aa3-9e52-c23f5b5c5930/M+NK+DF+STRK+TOP+SS.png"
  },
  {
    id: 3,
    name: "Beurre",
    id_products: 1,
    image:"https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/d56ebd9e-15f9-4aa3-9e52-c23f5b5c5930/M+NK+DF+STRK+TOP+SS.png"
  },
  {
    id: 4,
    name: "Farine",
    id_products: 2,
    image:"https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/d56ebd9e-15f9-4aa3-9e52-c23f5b5c5930/M+NK+DF+STRK+TOP+SS.png"
  },
];

ProductData.fetch = async function (id) {
  let data = await getRequest("products/" + id);
  return data == false ? fakeProducts.pop() : [data];
};

ProductData.fetchAll = async function () {
  let data = await getRequest("products");
  return data == false ? fakeProducts : data;
};

export { ProductData };
