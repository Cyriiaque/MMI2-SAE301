import { getRequest } from "../lib/api-request.js";

let ProductData = {};

let fakeProducts = [
  {
    id: 1,
    name: "Pain",
    category: 2,
  },
  {
    id: 2,
    name: "Lait",
    category: 1,
  },
  {
    id: 3,
    name: "Beurre",
    category: 1,
  },
  {
    id: 4,
    name: "Farine",
    category: 2,
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
