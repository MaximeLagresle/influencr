import "bootstrap";

// Event listeners to toggle the articles hide.

const bubbles = document.querySelectorAll(".bubble-wrapper")

bubbles.forEach( bubble => {

  bubble.addEventListener("click", (e) => {
    console.log("test")
    const bubblesWindow = document.querySelectorAll(".bubble-right")
    bubblesWindow.forEach( bbl => {
      if ( bbl.classList.contains("hidden-page") ){
        bbl.classList.toggle("hidden-page");
      }
    });

    const hh = e.currentTarget.attributes["data-target-id"].value ;
    document.getElementById(hh).classList.toggle("hidden-page");
  })
});

// Event listener to toggle the article hide on CLOSE button.

const closeButton = document.querySelectorAll(".close-button")

closeButton.forEach( button => {

  button.addEventListener("click", (e) => {

    const close = e.currentTarget.parentNode.parentNode.parentNode
    close.classList.toggle("hidden-page");

  })
});

// Mobile animation for navabr.

var prevScrollpos = window.pageYOffset;
window.onscroll = function() {
  var currentScrollPos = window.pageYOffset;
  if (prevScrollpos > currentScrollPos) {
    document.getElementById("menu-mobile").style.top = "0";
  } else {
    document.getElementById("menu-mobile").style.top = "-67px";
  }
  prevScrollpos = currentScrollPos;
}

// Navigation animation for the logo.

const logo = document.getElementById("menu-logo-container-desktop")
logo.addEventListener("click", (event) => {
  const menu = document.querySelector(".menu")
  menu.classList.toggle("hidden");
});

// Convert last login to current timezone
// Will refactor later

// const lastLogin = document.querySelector("#utc")
// const adjustedTime = new Date(Date.parse(lastLogin.dataset.time))
// lastLogin.innerHTML = adjustedTime.toLocaleString()

