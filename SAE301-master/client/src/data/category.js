import { getRequest } from "../lib/api-request.js";

let CategoryData = {};

CategoryData.fetch = async function (id) {
  let data = await getRequest("category/" + id);
  return data;
};

CategoryData.fetchAll = async function () {
  let data = await getRequest("category");
  return data;
};

export { CategoryData };
