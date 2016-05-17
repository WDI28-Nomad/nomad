
// $(document).on('ready', function() {
//
//     $('#flight-search').on('submit', function(event){
//       console.log("form submitted!");
//       var data = $('form').serialize();
//       console.log(data);
//       event.preventDefault();
//
//       $.ajax({
//         type: "GET",
//         beforeSend: function (request) {
//            request.setRequestHeader('Authorization', "Bearer T1RLAQIVKQAmKgZrUUXD/lRWVftSRsxkOxC8A+wvh5dQ+goaEpTCrBODAACgsJserITFPWsY0aMTHKOQ7Tq9VSBjapruuagLnsBj822hAFm4cPvXvnzhL9X6f2+ueyh4zi/NpA62F/qSuYbmJ8iKk31IaDaqm5nMgn3QN13ifFMxdw41Itk4apHmkd8CREpZT83ysUpk7Wcx28yP5lksuqKlIJ1aT+kDAAzgcA9fSG2R/uUBAjj+VPFzpBJplbNtxCpu1EewtUTZj0b/2Q**");
//          },
//         url: 'https://api.test.sabre.com/v2/shop/flights/fares',
//         data: $('form').serialize(),
//         success: function (data) {
//           console.log(data);
//         },
//         error: function(err) {
//           console.log(err);
//         }
//       });
//     });
//   });
