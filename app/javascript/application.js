// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"

// ---------------BARCODE---------------------------- //

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

// ---------------BEER BUTTONS---------------------------- //

const createBtns = document.querySelectorAll(".create-beer")
const deleteBtns = document.querySelectorAll(".delete-beer")
const deleteDivs = document.querySelectorAll(".delete-beer-div")
const createDivs = document.querySelectorAll(".create-beer-div")

const toggleCreateDivs = (index) => {
  deleteDivs[index].classList.remove("d-none")
  createDivs[index].classList.add("d-none")
  setTimeout(() => {
    location.reload()
  }, 1000);

}

const toggleDeleteDivs = (index) => {
  deleteDivs[index].classList.add("d-none")
  createDivs[index].classList.remove("d-none")
  setTimeout(() => {
    location.reload()
  }, 1000);
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

// ---------------GAME CHOICES---------------------------- //

const hand1 = document.querySelectorAll(".hand1")
hand1.forEach((hand) => {
  hand.addEventListener('click', e => {
    hand1.forEach((mano) => {
      mano.classList.remove("bg-secondary")
    })
    hand.classList.add("bg-secondary")
  })
})

const hand2 = document.querySelectorAll(".hand2")
hand2.forEach((hand) => {
  hand.addEventListener('click', e => {
    hand2.forEach((mano) => {
      mano.classList.remove("bg-secondary")
    })
    hand.classList.add("bg-secondary")
  })
})

const hand3 = document.querySelectorAll(".hand3")
hand3.forEach((hand) => {
  hand.addEventListener('click', e => {
    hand3.forEach((mano) => {
      mano.classList.remove("bg-secondary")
    })
    hand.classList.add("bg-secondary")
  })
})

const hand4 = document.querySelectorAll(".hand4")
hand4.forEach((hand) => {
  hand.addEventListener('click', e => {
    hand4.forEach((mano) => {
      mano.classList.remove("bg-secondary")
    })
    hand.classList.add("bg-secondary")
  })
})

const hand5 = document.querySelectorAll(".hand5")
hand5.forEach((hand) => {
  hand.addEventListener('click', e => {
    hand5.forEach((mano) => {
      mano.classList.remove("bg-secondary")
    })
    hand.classList.add("bg-secondary")
  })
})

const hand6 = document.querySelectorAll(".hand6")
hand6.forEach((hand) => {
  hand.addEventListener('click', e => {
    hand6.forEach((mano) => {
      mano.classList.remove("bg-secondary")
    })
    hand.classList.add("bg-secondary")
  })
})

window.addEventListener('popstate', function (event) {
	// Log the state data to the console
  console.log("entro al metodo popstateeeee")
	console.log(event.state);
});
