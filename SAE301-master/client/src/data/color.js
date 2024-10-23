import { getRequest } from "../lib/api-request.js";

let ColorData = {};

let fakeColor = [
  {
    id: 1,
    colors: "red",
  },
  {
    id: 2,
    colors: "blue",
  },
  {
    id: 3,
    colors: "green",
  },
];

ColorData.fetch = async function (id) {
  let data = await getRequest("products/" + id);
  console.log(data[1]);
  return [data[1]];
};

ColorData.fetchAll = async function (id) {
  let data = await getRequest("products/"+id);
  console.log(data[1]);
  return data[1];
  
};

export { ColorData };
