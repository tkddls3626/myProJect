package kopo.poly.controller;

import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Slf4j
@Controller
public class WeatherController {
    @GetMapping(value = "weather")
    public String weather(HttpServletRequest request, Model model) throws ParseException, IOException {
        log.info(this.getClass().getName() + "loginStart");
        log.info(this.getClass().getName()+"날씨 데이터 파싱 시작!");

        kopo.poly.util.UrlUtil uu = new kopo.poly.util.UrlUtil();

        String url = "http://localhost:5002";
        String api = "/weatherAPI";

        String fullPath = uu.urlReadforString(url + api);

        List<String> rList= new ArrayList<>();
        // JSON JSONArray 파싱
        JSONParser parser = new JSONParser();
        JSONArray jsonArray = (JSONArray) parser.parse(fullPath);
        log.info("size : " + jsonArray.size());
        log.info("size : " + jsonArray);
        for(int i = 0; i< jsonArray.size(); i++){
            //JSONObject object = (JSONObject) jsonArray.get(i);
            log.info(jsonArray.get(i)+"");
            rList.add(String.valueOf(jsonArray.get(i)+""));

        }
        model.addAttribute("rList", rList);

        log.info(this.getClass().getName()+"날씨 데이터 파싱 완료!");
        return "weather/weather";
    }

    @GetMapping(value = "weather2")
    public String weather2(HttpServletRequest request, Model model) throws ParseException, IOException {
        log.info(this.getClass().getName() + "loginStart");
        log.info(this.getClass().getName()+"날씨 데이터 파싱 시작!");

        kopo.poly.util.UrlUtil uu = new kopo.poly.util.UrlUtil();

        String url = "http://localhost:5002";
        String api = "/weatherAPI2";

        String fullPath = uu.urlReadforString(url + api);

        List<List<String>> rList= new ArrayList<>();
        // JSON JSONArray 파싱
        JSONParser parser = new JSONParser();
        JSONArray jsonArray = (JSONArray) parser.parse(fullPath);
        log.info("size : " + jsonArray.size());
        log.info("size : " + Arrays.asList(jsonArray.get(0)));

        for(int i = 0; i< jsonArray.size(); i++){
            String jsonString = jsonArray.get(i).toString();
            jsonString = jsonString.substring(1, jsonString.length()-1);
            List<String> jList = Arrays.asList(jsonString.split(","));
            rList.add(jList);

        }
        model.addAttribute("rList", rList);

        log.info(this.getClass().getName()+"날씨 데이터 파싱 완료!");
        return "weather/weather2";
    }
}
