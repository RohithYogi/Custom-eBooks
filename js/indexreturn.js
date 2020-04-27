$(document).ready(function() {
    $(".bookblock").click(function() {
        var chap_id = $(this).attr("id");
        servletCall(chap_id);

    });
});
function servletCall(chap_id) {
  // console.log(chap_id);
    $.post(
        "AddBookServelt",
        {name : chap_id},
        function(result) {
          // console.log(result);
          window.location.replace("./../index.jsp");
    });
};
