// jquery
$("#page_one").fadeIn(300, () => {
  console.log("page one loaded")
})

//jquery logic for page one
console.log("hello world")
$("#get-started-button").click((e) => {
  console.log("click the button")
 $("#page_one").fadeOut(300, () => {
  console.log("page one faded")
  $("#page_two").fadeIn(300, () => {
    console.log("page two loaded")
  })
 })
})

//jquery logic for page two
console.log("hello world")
$("#page_two_progress_button").click((e) => {
  console.log("click the button")
 $("#page_two").fadeOut(300, () => {
  console.log("page two faded")
  $("#page_three").fadeIn(300, () => {
    console.log("page three loaded")
  })
 })
})
