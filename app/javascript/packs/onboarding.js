// Being called on /views/pages/home.html.erb

// jquery
$("#page_one").fadeIn(300, () => {
  console.log("page one loaded")
})

//jquery logic for page one
$("#get-started-button").click((e) => {
 $("#page_one").fadeOut(300, () => {
  $("#page_two").fadeIn(300, () => {
    console.log("page two loaded")
  })
 })
})

//jquery logic for page two
$("#page_two_progress_button").click((e) => {
 $("#page_two").fadeOut(300, () => {
  $("#page_three").fadeIn(300, () => {
    console.log("page three loaded")
  })
 })
})
$("#page_two_previous_button").click((e) => {
 $("#page_two").fadeOut(300, () => {
  $("#page_one").fadeIn(300, () => {
    console.log("page one loaded")
  })
 })
})

//jquery logic for page two
$("#page_three_progress_button").click((e) => {
 $("#page_three").fadeOut(300, () => {
  $("#page_four").fadeIn(300, () => {
    console.log("page four loaded")
  })
 })
})
$("#page_three_previous_button").click((e) => {
 $("#page_three").fadeOut(300, () => {
  $("#page_two").fadeIn(300, () => {
    console.log("page two loaded")
  })
 })
})
