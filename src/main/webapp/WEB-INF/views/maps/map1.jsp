<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>API 차트 동시 테스트</title>

    <style>
        .canvas {
            display: flex;
            justify-content: center;
        }
    </style>
</head>
<body>
    <div id="year_select" class="canvas ">
        <select class="custom-select col-md-3 mb-3" name="year" id="year">
            <option selected>년도를 선택해주세요</option>
            <option value="2020">2020년</option>
            <option value="2021">2021년</option>
            <option value="2022">2022년</option>
        </select>
        <select class="custom-select col-md-3 mb-3" name="month" id="month">
            <option selected>월을 선택해주세요</option>
            <option value="01">1월</option>
            <option value="02">2월</option>
            <option value="03">3월</option>
            <option value="04">4월</option>
            <option value="05">5월</option>
            <option value="06">6월</option>
            <option value="07">7월</option>
            <option value="08">8월</option>
            <option value="09">9월</option>
            <option value="10">10월</option>
            <option value="11">11월</option>
            <option value="12">12월</option>
        </select>
        <button type="button" class="btn btn-secondary col-md-2 mb-3" id="search" name="search">검색</button>
    </div>
    <div id="canvas_Chart" class="canvas">
        <div id="canvas_Chart1">
            <canvas id="myChart" width="1600" height="700"></canvas>
        </div>
    </div>
