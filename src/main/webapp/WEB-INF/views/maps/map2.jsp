<%--
  Created by IntelliJ IDEA.
  User: samin
  Date: 2022-04-04
  Time: 오전 11:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>api 지도 테스트</title>

    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c90bdebf3673cc3f95bdf6e4e29975f8&libraries=services,clusterer,drawing"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
    <div id="map" style="width: 800px; height: 800px"></div>
</body>
<script>

    var lat = new Array();
    var logt = new Array();
    var markers = [];

    var map = new kakao.maps.Map(document.getElementById('map'), {
        center : new kakao.maps.LatLng(37.5642135, 127.0016985),
        level : 12
    });

    var clusterer = new kakao.maps.MarkerClusterer({
        map : map,
        averageCenter : true,
        minLevel : 10
    });

    $.ajax({
        url : "/maps/elApi",
        type : "GET",
        dataType : "text",
        success : function (data) {
            console.log(data);

            console.log($(data).find('row'));

            let datas = $(data).find('row');

            for (let i = 0; i <= datas.length; i++) {
                lat[i] = $(datas[i]).find("REFINE_WGS84_LAT").text();

                logt[i] = $(datas[i]).find("REFINE_WGS84_LOGT").text();
            }
            maps(lat, logt);
        }
    });

    function maps(lat, lot){
        for (let i = 0; i < lat.length; i++) {

            var marker = new kakao.maps.Marker({
                position : new kakao.maps.LatLng(lat[i], lot[i])
            });

            markers.push(marker);
        }

        clusterer.addMarkers(markers);
    }
</script>
</html>
