import { getRequest } from "../lib/api-request.js";

let CardData = {};

CardData.fetch = async function (id) {
    let data = await getRequest("products/" + id);  
    if (data.size == undefined) {
      data.size = "";
    }
    if (data.shoesize == undefined) {
      data.shoesize = "";
    }
    console.log(data);
    return [data];
};

export { CardData };
