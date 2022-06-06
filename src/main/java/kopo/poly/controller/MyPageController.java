package kopo.poly.controller;

import kopo.poly.service.IUserInfoService;
import kopo.poly.util.CmmUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Slf4j
@Controller
public class MyPageController {
    @Resource(name = "UserInfoService")
    private IUserInfoService userInfoService;

    // 마이페이지 들어가기
    @GetMapping(value = "/mypage")
    public String mypage(HttpSession session, ModelMap model) throws Exception {
        log.info(this.getClass().getName() + "mypage Start!");

        String user_name = CmmUtil.nvl((String) session.getAttribute("SS_USER_NAME"));
        log.info("user_name : " + user_name);

        return "mypage/mypage";
    }
}
