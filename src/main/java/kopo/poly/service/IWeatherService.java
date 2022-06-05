package kopo.poly.service;

import java.util.List;
import java.util.Map;

public interface IWeatherService {
    List<Map<String, Object>> getWeather(String nx, String ny) throws Exception;
}
