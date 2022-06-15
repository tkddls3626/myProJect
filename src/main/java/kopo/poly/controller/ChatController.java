package kopo.poly.controller;

import kopo.poly.dto.ChatDTO;
import kopo.poly.service.IChatService;
import kopo.poly.util.CmmUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

@Controller
@Slf4j
public class ChatController {

    @Resource(name = "ChatService")
    private IChatService chatService;


    @GetMapping(value = "/chat")
    public ModelAndView getChatViewPage(ModelAndView mv) {
        mv.setViewName("/chat/chat");

//        mv.setViewName("chat/chat");
//        mv.addObject("user", uid);
//        mv.addObject("articleId", "12345");
//        mv.addObject("articleOwner", "jin");
//        session.setAttribute("user", uid);

        return mv;
    }

    //채팅 메세지 아작스로 저장하기
    @PostMapping(value = "chat/msg")
    @ResponseBody
    public String msg (HttpServletRequest request, HttpServletResponse response,@RequestBody Map<String,String>param)throws Exception{
        log.info(this.getClass().getName()+"chatController Start!");

        String name = param.get("name");
        String msg = param.get("msg");
        String date = param.get("date");
        String roomKey = param.get("roomKey");


        log.info(this.getClass().getName()+"name"+name);  //보내는 사람이름
        log.info(this.getClass().getName()+"msg"+msg); //보내는 메시지
        log.info(this.getClass().getName()+"date"+date); //보내는 날짜
        log.info(this.getClass().getName()+"roomKey"+roomKey); //채팅방 룸키

//        System.out.println(param.get("name")); //json 이름이 오는지
//        System.out.println(param.get("msg")); //메세지가 출력되는지
//        System.out.println(param.get("date")); //날짜가 출력되는지
        List<ChatDTO> rList =null;

        if(msg.length()>0){
            ChatDTO pDTO = new ChatDTO();
            pDTO.setMsg(msg);
            pDTO.setDateTime(date);
            pDTO.setRoomKey(roomKey); //수정해야하는 부분
            pDTO.setUser_name(name);

           chatService.insertChat(pDTO); //저장

            pDTO = null;

        }

        log.info(this.getClass().getName() + ".msg End!");

        return "ok";
    }

    @GetMapping(value = "/chatingroom")
    public String chattroom(ModelMap model,HttpServletRequest request)throws Exception{
        log.info(this.getClass().getName() + ".getMsg Start!");

        String other = CmmUtil.nvl(request.getParameter("name")); //상대방이름
        String seq = CmmUtil.nvl(request.getParameter("seq")); //상대방이름
        //String room_name = CmmUtil.nvl("Chat_chatroom"); //수정해야하는 부분 채팅방이름으로 가져오기

        //log.info("room_name : " + room_name);
        log.info("other : " + other);

        ChatDTO pDTO = new ChatDTO();

        pDTO.setRoomKey("Chat_"+seq); //채팅방이름
        pDTO.setUser_other(other); //상대방이름



        List<ChatDTO> rList = chatService.getChat(pDTO); //채팅방기록가져오기

        if (rList == null) {
            rList = new LinkedList<>();

        }



        // 조회된 리스트 결과값 넣어주기
        model.addAttribute("pDTO",pDTO);  //채팅방에 보내기
        model.addAttribute("rList", rList);
        log.info("rList 채팅방 목록 가져오기"+rList);
        log.info(this.getClass().getName() + ".getMsg End!");
        log.info("start chattingroom");
        return"/chat/chatroom";
    }
    @GetMapping(value = "/chat/noticeChat")
    public String chatroom(HttpServletRequest request, ModelMap model) throws Exception{
        log.info(this.getClass().getName() + " .chatroom controller start !!");
        String other = CmmUtil.nvl(request.getParameter("reg_id")); //상대방이름 = 게시판 등록 아이디
        String seq = CmmUtil.nvl(request.getParameter("notice_seq")); //방번호 = 게시판 SEQ

        log.info("other : " + other);
        log.info("seq : " + seq);

        ChatDTO pDTO = new ChatDTO();
        pDTO.setRoomKey("Chat_"+seq); //채팅방이름
        pDTO.setUser_other(other); //상대방이름

        List<ChatDTO> rList = chatService.getChat(pDTO); //채팅방기록가져오기

        if (rList == null) {
            rList = new LinkedList<>();

        }

        // 조회된 리스트 결과값 넣어주기
        model.addAttribute("pDTO",pDTO);  //채팅방에 보내기
        model.addAttribute("rList", rList);

        log.info(this.getClass().getName() + " .chatroom controller end !!");
        return "/chat/chatroom";
    }
}
