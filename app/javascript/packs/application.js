import "bootstrap";

const bubbles = document.querySelectorAll(".bubble-wrapper")

bubbles.forEach( bubble => {

  bubble.addEventListener("click", (e) => {

    const hh = e.currentTarget.attributes["data-target-id"].value ;
    document.getElementById(hh).classList.toggle("hidden-page");
  })
});

const closeButton = document.querySelectorAll(".close-button")

closeButton.forEach( button => {

  button.addEventListener("click", (e) => {

    const close = e.currentTarget.parentNode.parentNode
    close.classList.toggle("hidden-page");

  })
});




const logo = document.getElementById("menu-logo-container")
logo.addEventListener("click", (event) => {
  console.log("test")
  const menu = document.getElementById("menu-content")
  menu.classList.toggle("hidden");
});


// Convert last login to current timezone
// Will refactor later

// const lastLogin = document.querySelector("#utc")
// const adjustedTime = new Date(Date.parse(lastLogin.dataset.time))
// lastLogin.innerHTML = adjustedTime.toLocaleString()

