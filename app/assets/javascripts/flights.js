
$(document).on('ready page:load', function() {

    $('#flight-search').on('submit', function(event){
      console.log("form submitted!");
      var data = $('form').serialize();
      console.log(data);
      event.preventDefault();
      $('.search-results').html('')

      $.ajax({
        type: "GET",
        // beforeSend: function (request) {
        //    request.setRequestHeader('Authorization', "Bearer T1RLAQLNph1SRmonSLTk6GTG6U4P6rDG6hChRfItnA8RyrHrdk1mblQQAACgJ5tAmhhlvzAU+XdcMpE2IQcmcbvyjfbRC0XGHq+7mnkWWlsHQooFrEmhct8Kc+HKBKiXYShjoPFljAOAIwklRkMv0dloQLi04FQ+Fg1gK26lZiB6rUEeobr/GfML67z5ThTfaB/OQ3UxduNc8Uar21SK5F/i3RayE7GK1Fdnbg1FiiFDPRQvyPOey0xiXZrTuTQ9BJIUuuZ1CPLpVzCN2Q**");
        //  },
        // url: 'https://api.test.sabre.com/v2/shop/flights/fares',
        url:"http://localhost:3000/flights/search",
        data: data,
        success: function (response) {
          console.log("Flight Search Data:", response.FareInfo);
          var airports = [];
          console.log("Empty Airports:", airports);

          response.FareInfo.forEach(function parseflight(flight) {
            var newFlightObject = flightCoordinates(flight.DestinationLocation);
            console.log("New Flight Object: ", newFlightObject);
            $('.search-results').append('<p>Destination: '+flight.DestinationLocation+' - '+flight.LowestFare.Fare+'</p>');
            // airports.push(flight.DestinationLocation);
          });

          console.log("Full Airports:", airports);

        },
        error: function(err) {
          console.log(err);
        }
      });

    });

    function flightCoordinates(airportCode) {
      console.log("FlightCoordinates getting called.")
      var airport = airportCode

      $.ajax({
        type: 'GET',
        url: 'https://maps.googleapis.com/maps/api/geocode/json?address='+airport+'+airport&key=AIzaSyATl1C376VZ4AGorIBLCyTTdc-19GynoJw',
        success: function (airportResponse){
          console.log("Airport Latitude:", airportResponse.results[0].geometry.location.lat);
          console.log("Airport Longitude:", airportResponse.results[0].geometry.location.lng);

        },
        error: function(err){
          console.log(err);
        }
      });
    }
    
    var flightMap;
    function initMap(){
      flightMap = new google.maps.Map(document.getElementById('map'), {
        center: {lat: -34.397, lng: 150.644},
        zoom: 8
      });
    }
    initMap();
});
