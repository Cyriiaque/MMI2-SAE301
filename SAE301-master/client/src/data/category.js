import { getRequest } from "../lib/api-request.js";

let CategoryData = {};

let fakeCategory = [
  {
    id: 1,
    category: "Tshirt",
  },
  {
    id: 2,
    category: "Shorts",
  },
  {
    id: 3,
    category: "Chaussures",
  },
];

CategoryData.fetch = async function (id) {
  let data = await getRequest("category/" + id);
  return data == false ? fakeCategory.pop() : [data];
};

CategoryData.fetchAll = async function () {
  let data = await getRequest("category");
  return data == false ? fakeCategory : data;
};

export { CategoryData };
