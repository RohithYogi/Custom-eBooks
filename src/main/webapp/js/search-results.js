// $(document).ready(function(){
//           $('.search_field').keyup(function(){
//               console.log($('.search_field').val());
//               $.ajax({
//                   url: "GetSearchResults",
//                   type: "POST",
//                   cache: false,
//                   data: { 'search_text' : $('.search_field').val() },
//                   // success: function(data){
//                   //   $('#search-results').append(data);
//                   // }
//               });
//               // $( "#ebooks-search-results" ).load( "./search_element.jsp");
//               $.get("./search_element.jsp", function (data) {
//                     $("#ebooks-search-results").html(data);
//                 });
//           });
//         });
//
//
// function animation() {
//     var i = 0;
//     $('.animate-box').waypoint( function( direction ) {
//
//       if( direction === 'down' && !$(this.element).hasClass('animated-fast') ) {
//
//         i++;
//
//         $(this.element).addClass('item-animate');
//         setTimeout(function(){
//
//           $('body .animate-box.item-animate').each(function(k){
//             var el = $(this);
//             setTimeout( function () {
//               var effect = el.data('animate-effect');
//               if ( effect === 'fadeIn') {
//                 el.addClass('fadeIn animated-fast');
//               } else if ( effect === 'fadeInLeft') {
//                 el.addClass('fadeInLeft animated-fast');
//               } else if ( effect === 'fadeInRight') {
//                 el.addClass('fadeInRight animated-fast');
//               } else {
//                 el.addClass('fadeInUp animated-fast');
//               }
//
//               el.removeClass('item-animate');
//             },  k * 200, 'easeInOutExpo' );
//           });
//
//         }, 100);
//
//       }
//
//     } , { offset: '85%' } );
//   };
