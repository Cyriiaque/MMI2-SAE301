import { UserData } from "./data/user.js";
import { CategoryData } from "./data/category.js";
import { CategoryView } from "./ui/category/index.js";

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

const mobileMenuButton = document.getElementById("mobile-menu-button");
const mobileMenu = document.getElementById("mobile-menu");
const menuMobile = document.getElementById("menu-mobile");
const menuCategory = document.getElementById("menu-category");

mobileMenuButton.addEventListener("click", () => {
  while (menuMobile.firstChild) {
    menuCategory.appendChild(menuMobile.firstChild);
  }
  
  mobileMenu.classList.toggle("hidden");
  menuMobile.classList.toggle("hidden");
});

let loadCategories = async function () {
  let data = await CategoryData.fetchAll();
  let div = document.getElementById("category");
  div.innerHTML = CategoryView.render(data);
}
loadCategories();