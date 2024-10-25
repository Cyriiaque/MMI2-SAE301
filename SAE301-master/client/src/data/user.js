// import { getRequest } from "../lib/api-request.js";
import { postRequest } from "../lib/api-request.js";

let UserData = {};

UserData.signup = async function (formdata) {
  let data = await postRequest("user/signup", formdata);
  return data;
};

UserData.signin = async function (formdata) {
  let data = await postRequest("user/signin", formdata);
  return data;
};

UserData.signout = async function (formdata) {
  let data = await postRequest("user/signout", formdata);
  return data;
};

export { UserData };
