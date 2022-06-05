package kopo.poly.service.impl;

import kopo.poly.dto.WeatherDTO;
import kopo.poly.service.IWeatherService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.net.URI;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

@Service
@Slf4j
public class WeatherService implements IWeatherService {

    @Override
    public List<Map<String, Object>> getWeather(String nx, String ny) throws Exception {
        String serviceKey =
                "M%2FsA9RkXBEsTDa1y%2FOWrItY4bYFzPJP7PAEi160VJJonNgODfZYNavr4E%2F9lsFxm9NzDLNJ4l4HcDLAPpzk%2B6g%3D%3D";
        String url = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst"; // URL
        LocalTime now = LocalTime.now();
        DateTimeFormatter formatterHour = DateTimeFormatter.ofPattern("HH");
        DateTimeFormatter formatterMin = DateTimeFormatter.ofPattern("mm");
        String stringMin = now.format(formatterMin);
        String stringHour = now.format(formatterHour);

//
//        if(Integer.parseInt(stringMin) < 10) {
//            stringHour
//        }
//        String formateNow = now.format(formatter) + "00";
//        if()

        URI requestURI = new URI(url + "?serviceKey=" + serviceKey + "&PageNo=1" + "&numOfRows=1000" + "&dataType=JSON"
                + "&base_date=20220525" + "&base_time=" + "1700" + "&nx=" + nx + "&ny=" + ny);

        // String 사용 시 자동 Encoding 되기 때문에 UTF-8로 인코딩 불가능

        WeatherDTO weatherDTO = new WeatherDTO(); // header, body, items, item 나눠서 사용하기

        RestTemplate restTemplate = new RestTemplate(); // restTemplate 간단한 header, body, url 빠르게 사용하기위해


        ResponseEntity<WeatherDTO> response = restTemplate.exchange(requestURI, HttpMethod.GET, null, WeatherDTO.class); // null 은 바디값이 없어

        WeatherDTO responseBody = response.getBody(); // Body Type = WeatherDto

        weatherDTO.setResponse(response.getBody().getResponse()); // get Response
        weatherDTO.setHeader(weatherDTO.getResponse().get("header"));
        weatherDTO.setBody(weatherDTO.getResponse().get("body"));
        weatherDTO.setItems((Map<String, List<Map<String, Object>>>) weatherDTO.getBody().get("items"));
        weatherDTO.setItem(weatherDTO.getItems().get("item"));
        System.out.println(weatherDTO.getItem());



        log.info("---------------------------------------");
        log.info(String.valueOf(weatherDTO.getItem().get(0).get("baseDate")));
        log.info("---------------------------------------");
        log.info("---------------------------------------");
        return weatherDTO.getItem();


    }
}
