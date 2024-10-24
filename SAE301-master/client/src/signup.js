import {UserData} from './src/data/user.js';

let handler_submit = async function (ev) {
    ev.preventDefault();
    let form = ev.target.form;
    let data = new FormData(form);
    let password = data.get("password");
    let confirmed_password = data.get("confirm_password");
    if (password !== confirmed_password) {
        alert("Passwords do not match");
        return;
    }
    data.delete("confirm_password");

    let ok = await UserData.signup(data);

    if (ok) {
        window.location.href = "./src/dist/login.html";
    }
    else {
        alert("Signup failed");
    }
}
let submit = document.getElementById("button[type='submit']");
submit.addEventListener("click", handler_submit);