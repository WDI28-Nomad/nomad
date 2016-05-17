
console.log($)
  $.ajax({
    type: "GET",
    beforeSend: function (request) {
       request.setRequestHeader('Authorization', "Bearer T1RLAQIVKQAmKgZrUUXD/lRWVftSRsxkOxC8A+wvh5dQ+goaEpTCrBODAACgsJserITFPWsY0aMTHKOQ7Tq9VSBjapruuagLnsBj822hAFm4cPvXvnzhL9X6f2+ueyh4zi/NpA62F/qSuYbmJ8iKk31IaDaqm5nMgn3QN13ifFMxdw41Itk4apHmkd8CREpZT83ysUpk7Wcx28yP5lksuqKlIJ1aT+kDAAzgcA9fSG2R/uUBAjj+VPFzpBJplbNtxCpu1EewtUTZj0b/2Q**");
     },
    url: 'https://api.test.sabre.com/v2/shop/flights/fares?origin=JFK&departuredate=2016-05-20&returndate=2016-05-27&maxfare=500&pointofsalecountry=US',
    success: function (data) {
      console.log(data);
    }
  });
