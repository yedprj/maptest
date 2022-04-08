<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c90bdebf3673cc3f95bdf6e4e29975f8&libraries=services,clusterer,drawing"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
    <div id="map" style="width: 800px; height: 800px"></div>
</body>

<script>
   var mapContainer = document.getElementById("map"),
       mapOption = {
           center: new kakao.maps.LatLng(36.685122, 129.431162),
           level : 3
       };

   var map = new kakao.maps.Map(mapContainer, mapOption);


    $.ajax({
        url : '/maps/mapss',
        type : 'GET',
        dataType : 'text',
        success : function (data) {

            console.log($(data).find('row'));

            if (data) {

                $(data).find("row").each(function (){
                    var lat = $(this).find("lat").text();
                    var lon = $(this).find("lon").text();

                    var markerPosition = new kakao.maps.LatLng(lat, lon);

                    var marker = new kakao.maps.Marker({
                        map : map,
                        position: markerPosition
                    });

                    marker.setMap(map);
                })
            }
        }
    });

</script>

</html>

