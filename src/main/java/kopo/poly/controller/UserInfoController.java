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
            String str = user_email;
            String user_id = str.substring(0,str.indexOf("@"));


            log.info("user_seq : " + user_seq);
            log.info("user_email : " + user_email);
            log.info("user_name : " + user_name);
            log.info("password : " + password);
            log.info("age : " + age);
            log.info("sex : " + sex);
            log.info("user_id : " + user_id);

            //저장할 변수 메모리에 올리기
            pDTO = new UserInfoDTO();
            pDTO.setUser_seq(user_seq);
            pDTO.setUser_email(user_email);
            pDTO.setUser_id(user_id);
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
        String resultMsg = "";
        UserInfoDTO rDTO = new UserInfoDTO();

        //회원정보 입력화면에서 받는 정보를 저장할 변수
        UserInfoDTO pDTO = null;

        try {
            String user_email = map.get("user_email");
            String user_id = map.get("user_id");
            String password = map.get("password");

            log.info("user_email :" + user_email);
            log.info("password :" + password);
            log.info("user_id : " + user_id);

            pDTO = new UserInfoDTO();

            pDTO.setUser_email(user_email);
            pDTO.setPassword(EncryptUtil.encHashSHA256(password));
            pDTO.setUser_id(user_id);

            rDTO = userInfoService.getUserLoginCheck(pDTO);
            log.info("로그인 조회 결과는 : " + rDTO);


            if (rDTO.getUser_seq() != null ) { //로그인 성공
                String user_name = rDTO.getUser_name();
                session.setAttribute("SS_USER_EMAIL", user_email);
                session.setAttribute("SS_USER_NAME", user_name);
                session.setAttribute("SS_USER_NAME", user_name);
                resultMsg = "success";
            } else {
                resultMsg = "fail";
            }
        } catch (Exception e) {
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
        String icon = "";
        String contents = "";

        try {
            // 이메일 AES-128-CBC 암호화
            String user_name = CmmUtil.nvl(request.getParameter("user_name"));
            String age = CmmUtil.nvl(request.getParameter("age"));

            UserInfoDTO pDTO = new UserInfoDTO();

            pDTO.setUser_name(user_name);
            pDTO.setAge(age);
            log.info("user_name : " + user_name);
            log.info("age : " + age);

            UserInfoDTO rDTO = userInfoService.findUserId(pDTO);

            log.info("rDTO : " + rDTO);
            if (rDTO != null) {
                String user_email = rDTO.getUser_email();
                msg = "이메일 찾기 성공!";
                icon = "success";
                contents = "해당하는 이메일은 : " + user_email;
            } else {
                msg = "이메일 찾기 실패!";
                icon = "warning";
                contents = "이름과 나이를 확인해주세요.";
            }
            url = "/login";


        } catch (Exception e) {
            msg = "서버 오류입니다.";
            url = "/forget_id";
            log.info(e.toString());
            e.printStackTrace();
        }

        model.addAttribute("msg", msg);
        model.addAttribute("url", url);
        model.addAttribute("icon", icon);
        model.addAttribute("contents",contents);

        log.info(this.getClass().getName() + ".findPw end!");

        return "/alert";
    }
    // 유저 비밀번호 찾기 --> 새비밀번호 전송 (비밀번호를모를때)
    @PostMapping(value = "forget_passwd")
    public String findPw(HttpServletRequest request, ModelMap model) throws Exception {

        log.info(this.getClass().getName() + ".findPw start!");

        String msg = "";
        String url = "";
        String icon = "";
        String contents = "";

        try {

            String newPW = String.valueOf((int) (Math.random() * 1000000));

            // 이메일 AES-128-CBC 암호화
            String user_email = CmmUtil.nvl(request.getParameter("user_email"));
            String user_name = CmmUtil.nvl(request.getParameter("user_name"));
            // 비밀번호 해시 알고리즘 암호화
            String user_pw = EncryptUtil.encHashSHA256(newPW);

            UserInfoDTO pDTO = new UserInfoDTO();
            pDTO.setPassword(user_pw);
            pDTO.setUser_name(user_name);
            pDTO.setUser_email(user_email);
            log.info("user_email : " + user_email);
            log.info("user_name : " + user_name);
            log.info("user_pw : " + user_pw);

            int res = userInfoService.updateUserPw(pDTO);
            log.info("res : " + res);

            if (res == 1) {

                MailDTO rDTO = new MailDTO();
                rDTO.setToMail(user_email);
                log.info("email : " + user_email  );
                rDTO.setTitle("######의 새비밀번호 전송!!!");
                rDTO.setContents("새 비밀번호 : " + newPW);
                log.info("newPW : " + newPW);

                int mailRes = mailService.doSendMail(rDTO);

                if (mailRes == 1) {
                    msg = "비밀 번호 변경 성공!";
                    icon = "success";
                    contents = "새 비밀번호를 이메일로 발송했습니다. 로그인 후 변경해주세요.";
                } else {
                    msg = "비밀 번호 변경 실패!";
                    icon = "warning";
                    contents = "변경된 비밀번호 발송에 실패했습니다. ####@naver.com 으로 문의해주세요.";
                }
                url = "/login";

            } else if (res == 0) {
                msg = "정보를 다시 확인해주세요.";
                icon = "warning";
                contents = "정확한 정보를 입력해주세요!";
            }

        } catch (Exception e) {
            msg = "서버 오류입니다.";
            icon = "warning";
            contents = "서버 오류입니다 관리자에게 문의해주세요";
            log.info(e.toString());
            e.printStackTrace();
        }

        model.addAttribute("msg", msg);
        log.info(url);
        model.addAttribute("url", url);
        model.addAttribute("icon", icon);
        model.addAttribute("contents",contents);

        log.info(this.getClass().getName() + ".findPw end!");

        return "alert";
    }
    // 유저 패스워드 변경로직
    @PostMapping(value = "updateUserPw")
    public String updateUserPw(HttpServletRequest request, HttpSession session, ModelMap model) throws Exception {

        log.info(this.getClass().getName() + ".updateUserPw start");

        String msg = "";
        String url = "";

        try {

            // 이메일 AES-128-CBC 암호화
            String user_email = CmmUtil.nvl((String)request.getParameter("user_email"));
            String user_name = CmmUtil.nvl((String) request.getParameter("user_name"));
            // 비밀번호 해시 알고리즘 암호화
            String user_pw = EncryptUtil.encHashSHA256(CmmUtil.nvl(request.getParameter("user_pw")));

            log.info("user_email : " + user_email);
            log.info("user_name : " + user_name);


            UserInfoDTO pDTO = new UserInfoDTO();
            pDTO.setPassword(user_pw);
            pDTO.setUser_name(user_name);
            pDTO.setUser_email(user_email);


            int res = userInfoService.updateUserPw(pDTO);

            if (res == 1) {
                msg = "성공적으로 비밀번호를 변경했습니다. 다시 로그인 해주세요";
                url = "/index";
            } else {
                msg = "비밀번호 저장에 실패했습니다.";
                url = "/updatePwPage";
            }

        } catch (Exception e) {
            // 저장 실패 시
            msg = "서버 오류입니다.";
            url = "/updatePwPage";
            log.info(e.toString());
            e.printStackTrace();
        }

        model.addAttribute("msg", msg);
        model.addAttribute("url", url);

        log.info(this.getClass().getName() + ".updateUserPw end");

        return "/redirect";
    }

}
