import "bootstrap";


$(".bubble").click(function () {
    console.log("test")
    console.log($(this))

    $(this).toggleClass("bl-open")
    $(this).toggleClass("bl-show-text")



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

});
