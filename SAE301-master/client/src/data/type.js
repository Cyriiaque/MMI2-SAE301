import { getRequest } from "../lib/api-request.js";

let TypeCardData = {};

TypeCardData.fetch = async function (id) {
  let data = await getRequest("category/" + id);
  return data;
};

TypeCardData.fetchAll = async function (type) {
  let data = await getRequest("category/" + type);
  return data;
};

export { TypeCardData };
