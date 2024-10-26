import { getRequest } from "../lib/api-request.js";

let ColorData = {};

ColorData.fetch = async function (id) {
  let data = await getRequest("products/" + id);
  return [data[1]];
};

ColorData.fetchAll = async function (id) {
  let data = await getRequest("products/" + id);
  return data[1];
};

export { ColorData };
