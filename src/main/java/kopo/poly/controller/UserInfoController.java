package kopo.poly.controller;

import kopo.poly.dto.MailDTO;
import kopo.poly.dto.UserInfoDTO;
import kopo.poly.service.IMailService;
import kopo.poly.service.IUserInfoService;
import kopo.poly.util.CmmUtil;
import kopo.poly.util.EncryptUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Map;

@Slf4j
@Controller
public class UserInfoController {
    @Resource(name = "UserInfoService")
    private IUserInfoService userInfoService;

    //메일 서비스 발송을 위한 쿼리
    @Resource(name = "MailService")
    private IMailService mailService;

    @GetMapping(value = "register")
    public String register() {
        log.info(this.getClass().getName() + "registerStart");
        return "login/register";
    }

    //_________________________________회원가입 정보 받기____________________________________
    @RequestMapping(value = "insertUserInfo")
    @ResponseBody
    public String insertUserInfo(HttpServletRequest request, HttpServletResponse response, Model model) {
        log.info(this.getClass().getName() + "insertUserInfo Start!");
        String msg = "";
        String resultMsg;

        //회원가입 입력 화면에서 받는 정보를 저장하는 함수
        UserInfoDTO pDTO = null;
        try {
            //입력받는 변수 저장
            String user_seq = CmmUtil.nvl(request.getParameter("user_seq")); //회원번호
            String user_email = CmmUtil.nvl(request.getParameter("user_email")); //이메일
            String user_name = CmmUtil.nvl(request.getParameter("user_name")); //회원이름
            String password = CmmUtil.nvl(request.getParameter("password")); //비밀번호
            String age = CmmUtil.nvl(request.getParameter("age")); //나이
            String sex = CmmUtil.nvl(request.getParameter("sex")); //성별

            log.info("user_seq" + user_seq);
            log.info("user_email" + user_email);
            log.info("user_name" + user_name);
            log.info("password" + password);
            log.info("age" + age);
            log.info("sex" + sex);

            //저장할 변수 메모리에 올리기
            pDTO = new UserInfoDTO();
            pDTO.setUser_seq(user_seq);
            pDTO.setUser_email(user_email);
            pDTO.setUser_name(user_name);
            pDTO.setUser_email(user_email);
            pDTO.setPassword(EncryptUtil.encHashSHA256(password));
            pDTO.setAge(age);
            pDTO.setSex(sex);

            //회원가입
            int res = userInfoService.insertUserInfo(pDTO);

            if (res == 1) {
                resultMsg = "success";
            } else {
                resultMsg = "fail";
            }
        } catch (Exception e) {
            //저장이 실패되면 사용자에게 보여줄 메세지
            msg = "실패하였습니다 : " + e.toString();
            log.info(e.toString());
            e.printStackTrace();
            resultMsg = "fail";
        }
        return resultMsg;
    }

    //_______________________________로그인 처리 결과 화면_______________________________________
    @GetMapping(value = "getUserLoginCheck")
    @ResponseBody
    public String getUserLoginCheck(HttpSession session, HttpServletRequest request, HttpServletResponse response, ModelMap model,
                                    @RequestParam Map<String, String> map) throws Exception {
        log.info(this.getClass().getName() + "getUsetLoginCheck Start!!");
        //로그인 성공 :1, 실패:0, 시스템에러:2
        int res = 0;
        String resultMsg = "";

        //회원정보 입력화면에서 받는 정보를 저장할 변수
        UserInfoDTO pDTO = null;

        try {
            String user_email = map.get("user_email");
            String password = map.get("password");

            log.info("user_email :" + user_email);
            log.info("password :" + password);

            pDTO = new UserInfoDTO();

            pDTO.setUser_email(user_email);
            pDTO.setPassword(EncryptUtil.encHashSHA256(password));

            res = userInfoService.getUserLoginCheck(pDTO);
            log.info("로그인 조회 결과는 : " + res);


            if (res == 1) { //로그인 성공
                session.setAttribute("SS_USER_EMAIL", user_email);
                resultMsg = "success";
            } else if (res == 0) {
                resultMsg = "fail";
            }
        } catch (Exception e) {
            res = 2;
            //저장이 실패되면 사용자에게 보여줄 메세지
            log.info(e.toString());
            e.printStackTrace();
            resultMsg = "fail";
        }
        return resultMsg;
    }
    // 유저 ID찾기 ---> 이메일 전송
    @PostMapping(value = "forget_id")
    public String findID(HttpServletRequest request, ModelMap model) throws Exception {

        log.info(this.getClass().getName() + ".findPw start!");

        String msg = "";
        String url = "";

        try {
            // 이메일 AES-128-CBC 암호화
            String user_email = EncryptUtil.encAES128CBC(CmmUtil.nvl(request.getParameter("user_email")));
            String user_name = CmmUtil.nvl(request.getParameter("user_name"));


            log.info("user_email : " + user_email);
            log.info("user_name : " + user_name);

            UserInfoDTO pDTO = new UserInfoDTO();
            pDTO.setUser_name(user_name);
            pDTO.setUser_email(user_email);

            UserInfoDTO uDTO = userInfoService.findUserId(pDTO);

            if (uDTO != null) {

                MailDTO rDTO = new MailDTO();
                rDTO.setToMail(EncryptUtil.decAES128CBC(user_email)); //이메일전송을위해 복호화
                rDTO.setTitle("#####" + user_name + "의 아이디 발송!!!");
                rDTO.setContents("아이디 전송 : " + user_email);

                int mailRes = mailService.doSendMail(rDTO);

                if (mailRes == 1) {
                    msg = "아이디를 이메일로 발송했습니다." + user_name + "님의 ID는" + user_email + "입니다.";
                    ;
                } else {
                    msg = "아이디발송에 실패했습니다. ####@naver.com 으로 문의해주세요.";
                }
                url = "/login";

            } else {
                msg = "정보를 다시 확인해주세요.";
                url = "/forget_id";
            }

        } catch (Exception e) {
            msg = "서버 오류입니다.";
            url = "/forget_id";
            log.info(e.toString());
            e.printStackTrace();
        }

        model.addAttribute("msg", msg);
        model.addAttribute("url", url);

        log.info(this.getClass().getName() + ".findPw end!");

        return "/redirect";
    }


}
