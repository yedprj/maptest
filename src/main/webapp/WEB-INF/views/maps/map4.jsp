<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://d3js.org/d3.v3.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.js"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.css">

</head>
<body>
    <div id="areachart"></div>
</body>
<script>
    $(document).ready(function (){
        var areachart = c3.generate({
            bindto: "#areachart",
            data: {
                columns: [
                    ['data1', 300, 350, 300, 190, 50, 25],
                    ['data2', 130, 100, 140, 200, 150, 50]
                ],
                types: {
                    data1: 'area-spline',
                    data2: 'area-spline'
                }
            }
        });

        $.ajax({
            url: "/maps/public",
            type: "GET",
            dataType : "text",
            success : function (result) {
                console.log(result);

                let resultParse = JSON.parse(result);
                console.log(resultParse);


            }
        });
    });

</script>
</html>
