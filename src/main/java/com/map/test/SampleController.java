package com.map.test;

import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

@Controller
@Log4j
public class SampleController {

    @RequestMapping("/")
    public ModelAndView index() {
        log.info("index controller start!!");

        ModelAndView mav = new ModelAndView();
        mav.addObject("title", "SpringTest");
        mav.addObject("content", "Hello World!");
        mav.setViewName("index");

        return mav;
    }

    @RequestMapping ("/maps/map")
    public String map() {
        return "maps/map";
    }

    @RequestMapping(value = "/maps/mapss", method = RequestMethod.GET, produces = "application/text; charset=utf8")
    @ResponseBody
    public String mapinfo() throws Exception {

        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1741000/TsunamiShelter3/getTsunamiShelter1List");

        urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8") + "=cCe0O4QbmO2jUczHa0UUCsTY6y5SFAITKoWay4sLzMN6IP%2FPb8qcJFbLW5Z4Zp2GAnhiyrgRMAg6afTBn7xJhQ%3D%3D");
        urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1","UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("20", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("type","UTF-8") + "=" + URLEncoder.encode("xml", "UTF-8"));

        URL url = new URL(urlBuilder.toString());

        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/xml;charset=UTF-8");

        BufferedReader rd;

        if (conn.getResponseCode() >= 200 && conn.getResponseCode() <=300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        }else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }

        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }

        rd.close();
        conn.disconnect();

        System.out.println("넘어는 왔니???");
        System.out.println(sb.toString());

        return sb.toString();
    }

    @RequestMapping ("/maps/map1")
    public String map1() {
        return "maps/map1";
    }

    @RequestMapping(value = "/maps/apii", method = RequestMethod.GET, produces = "application/text; charset=utf8")
    @ResponseBody
    public String api1() throws Exception{

        StringBuilder urlBuilder = new StringBuilder("http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19InfStateJson");
        urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=cCe0O4QbmO2jUczHa0UUCsTY6y5SFAITKoWay4sLzMN6IP%2FPb8qcJFbLW5Z4Zp2GAnhiyrgRMAg6afTBn7xJhQ%3D%3D");
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("31", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("startCreateDt","UTF-8") + "=" + URLEncoder.encode("20220301", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("endCreateDt","UTF-8") + "=" + URLEncoder.encode("20220331","UTF-8"));

        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/xml;charset=UTF-8");
        System.out.println("Response code: " + conn.getResponseCode());

        BufferedReader rd;

        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }

        StringBuilder sb = new StringBuilder();

        String line;

        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }

        rd.close();
        conn.disconnect();
        System.out.println("넘어는 왔니???");
        System.out.println(sb.toString());

        return sb.toString();
    }

    @RequestMapping(value = "/maps/apis", method = RequestMethod.GET, produces = "application/text; charset=utf8")
    @ResponseBody
    public String apis(String year, String month, String min_day, String max_day) throws Exception{

        String startCreateDt = year+month+min_day;
        String endCreateDt = year+month+max_day;

        StringBuilder urlBuilder = new StringBuilder("http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19InfStateJson");
        urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=cCe0O4QbmO2jUczHa0UUCsTY6y5SFAITKoWay4sLzMN6IP%2FPb8qcJFbLW5Z4Zp2GAnhiyrgRMAg6afTBn7xJhQ%3D%3D");
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("31", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("startCreateDt","UTF-8") + "=" + URLEncoder.encode(startCreateDt, "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("endCreateDt","UTF-8") + "=" + URLEncoder.encode(endCreateDt,"UTF-8"));

        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/xml;charset=UTF-8");
        System.out.println("Response code: " + conn.getResponseCode());

        BufferedReader rd;

        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }

        StringBuilder sb = new StringBuilder();

        String line;

        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }

        rd.close();
        conn.disconnect();
        System.out.println("넘어는 왔니???");
        System.out.println(sb.toString());

        return sb.toString();
    }

    @RequestMapping ("/maps/map2")
    public String map2() {
        return "maps/map2";
    }

    @RequestMapping(value = "/maps/elApi", method = RequestMethod.GET, produces = "application/text; charset=utf8")
    @ResponseBody
    public String elApi() throws Exception{

        String urlBuilder = "https://openapi.gg.go.kr/ElectricityCarCharging" + "?" + URLEncoder.encode("key", "UTF-8") + "=e53ba55278bb4a2cab04ee2681cc5392" +
                "&" + URLEncoder.encode("type", "UTF-8") + "=" + URLEncoder.encode("xml", "UTF-8") +
                "&" + URLEncoder.encode("pindex", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8") +
                "&" + URLEncoder.encode("pSize", "UTF-8") + "=" + URLEncoder.encode("200", "UTF-8");
        URL url = new URL(urlBuilder);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/xml;charset=UTF-8");
        System.out.println("Response code: " + conn.getResponseCode());

        BufferedReader rd;

        if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }

        StringBuilder sb = new StringBuilder();
        String line;

        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }

        rd.close();
        conn.disconnect();

        System.out.println("넘어는 왔니???");
        System.out.println(sb.toString());

        return sb.toString();
    }

    @RequestMapping ("/maps/map3")
    public String map3() {
        return "maps/map3";
    }

    @RequestMapping ("/maps/map4")
    public String map4() {
        return "maps/map4";
    }

    @RequestMapping(value = "/maps/public", method = RequestMethod.GET, produces = "application/text; charset=utf8")
    @ResponseBody
    public String pub() throws Exception {
        String urlBuilder = "http://api.odcloud.kr/api/15003685/v1/uddi:49cd7610-c5d7-41f7-b9ca-fb3c12591bae" +
                "?" + URLEncoder.encode("page", "UTF-8") + URLEncoder.encode("1", "UTF-8") +
                "&" + URLEncoder.encode("perPage", "UTF-8") + "=" + URLEncoder.encode("10", "UTF-8") +
                "&" + URLEncoder.encode("returnType", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8") +
                "&" + URLEncoder.encode("serviceKey", "UTF-8") + "=cCe0O4QbmO2jUczHa0UUCsTY6y5SFAITKoWay4sLzMN6IP%2FPb8qcJFbLW5Z4Zp2GAnhiyrgRMAg6afTBn7xJhQ%3D%3D";

        URL url = new URL(urlBuilder);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/xml;charset=UTF-8");
        System.out.println("Response code: " + conn.getResponseCode());

        BufferedReader rd;

        if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }

        StringBuilder sb = new StringBuilder();
        String line;

        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }

        rd.close();
        conn.disconnect();

        System.out.println("넘어는 왔니???");
        System.out.println(sb.toString());

        return sb.toString();
    }
}
