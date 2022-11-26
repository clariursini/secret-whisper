// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"

if (window.location.href.includes("?barcode=")) {
  let barcode = window.location.href.split("?barcode=")[1]
  localStorage.setItem("barcode", barcode);
}

console.log(localStorage.getItem("barcode"))

const hiddenDiv = document.getElementById("hidden-div")

if (hiddenDiv && localStorage.getItem("barcode")) {
  let userBarcode = localStorage.getItem("barcode");
  fetch(`${window.location.origin}/barcode/${userBarcode}`)
    .then(res => localStorage.removeItem("barcode"))
    .catch(err => console.log(err));
}
