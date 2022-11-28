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

const createBtns = document.querySelectorAll(".create-beer")
const deleteBtns = document.querySelectorAll(".delete-beer")
const deleteDivs = document.querySelectorAll(".delete-beer-div")
const createDivs = document.querySelectorAll(".create-beer-div")

const toggleCreateDivs = (index) => {
  deleteDivs[index].classList.remove("d-none")
  createDivs[index].classList.add("d-none")
  location.reload();
}

const toggleDeleteDivs = (index) => {
  deleteDivs[index].classList.add("d-none")
  createDivs[index].classList.remove("d-none")
  location.reload();
}

createBtns.forEach((btn, index) => {
  btn.addEventListener("click", (e) => {
    fetch(`${window.location.origin}/create_beer/${btn.dataset.recipientId}`,
      {
        method: "POST",
      })
      .then(res => toggleCreateDivs(index))
      .catch((err) => console.log(err));
  })
})

deleteBtns.forEach((btn, index) => {
  btn.addEventListener("click", (e) => {
    fetch(`${window.location.origin}/delete_beer/${btn.dataset.targetId}`,
      {
        method: "DELETE",
      })
      .then(res => toggleDeleteDivs(index))
      .catch((err) => console.log(err));
  })
})
