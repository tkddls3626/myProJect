package kopo.poly.service.impl;

import lombok.extern.slf4j.Slf4j;
import org.json.simple.parser.ParseException;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.io.IOException;
@Slf4j
@Service("KakaoSendService")
public class KakaoSendService {

        // 강수량이 있다면 우산챙기라는 메세지를 보냄
        @Scheduled(cron= "0 43 18 * * *")
        public void test4() throws IOException, ParseException {

            kopo.poly.util.UrlUtil uu = new kopo.poly.util.UrlUtil();

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
        @Scheduled(cron= "20 43 18 * * *")
        public void test5() throws IOException, ParseException {

            kopo.poly.util.UrlUtil uu = new kopo.poly.util.UrlUtil();

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
        @Scheduled(cron= "40 43 18 * * *")
        public void test6() throws IOException, ParseException {

            kopo.poly.util.UrlUtil uu = new kopo.poly.util.UrlUtil();

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

