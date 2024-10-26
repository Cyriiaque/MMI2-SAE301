import { getRequest } from "../lib/api-request.js";

let SizeData = {};

SizeData.fetch = async function (id) {
  let data = await getRequest("products/" + id);
  if (data[3] === null) {
    return [data[2]];
  } else {
    return data.slice(2, 4);
  }
};

SizeData.fetchAll = async function (id) {
  let data = await getRequest("products/" + id);
  if (data[3] === null) {
    return [data[2]];
  } else {
    return data.slice(2, 4);
  }
};

export { SizeData };
