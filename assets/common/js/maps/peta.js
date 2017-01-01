
$(document).ready(function () {
    var fenway = [-7.316340, 108.197116];

    initialize();
    $(".placepicker").placepicker();
    $("#advanced-placepicker").each(function () {
        var target = this;
        var $collapse = $(this).parents('.form-group').next('.collapse');
        var $map = $collapse.find('.another-map-class');

        var placepicker = $(this).placepicker({
            map: $map.get(0),
            placeChanged: function (place) {
                console.log("place changed: ", place.formatted_address, this.getLocation());
            }
        }).data('placepicker');
    });

    $("#routeEnd").each(function () {
        var target = this;
        var $collapse = $(this).parents('.form-group').next('.collapse');
        var $map = $collapse.find('.another-map-class');

        var placepicker = $(this).placepicker({
            map: $map.get(0),
            placeChanged: function (place) {
                console.log("place changed: ", place.formatted_address, this.getLocation());
            }
        }).data('placepicker');
    });

});

var directionDisplay;
var directionsService = new google.maps.DirectionsService();
var map;
var home = new google.maps.LatLng(-7.316340, 108.197116);

function initialize()
{
    directionsDisplay = new google.maps.DirectionsRenderer();

    var myOptions =
            {
                zoom: 8,
                mapTypeId: google.maps.MapTypeId.ROADMAP,
                center: home
            }
    map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
    directionsDisplay.setMap(map);
    directionsDisplay.setPanel(document.getElementById("directions"));

    var myLatLng = new google.maps.LatLng(52.0951, 5.109);
    var beachMarker = new google.maps.Marker
            ({
                position: myLatLng,
                map: map
            });
}

function calcRoute()
{
    var start = document.getElementById("advanced-placepicker").value;

    var request =
            {
                origin: start,
                destination: home,
                travelMode: google.maps.DirectionsTravelMode.DRIVING
            };
    directionsService.route(request, function (response, status)
    {
        if (status == google.maps.DirectionsStatus.OK)
        {
            directionsDisplay.setDirections(response);
        }
    });
}