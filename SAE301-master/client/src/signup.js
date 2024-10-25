import { UserData } from "./data/user.js";

let handler_adduser = async function (ev) {
  ev.preventDefault();
  let form = ev.target.form;
  let formData = new FormData(form);
  let password = formData.get("password");
  let confirmed_password = formData.get("confirm_password");
  if (password !== confirmed_password) {
    alert("Les mots de passe ne correspondent pas");
    return;
  }
  let response = await UserData.signup(formData);
  if (response) {
    window.location.href = "./signin.html";
  } else {
    alert("L'inscription a échoué, réessayez avec un autre email");
  }
};

let submit_adduser = document.querySelector("#adduser");
submit_adduser.addEventListener("click", handler_adduser);
