import { getRequest } from "../lib/api-request.js";

let ColorData = {};

let fakeColor = [
  {
    id: 1,
    color: "red",
  },
  {
    id: 2,
    color: "blue",
  },
  {
    id: 3,
    color: "green",
  },
];

ColorData.fetch = async function (id) {
  let data = await getRequest("products/" + id);
  return data == false ? fakeColor.pop() : [data];
};

ColorData.fetchAll = async function () {
  let data = await getRequest("products");
  return data == false ? fakeColor : data;
};

export { ColorData };
