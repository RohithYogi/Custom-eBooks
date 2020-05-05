$(document).ready(function() {
    $(".chapter-add-button").click(function() {
        var chap_id = $(this).attr("id");
        if(+chap_id === -1 ){
          console.log("skip");
        }
        else {
          addChapterCall(chap_id);
        }
    });
});
$(document).ready(function() {
    $(".bookblock").click(function() {
      var chap_id = $(this).attr("id");
      servletCall(chap_id);
      $(".chapter-add-button").attr("id", chap_id);
    });
});
$(document).ready(function() {
    $("#finish").click(function() {
      window.location.replace('../index.jsp');
    });
});
// document.addEventListener('DOMNodeInserted', function(e) {
//   $(".bookblock").click(function() {
//       var chap_id = $(this).attr("id");
//       servletCall(chap_id);
//
//   });
// });
function servletCall(chap_id) {
  // console.log(chap_id);
    $.post(
        "GetBookSrcServlet",
        {name : chap_id},
        function(result) {
          $("#pdf_frame").attr("src", result);
          // console.log(result);
          // window.location.replace("./../index.jsp");
    });
};

function addChapterCall(chap_id) {
  // console.log(chap_id);
    $.post(
        "AddBookServelt",
        {name : chap_id},
        function(result) {
        // $( "#ebooks-search-results" ).load( "./search_element.jsp");
        $.get("./book-list-min.jsp", function (data) {
              $("#chapter-list").html(data);
          });
    });
};
