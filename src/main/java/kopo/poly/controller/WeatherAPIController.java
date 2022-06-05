package kopo.poly.controller;

import kopo.poly.service.impl.WeatherService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Slf4j
@RestController
public class WeatherAPIController {
    @Autowired
    private WeatherService weatherService;

    WeatherAPIController(WeatherService weatherService) {
        this.weatherService = weatherService;
    }
    //날씨api호출
    @RequestMapping("/test2")
    public List<Map<String, Object>> test2(HttpServletRequest request, Model model) throws Exception {

        String nx = request.getParameter("nx");
        String ny = request.getParameter("ny");
        List<Map<String, Object>> str = weatherService.getWeather("37", "126");
        model.addAttribute("res",str);
        return str;

    }

}
