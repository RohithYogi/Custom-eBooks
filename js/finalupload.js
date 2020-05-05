$(document).ready(function() {
    $(".bookupload").click(function() {
       console.log("Hai");
       $.post(
           "BookUploadDatabase"
         )
    });
    window.location.replace("./html/signup.html");
});
