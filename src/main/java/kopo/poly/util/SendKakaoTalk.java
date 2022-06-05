package kopo.poly.util;


import lombok.extern.slf4j.Slf4j;
import org.json.simple.parser.ParseException;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.io.IOException;
/*
 * 카카오톡을 cron식을 사용하여 매일 8시에 카카오톡을 보내려고 설정함
 */
@Slf4j
@Component //싱글톤 방식으로 빈을 생성
public class SendKakaoTalk {
    // 강수량이 있다면 우산챙기라는 메세지를 보냄
    @Scheduled(cron= "20 26 21 * * *")
    public void test4() throws IOException, ParseException {

        poly.util.UrlUtil uu = new poly.util.UrlUtil();

        String url = "http://localhost:5002";
        String api = "/weatherAPI3";

        String result = uu.urlReadforString(url + api);

        log.info("result : " + result);

        if(result.equals("noData")) {
            log.info("메세지 보낸다잉!!");
            url = "http://localhost:5002";
            api = "/kakaoFriend";
            uu.urlReadforString(url + api);
        }
    }
    // 강수량이 있다면 보내지 않고 강수량이 없다면 주말한정으로 세차 하라는 메세지를 보냄
    @Scheduled(cron= "50 26 21 * * *")
    public void test5() throws IOException, ParseException {

        poly.util.UrlUtil uu = new poly.util.UrlUtil();

        String url = "http://localhost:5002";
        String api = "/weatherAPI3";

        String result = uu.urlReadforString(url + api);

        log.info("result : " + result);

        if(result.equals("noData")) {
            log.info("메세지 보낸다잉!!");
            url = "http://localhost:5002";
            api = "/kakaoFriend2";
            uu.urlReadforString(url + api);
        }
    }
    // 기온이 3O도 이상이라면 주의 알람 보내줌
    @Scheduled(cron= "20 21 21 * * *")
    public void test6() throws IOException, ParseException {

        poly.util.UrlUtil uu = new poly.util.UrlUtil();

        String url = "http://localhost:5002";
        String api = "/weatherAPI4";

        String result = uu.urlReadforString(url + api);

        log.info("result : " + result);

        if(result.equals("noData")) {
            log.info("메세지 보낸다잉!!");
            url = "http://localhost:5002";
            api = "/kakaoFriend3";
            uu.urlReadforString(url + api);
        }
    }

}