</body>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<script>
    const decide_cnt = new Array();
    const state_dt = new Array();
    const death_cnt = new Array();

    let year = "";
    let month = "";
    let min_day = "";
    let max_day = "";
    let data_label1 = "";
    let data_label2 = "";

    $(document).ready(function () {
        $.ajax({
            url : "/maps/apii",
            type : "GET",
            dateType : "text",
            success : function (xml) {
                console.log(xml);
                console.log($(xml).children());
                console.log($(xml).find('item'));

                let data = $(xml).find('item');

                console.log(data[49]);
                console.log(data.length);

                let j = 0;
                for( let i = data.length - 1; i >= 0; i--) {
                    decide_cnt[j] = $(data[i]).find('decidecnt').text();

                    state_dt[j] = $(data[i]).find('statedt').text();

                    death_cnt[j] = $(data[i]).find("deathcnt").text();

                    j++;
                }

                chartDraw(state_dt, decide_cnt);
            }
        });
    });

    $("#search").on("click", function (){
       year = $("#year option:selected").val();
       month = $("#month option:selected").val();
       min_day = "";
       max_day = "";

       if (month === "01" || month === "03" || month === "05" || month === "07"
           || month === "08" || month === "10" || month === "12") {
           min_day = "01";
           max_day = "31";

           chartData(year, month, min_day, max_day);
       } else if (month === "04" || month === "06" || month === "09" || month === "11"){
           min_day = "01";
           max_day = "30";

           chartData(year, month, min_day, max_day);
       } else {
           min_day = "01";
           max_day = "28";

           chartData(year, month, min_day, max_day);
       }


    });

    function chartData(year, month, min_day, max_day){

        $.ajax({
            url: "/maps/apis",
            type : "GET",
            data : {
                year : year,
                month : month,
                min_day : min_day,
                max_day : max_day
            },
            dataType : "text",
            success : function(xml){

                let data = $(xml).find('item');
                let j = 0;

                decide_cnt.splice(0, decide_cnt.length);
                state_dt.splice(0, state_dt.length);

                for( let i = data.length - 1; i >= 0; i--) {
                    decide_cnt[j] = $(data[i]).find('decidecnt').text();

                    state_dt[j] = $(data[i]).find('statedt').text();

                    j++;
                }

                if (year==="2020" && month==="03"){
                    data_label1 = "2020년 3월 확진자 수";
                } else if (year==="2020" && month==="04"){
                    data_label1 = "2020년 4월 확진자 수";
                } else if (year==="2020" && month==="05"){
                    data_label1 = "2020년 5월 확진자 수";
                } else if (year==="2020" && month==="06"){
                    data_label1 = "2020년 6월 확진자 수";
                } else if (year==="2020" && month==="07"){
                    data_label1 = "2020년 7월 확진자 수";
                } else if (year==="2020" && month==="08"){
                    data_label1 = "2020년 8월 확진자 수";
                } else if (year==="2020" && month==="09"){
                    data_label1 = "2020년 9월 확진자 수";
                } else if (year==="2020" && month==="10"){
                    data_label1 = "2020년 10월 확진자 수";
                } else if (year==="2020" && month==="11"){
                    data_label1 = "2020년 11월 확진자 수";
                } else if (year==="2020" && month==="12"){
                    data_label1 = "2020년 12월 확진자 수";
                } else if (year==="2021" && month==="01"){
                    data_label1 = "2021년 1월 확진자 수";
                } else if (year==="2021" && month==="02"){
                    data_label1 = "2021년 2월 확진자 수";
                } else if (year==="2021" && month==="03"){
                    data_label1 = "2021년 3월 확진자 수";
                } else if (year==="2021" && month==="04"){
                    data_label1 = "2021년 4월 확진자 수";
                } else if (year==="2021" && month==="05"){
                    data_label1 = "2021년 5월 확진자 수";
                } else if (year==="2021" && month==="06"){
                    data_label1 = "2021년 6월 확진자 수";
                } else if (year==="2021" && month==="07"){
                    data_label1 = "2021년 7월 확진자 수";
                } else if (year==="2021" && month==="08"){
                    data_label1 = "2021년 8월 확진자 수";
                } else if (year==="2021" && month==="09"){
                    data_label1 = "2021년 9월 확진자 수";
                } else if (year==="2021" && month==="10"){
                    data_label1 = "2021년 10월 확진자 수";
                } else if (year==="2021" && month==="11"){
                    data_label1 = "2021년 11월 확진자 수";
                } else if (year==="2021" && month==="12"){
                    data_label1 = "2021년 12월 확진자 수";
                } else if (year==="2022" && month==="01"){
                    data_label1 = "2022년 1월 확진자 수";
                } else if (year==="2022" && month==="02"){
                    data_label1 = "2022년 2월 확진자 수";
                } else if (year==="2022" && month==="03"){
                    data_label1 = "2022년 3월 확진자 수";
                } else if (year==="2022" && month==="04") {
                    data_label1 = "2022년 4월 확진자 수";
                }

                chartDraw1(state_dt, decide_cnt, data_label1);
            }
        })
    }

    function chartDraw(state_dt, decide_cnt){

        var canvas = document.getElementById('myChart');
        var context = canvas.getContext('2d');

        context.clearRect(0, 0, canvas.width, canvas.height);
        context.beginPath();

        const myChart = new Chart(context, {
            type : 'line',
            data : {
                labels : state_dt,
                datasets : [{
                    label : '최근 코로나 확진자 수',
                    data : decide_cnt,
                    fill : false,
                    borderColor: 'rgba(141,221,232,0.7)',
                    backgroundColor: 'rgba(134,214,229,0.7)',
                    pointStyle: 'circle',
                    pointRadius: 7,
                    pointHoverRadius: 8,
                    tension : 0.1,
                    stack: 'combined'
                }]
            }
        });
    }

    function chartDraw1(state_dt, decide_cnt, data_label1){

        $("#myChart").remove();
        $("#canvas_Chart1").append('<canvas id="myChart" width="1600" height="700"></canvas>');

        var canvas = document.getElementById('myChart');
        var context = canvas.getContext('2d');

        const myChart = new Chart(context, {
            type : 'line',
            data : {
                labels : state_dt,
                datasets : [{
                    label : data_label1,
                    data : decide_cnt,
                    fill : false,
                    borderColor: 'rgba(141,221,232,0.7)',
                    backgroundColor: 'rgba(134,214,229,0.7)',
                    pointStyle: 'circle',
                    pointRadius: 7,
                    pointHoverRadius: 8,
                    tension : 0.1,
                    stack: 'combined'
                }]
            }
        });
    }
</script>

</html>
