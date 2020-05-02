$(document).ready(function() {
    $(".bookupload").click(function() {
       console.log("Hai");
        servletCall();

    });
});
function servletCall() {
  // console.log(chap_id);
    $.post(
        "BookUploadDatabase",
        function(result) {
          console.log(result);
    });
};
