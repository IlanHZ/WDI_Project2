$(function() {

  var $propertyForm = $('form#property');
  var $map = $('#property-map');
  var $markers = [];

  function closeAllInfoWindows(){
    markers.forEach(function(marker){
      marker.infoWindow.close();
    });

  }

  if($map.length) {

    var map = new google.maps.Map($map[0], {
      center: {lat:51.5117, lng: -0.1275},
      zoom: 10,
      styles: [{"stylers":[{"hue":"#2c3e50"},{"saturation":250}]},{"featureType":"road","elementType":"geometry","stylers":[{"lightness":50},{"visibility":"simplified"}]},{"featureType":"road","elementType":"labels","stylers":[{"visibility":"off"}]}]
    });

    var propertyData = JSON.parse($('[name=property-data]').val());
    console.log(propertyData);

    markers = propertyData.map(function(property){

      var marker = new google.maps.Marker({
        position: { lat: property.lat, lng: property.lng},
        animation: google.maps.Animation.DROP,
        map: map
      });

      var infoWindow = new google.maps.InfoWindow({
        position: { lat: property.lat, lng: property.lng},
        content: '<div class="info-window">' +
          '<h4>' + property.address1 + '</h4>' + 
          '<h5>' + property.price +'£'+ '</h5>' +
            '<form action="/properties/' + property.id + '" method="POST">' +
              '<input type="hidden" name="_method" value="DELETE">' +
              '<a class="btn btn-primary" href="/properties/' + property.id + '">More informations about this property</a>' + 
            '<form>' +
          '</div>'
      });

      marker.infoWindow = infoWindow;

      marker.addListener('click', function(){
        closeAllInfoWindows();
        marker.infoWindow.open(map, marker);
        map.panTo(marker.position);
        map.setZoom(12);
      });

      return marker;

    });

  }

  if($propertyForm.length){

    var gcoder = new google.maps.Geocoder();
    var $fields = $propertyForm.find('input');

    $fields.on('blur', function(){
      var formData = $propertyForm.serializeArray();
      var address = formData.map(function(dataObj){
        return dataObj.value;
      }).filter(function(value) {
        return!!value;
      }).join(', ');

      gcoder.geocode({ address: address}, function(results, status){
        if (status === "OK"){
          var location = results[0].geometry.location;
          console.log(location.lat(),location.lat(), $fields);
          $fields.filter('[name="property[lat]"]').val(location.lat());
          $fields.filter('[name="property[lng]"]').val(location.lng());
          // console.log(location.lat(), location.long()); all the code needed to find an address
        }
      });
    });

  }

      // Cache a reference to the hidden content.
      var hiddenContent = $( "div.content" );
      // Bind to the Read More link to toggle the
      $( "a.readMore" ).click(
          function( event ){
              // Cancel the default event (this isn't a real link).
              event.preventDefault();
              // Check to see if the content is visible.
              if (hiddenContent.is( ":visible" )){
                  // Hide it slowly.
                  hiddenContent.slideUp( 2000 );
              } else {
                  // Show it slowly.
                  hiddenContent.slideDown( 9000 );
              }
          }
      );



});