package kopo.poly.controller;

import kopo.poly.dto.UserInfoDTO;
import kopo.poly.service.IUserInfoService;
import kopo.poly.util.CmmUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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

        model.addAttribute("user_name");

        return "mypage/mypage";
    }
    //유저정보 변경
    @PostMapping(value = "/UpdateMyPage")
    public String UpdateMyPage(HttpServletRequest request, ModelMap model, HttpSession session) throws Exception {

        log.info(this.getClass().getName() + ".mypageEdit end");


        // 유저정보 변경 결과에 대한 메시지 전달할 변수
        String msg = "";
        String url = "";
        String icon = "";
        String contents = "";

        //회원정보 변경을 담을 변수
        UserInfoDTO pDTO = null;


        try {
            String user_email = CmmUtil.nvl((String) session.getAttribute("SS_USER_EMAIL"));
            String user_name = CmmUtil.nvl(request.getParameter("user_name")); //이름
            String age = CmmUtil.nvl(request.getParameter("age")); //주소
            String sex = CmmUtil.nvl(request.getParameter("sex")); //상세주소


            log.info(user_name);
            log.info(user_email);
            log.info(age);
            log.info(sex);


            //유저 정보를 담기위함
            pDTO = new UserInfoDTO();

            pDTO.setUser_name(user_name);
            pDTO.setUser_email(user_email); // 이메일 AES-128-CBC 암호화
            pDTO.setAge(age); //주소
            pDTO.setSex(sex); //상세주소

            int res = userInfoService.UpdateUserPage(pDTO);

            if (res == 1) {
                session.setAttribute("SS_USER_EMAIL", user_email);
                msg = "내 정보 수정 성공!";
                icon = "success";
                contents = "내정보가 수정되었습니다. 다시 로그인 해주세요!";
            } else {
                msg = "내 정보 수정 실패!";
                icon = "warning";
                contents = "내 정보 수정 실패.";
                }
             url = "/login";
            } catch (Exception e) {
                msg = "서버 오류입니다.";
                icon = "warning";
                contents = "서버 오류입니다 관리자에게 문의해주세요";
                log.info(e.toString());
                e.printStackTrace();
            }finally {
                log.info(this.getClass().getName() + "UpdateMyPage End!!");


            // 회원가입 여부 결과 메시지 전달하기
            model.addAttribute("msg", msg);
            model.addAttribute("url", url);
            model.addAttribute("icon", icon);
            model.addAttribute("contents",contents);

            pDTO = null;
        }

        return "/alert";
    }
}