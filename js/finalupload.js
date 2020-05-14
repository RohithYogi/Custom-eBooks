$(document).ready(function() {
    $(".bookupload").click(function() {
    });
});
$(document).ready(function() {
  $('body').on('click','.removeChapter',function(){
    var chap_id = $(this).attr("id");
    $.post(
        "RemoveChapterServlet",
        {name : chap_id},
        function(result) {
          $.get("./jsp/book-list.jsp", function (data) {
                $("#chapter-list").html(data);
            });
          toastr.success("Chapter removed")
        });
  });
});

$(document).ready(function() {
  $('body').on('click','.removeChapterPublisher',function(){
    var chap_id = $(this).attr("id");
    $.post(
        "RemoveChapterServlet",
        {name : chap_id},
        function(result) {
          $.get("./jsp/publisher.jsp", function (data) {
                $("#chapter-list-publisher").html(data);
            });
          toastr.success("Chapter removed")
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
