
$(document).on('ready', function() {

    $('#flight-search').on('submit', function(event){
      console.log("form submitted!");
      var data = $('form').serialize();
      console.log(data);
      event.preventDefault();

      $.ajax({
        type: "POST",
        // beforeSend: function (request) {
        //    request.setRequestHeader('Authorization', "Bearer T1RLAQLNph1SRmonSLTk6GTG6U4P6rDG6hChRfItnA8RyrHrdk1mblQQAACgJ5tAmhhlvzAU+XdcMpE2IQcmcbvyjfbRC0XGHq+7mnkWWlsHQooFrEmhct8Kc+HKBKiXYShjoPFljAOAIwklRkMv0dloQLi04FQ+Fg1gK26lZiB6rUEeobr/GfML67z5ThTfaB/OQ3UxduNc8Uar21SK5F/i3RayE7GK1Fdnbg1FiiFDPRQvyPOey0xiXZrTuTQ9BJIUuuZ1CPLpVzCN2Q**");
        //  },
        url: '/flights/search',
        data: data,
        success: function (flights) {
          console.log("Flight Search Data:", flights);
          // data.FareInfo.forEach(function parseflight(flight) {
          //   $('.search-results').append('<p>Destination: '+flight.DestinationLocation+'</p>');
          //   console.log(flight);
          // });


        },
        error: function(err) {
          console.log(err);
        }
      });


    });
  });
