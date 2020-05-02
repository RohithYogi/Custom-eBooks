$(document).ready(function(){
          $('.search_field').keyup(function(){
              console.log($('.search_field').val());
              $.ajax({
                  url: "GetSearchResults",
                  type: "POST",
                  cache: false,
                  data: { 'search_text' : $('.search_field').val() },
                  success: function(data){
                    $('#search-results').append(data);
                  }
              });
              // $( "#ebooks-search-results" ).load( "./search_element.jsp");
              $.get("./search_element.jsp", function (data) {
                    $("#search-results").html(data);
                });
          });
        });
