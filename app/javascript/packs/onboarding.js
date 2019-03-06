// Being called on /views/pages/home.html.erb
import Typed from 'typed.js';

let pageTwoRenderCount = 0;
// jquery
$("#page_one").fadeIn(300, () => {
  console.log("page one loaded")
})

//jquery logic for page one
$("#get-started-button").click((e) => {
 $("#page_one").fadeOut(300, () => {
  $("#page_two").fadeIn(300, () => {
    // console.log("page two loaded")

    // Implement an auto-focus on input when page 2 is fadeIn
    $("#input_field").focus();

    // Typed.js animation (refer to _page_two.html.erb for more details)
    if (pageTwoRenderCount === 0) {
      var typed = new Typed('#input_field', {
        stringsElement: '#typed-strings',
        attr: "placeholder",
        typeSpeed: 30
      });
      pageTwoRenderCount += 1;
    }
  })
 })
})

//jquery logic for page two
$("#progress_button_page_two").click((e) => {
 $("#page_two").fadeOut(300, () => {
  $("#page_three").fadeIn(300, () => {
    // console.log("page three loaded")
  })
 })
})
$("#previous_button_page_two").click((e) => {
 $("#page_two").fadeOut(300, () => {
  $("#page_one").fadeIn(300, () => {
    // console.log("page one loaded")
  })
 })
})

//jquery logic for page three
$("#progress_button_page_three").click((e) => {
 $("#page_three").fadeOut(300, () => {
  $("#page_four").fadeIn(300, () => {
    // console.log("page four loaded")
  })
 })
})
$("#previous_button_page_three").click((e) => {
 $("#page_three").fadeOut(300, () => {
  $("#page_two").fadeIn(300, () => {
    // console.log("page two loaded")
  })
 })
})

