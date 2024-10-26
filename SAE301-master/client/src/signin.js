import { UserData } from "./data/user.js";
import { CategoryData } from "./data/category.js";
import { CategoryView } from "./ui/category/index.js";

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
