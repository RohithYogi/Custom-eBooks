$(document).ready(function() {
    $(".bookupload").click(function() {
       servletCall();
    });
});
$(document).ready(function() {
    $(".removeChapter").click(function() {
      var chap_id = $(this).attr("id");
      $.post(
          "RemoveChapterServlet",
          {name : chap_id},
          function(result) {
            $.get("./jsp/book-list.jsp", function (data) {
                  $("#chapter-list").html(data);
              });
          });
      });
});

function servletCall() {
  // console.log(chap_id);
    $.post(
        "BookUploadDatabase",
        function(result) {
          // console.log(result);
          window.location.replace("jsp/generic.jsp");
    });
};
