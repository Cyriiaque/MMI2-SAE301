import { UserData } from "./data/user.js";

let handler_cnx = async function (ev) {
  ev.preventDefault();
  let form = ev.target.form;
  let formdata = new FormData(form);
  let ok = await UserData.signin(formdata);
  if (ok) {
    console.log(ok);
    window.location.href = "./index.html";
    localStorage.setItem("user", JSON.stringify(ok));
  } else {
    alert("Signin failed");
  }
};
let submit = document.getElementById("signin");
submit.addEventListener("click", handler_cnx);
