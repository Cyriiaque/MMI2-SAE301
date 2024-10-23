// import { getRequest } from "../lib/api-request.js";
import { postRequest } from "../lib/api-request.js";

let UserData = {};

// let fakeUser = [
//   {
//     id_user: 1,
//     last_name: "Dejean",
//     first_name: "Pierre",
//     email: "dejean.pierre@gmail.com",
//     password: "1234",
//   },
//   {
//     id_user: 2,
//     last_name: "Dejeanbon",
//     first_name: "Caillou",
//     email: "dejeanbon.caillou@gmail.com",
//     password: "4321",
//   },
// ];

// UserData.fetch = async function (id) {
//   let data = await getRequest("user/" + id);
//   return data == false ? fakeUser.pop() : [data];
// };

// UserData.fetchAll = async function () {
//   let data = await getRequest("user/1");

//   data.forEach((element) => {
//     if (element.size == undefined) {
//       element.size = "";
//     }
//     if (element.shoesize == undefined) {
//       element.shoesize = "";
//     }
//   });
//   return data == false ? fakeUser : data;
// };

UserData.add = async function (formdata) {
  let data = await postRequest("user/signup", formdata);
  return data;
};

export { UserData };
