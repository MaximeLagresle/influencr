import "bootstrap";

// Convert last login to current timezone
// Will refactor later

const lastLogin = document.querySelector("#utc")
const adjustedTime = new Date(Date.parse(lastLogin.dataset.time))
lastLogin.innerHTML = adjustedTime.toLocaleString()
