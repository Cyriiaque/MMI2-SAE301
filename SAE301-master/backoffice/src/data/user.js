// import { getRequest } from "../lib/api-request.js";
import { postRequest } from "../lib/api-request.js";

let UserData = {};

UserData.add = async function (formdata) {
  let data = await postRequest("user/signup", formdata);
  return data;
};

export { UserData };
