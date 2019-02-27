import "bootstrap";

const bubbles = document.querySelectorAll(".bubble")
bubbles.forEach( bubble => {
  bubble.addEventListener('click', (e) => {

    const content = bubble.querySelector(".content");
    // console.log(content.offsetHeight);
    bubble.classList.toggle("extend");
    // content.classList.toggle("hidden");

    e.target.style.height =  `${e.target.offsetHeight + (content.offsetHeight+50)}px`
    bubble.addEventListener("transitionend", (event) => {
      content.classList.toggle("hidden");
  })
 })
})


    // e.target.style.height =  `${e.target.offsetHeight + content.offsetHeight}px`
    // console.log(e.target.offsetHeight + 76);



// jQuery.fn.animateAuto = function(prop, speed, callback){
//     var elem, height, width;
//     return this.each(function(i, el){
//         el = jQuery(el), elem = el.clone().css({"height":"auto","width":"auto"}).appendTo("body");
//         height = elem.css("height"),
//         width = elem.css("width"),
//         elem.remove();

//         if(prop === "height")
//             el.animate({"height":height}, speed, callback);
//         else if(prop === "width")
//             el.animate({"width":width}, speed, callback);
//         else if(prop === "both")
//             el.animate({"width":width,"height":height}, speed, callback);
//     });
// }



// $(".bubble").click(function () {
//   console.log($("p.content"))
//   $("p.content").toggleClass("hidden")
  // $(this).animateAuto("height", 100);
    // console.log("test")
    // console.log($(this))



    // sleep(2000);
    // $(this).toggleClass("bl-show-text")



    // close = $(this);
    // //getting the next element
    // open = close.next();
    // //open up the content needed - toggle the slide- if visible, slide up, if not slidedown.
    // open.slideToggle(400, function () {
    //     //execute this after slideToggle is done
    //     //change text of header based on visibility of content div
    //     close.text(function () {
    //         //change text based on condition
    //         return open.is(":visible") ? "Opened" : "Closed";
    //     });
    // });

// });
