$(document).ready(function() {
    $(".bookupload").click(function() {
       servletCall();
    });
});
$(document).ready(function() {
    $(".generatePDF").click(function() {
      $.get(
          "DownloadPDFServlet",
          function(result) {
            // console.log(result);
            window.location.replace("jsp/generic.jsp");
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
