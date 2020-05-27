$(document).ready(function() {
    $(".userLogin").click(function() {
        var id = $(this).attr("id");
        // console.log(id)
        servletCall(id);

    });
});
function servletCall(id) {
  // console.log(chap_id);
    $.post(
        "UserLoginServlet",
        {name : id},
        function(result) {
          // console.log(result);
          window.location.replace("./../index.jsp");
    });
};
