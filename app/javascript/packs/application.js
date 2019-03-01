import "bootstrap";


const bubbles = document.querySelectorAll(".content")

bubbles.forEach( bubble => {

  bubble.addEventListener("click", (e) => {
  //   bubble.classList.toggle("open");
    const content = bubble.querySelector(".bubble-right");

  //   bubble.addEventListener("transitionend", (event) => {
  //     content.classList.toggle("hidden");
  //   })

    console.log("hello")
  })

});

// Convert last login to current timezone
// Will refactor later

// const lastLogin = document.querySelector("#utc")
// const adjustedTime = new Date(Date.parse(lastLogin.dataset.time))
// lastLogin.innerHTML = adjustedTime.toLocaleString()

