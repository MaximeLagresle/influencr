import "bootstrap";


const bubbles = document.querySelectorAll(".bubble")
bubbles.forEach( bubble => {

  // bubble.addEventListener('mouseover', (e) => {

  //   bubble.classList.toggle("open");
  //   const content = bubble.querySelector(".content");

  //   bubble.addEventListener("transitionend", (event) => {
  //     content.classList.toggle("hidden");
  //   })

  // })

})

// Convert last login to current timezone
// Will refactor later

const lastLogin = document.querySelector("#utc")
const adjustedTime = new Date(Date.parse(lastLogin.dataset.time))
lastLogin.innerHTML = adjustedTime.toLocaleString()

