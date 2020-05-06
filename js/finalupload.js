$(document).ready(function() {
    $(".bookupload").click(function() {
       // console.log("Hai");
       $.post(
           "BookUploadDatabase"
         )
    });
});
