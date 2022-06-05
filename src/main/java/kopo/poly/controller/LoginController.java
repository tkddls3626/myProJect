package kopo.poly.controller;

import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Slf4j
@Controller
public class LoginController{
    // 로그인 사이트 들어가기
    @GetMapping(value = "login")
    public String login() {
        log.info(this.getClass().getName() + "loginStart");
        return "login/login";
    }

    @GetMapping(value = "forget_id")
    public String forget_id() {
        log.info(this.getClass().getName() + "loginStart");
        return "login/forget_id";
    }

    @GetMapping(value = "forget_passwd")
    public String forget_passwd() {
        log.info(this.getClass().getName() + "loginStart");
        return "login/forget_passwd";
    }
// ---------------------------------이미지url로  클릭시 homepage 이동 ----------------------------
    @GetMapping(value = "index")
    public String Index(Model model, HttpServletRequest request) throws Exception {
        log.info(this.getClass().getName() + "loginStart");

        /*초기 메인화면 차박여행지 3개 출력*/
        log.info(this.getClass().getName() + " 고캠핑 데이터 파싱 시작!");

        poly.util.UrlUtil uu = new poly.util.UrlUtil();

        String url = "http://localhost:5002";
        String api = "/mainPageCarAPI";

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
        model.addAttribute("rList", rList);


        return "login/index";
    }
}
