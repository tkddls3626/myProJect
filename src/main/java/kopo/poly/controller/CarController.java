package kopo.poly.controller;

import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Slf4j
@Controller
public class CarController {
    @GetMapping(value = "carFind")
    public String weather() {
        log.info(this.getClass().getName() + "carFindStart");
        return "car/carFind";
    }

    @GetMapping(value = "carDate")
    public String weather(HttpServletRequest request, Model model) throws ParseException, IOException {
        log.info(this.getClass().getName() + "loginStart");
        log.info(this.getClass().getName() + " 고캠핑 데이터 파싱 시작!");

        kopo.poly.util.UrlUtil uu = new kopo.poly.util.UrlUtil();

        String url = "http://localhost:5002";
        String api = "/weatherAPI";

        String fullPath = uu.urlReadforString(url + api);

        List<List<String>> rList = new ArrayList<>();
        // JSON JSONArray 파싱
        JSONParser parser = new JSONParser();
        JSONArray jsonArray = (JSONArray) parser.parse(fullPath);
        log.info("size : " + jsonArray.size());
        log.info("size : " + Arrays.asList(jsonArray.get(0)));

        for (int i = 0; i < jsonArray.size(); i++) {
            String jsonString = jsonArray.get(i).toString();
            jsonString = jsonString.substring(1, jsonString.length() - 1);
            List<String> jList = Arrays.asList(jsonString.split(","));
            rList.add(jList);

        }
        log.info("reListGet0 : " + rList.get(0).get(5));
        model.addAttribute("rList", rList);

        log.info(this.getClass().getName() + "고캠핑 데이터 파싱 완료!");
        return "car/carFind";
    }

    @GetMapping(value = "carSearchAPI")
    @ResponseBody
    public String carSearchAPI() {
        log.info(this.getClass().getName() + "123123123123");
        return "SUCCESS";
    }

    @GetMapping(value = "carInfo")
    public String carInfo(Model model, HttpServletRequest request) throws ParseException, IOException {
        log.info(this.getClass().getName() + "carInfoStart");

        log.info(this.getClass().getName() + " 고캠핑 데이터 파싱 시작!");
        String carName = request.getParameter("carName");
        kopo.poly.util.UrlUtil uu = new kopo.poly.util.UrlUtil();

        String url = "http://localhost:5002";
        String api = "/carInfo?carName=" + carName;

        System.out.println("api : " + carName);

        String fullPath = uu.urlReadforString(url + api);

        List<String> rList = new ArrayList<>();
        // JSON JSONArray 파싱
        JSONParser parser = new JSONParser();
        JSONArray jsonArray = (JSONArray) parser.parse(fullPath);
        log.info("size : " + jsonArray.size());
        log.info("size : " + jsonArray);
        for (int i = 0; i < jsonArray.size(); i++) {
            rList.add(String.valueOf(jsonArray.get(i) + ""));
        }
        model.addAttribute("rList", rList);
        return "car/carInfo";
    }

    @GetMapping(value = "carMap")
    public String carMap(Model model, HttpServletRequest request) throws ParseException, IOException {
        log.info(this.getClass().getName() + "carMapStart!!");

        log.info(this.getClass().getName() + " 카카오 Map에 좌표전송 시작!");
        String carName = request.getParameter("carName");
        kopo.poly.util.UrlUtil uu = new kopo.poly.util.UrlUtil();

        String url = "http://localhost:5002";
        String api = "/carMap?carName=" + carName;

        System.out.println("api : " + carName);

        String fullPath = uu.urlReadforString(url + api);

        List<String> mList = new ArrayList<>();
        // JSON JSONArray 파싱
        JSONParser parser = new JSONParser();
        JSONArray jsonArray = (JSONArray) parser.parse(fullPath);
        log.info("size : " + jsonArray.size());
        log.info("size : " + jsonArray);
        for (int i = 0; i < jsonArray.size(); i++) {
            mList.add(String.valueOf(jsonArray.get(i) + ""));
        }
        model.addAttribute("mList", mList);
        return "car/carMap";
    }
}
