package kopo.poly.dto;

import lombok.Data;

import java.util.List;
import java.util.Map;

@Data
public class WeatherDTO {
    private Map<String, Map<String, Object>> response;
    private Map<String, Object> header;
    private Map<String, Object> body;
    private Map<String, List<Map<String, Object>>> items;
    private List<Map<String, Object>> item;
}