let handler_sub = async function (ev) {
    console.log(ev);
    ev.preventDefault();
    let form = ev.target.form;
    console.log(form);
    let data = new FormData(form);
    let email = data.get("email");
    console.log(email);
    let password = data.get("password");
    console.log(password);
    let ok = await UserData.signin(email, password);
    if (ok) {
        window.location.href = "./index.html";
    }
    else {
        alert("Signin failed");
    }
}
let submit = document.getElementById("signin");
submit.addEventListener("click", handler_sub);