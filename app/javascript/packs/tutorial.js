$("#tutorial_page_one").fadeIn(300, () => {
  // console.log("page one loaded")
    $('#text1').fadeIn(300, () => {
      setTimeout(() => {
        $('#text2').fadeIn(300, () => {
          setTimeout(() => {
            $('#text3').fadeIn(300, () => {

            })
          }, 1800)
        })

      }, 1800)

    })

  setTimeout(() => {
    $("#tutorial_page_one").fadeOut(300, () => {
      $("#tutorial_page_two").fadeIn(300)
    })
  }, 8000)
})

  // $("#menu li").hover(
  //   function () {
  //     $(this).children("ul").fadeIn();
  //   },
  //  function () {
  //    timer = setInterval(function () {
  //       $(this).children("ul").delay(1000).fadeOut();
  //    }, 1000);
  //    clearInterval(timer);
  //  });
