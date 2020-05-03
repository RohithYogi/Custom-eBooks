$(document).ready( jQuery(function() {
    // body...
        $('.owl-carousel').owlCarousel({
            margin: 10,
            nav: true,
            autoplay: true,
            navText:["<div class='nav-btn prev-slide'></div>","<div class='nav-btn next-slide'></div>"],
            responsive: {
                0: {
                    items: 1,
                },
                600: {
                    items: 4,
                },
                1000: {
                    items: 4,
                }
            }
        });
}));
// 
// document.addEventListener('DOMNodeInserted', function(e) {
//   $('.owl-carousel').owlCarousel({
//       margin: 10,
//       nav: true,
//       navText:["<div class='nav-btn prev-slide'></div>","<div class='nav-btn next-slide'></div>"],
//       responsive: {
//           0: {
//               items: 1
//           },
//           600: {
//               items: 3
//           },
//           1000: {
//               items: 3
//           }
//       }
//   });
// });
