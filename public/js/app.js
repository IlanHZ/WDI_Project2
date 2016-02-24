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
      zoom: 10
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
            '<form action="/properties/' + property.id + '" method="POST">' +
              '<input type="hidden" name="_method" value="DELETE">' +
              '<a class="btn btn-primary" href="/properties/' + property.id + '">Edit</a>' + 
              '<button class="btn btn-secondary">Delete</button>' +
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


});