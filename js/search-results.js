$(document).ready(function(){
          $('.search_field').keyup(function(){
              $.ajax({
                  url: "/GetSearchResults",
                  type: "GET",
                  cache: false,
                  data: { 'search_text' : $('.search_field').val() },
                  success: function(data){
                    $('#search-results').append(data);
                  }
              });
          });
        });
