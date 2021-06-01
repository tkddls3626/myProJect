package kopo.poly.controller;

import kopo.poly.dto.BoardDTO;
import kopo.poly.service.IBoardService;
import kopo.poly.util.CmmUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;


/*
 * Controller 선언해야만 Spring 프레임워크에서 Controller인지 인식 가능
 * 자바 서블릿 역할 수행
 * 
 * slf4j는 스프링 프레임워크에서 로그 처리하는 인터페이스 기술이며,
 * 로그처리 기술인 log4j와 logback과 인터페이스 역할 수행함
 * 스프링 프레임워크는 기본으로 logback을 채택해서 로그 처리함
 * */
@Slf4j
@Controller
public class BoardController {

    @Resource(name = "BoardService")
    private IBoardService boardService;

    /**
     * 게시판 리스트 보여주기
     */
    @GetMapping(value = "board/BoardList")
    public String BoardList(ModelMap model) throws Exception {

        // 로그 찍기(추후 찍은 로그를 통해 이 함수에 접근했는지 파악하기 용이하다.)
        log.info(this.getClass().getName() + ".BoardList start!");

        // 공지사항 리스트 가져오기
        List<BoardDTO> rList = boardService.getBoardList();
        log.info("가져온 공지사항 리스트 값 : " + rList.size() );

        if (rList == null) {
            rList = new ArrayList<BoardDTO>();

        }

        // 조회된 리스트 결과값 넣어주기
        model.addAttribute("rList", rList);

        // 로그 찍기(추후 찍은 로그를 통해 이 함수 호출이 끝났는지 파악하기 용이하다.)
        log.info(this.getClass().getName() + ".BoardList end!");


        return "/board/BoardList";

    }

   // 게시글 작성
    @GetMapping(value = "board/BoardReg")
    public String BoardReg() {

        log.info(this.getClass().getName() + ".BoardReg start!");

        log.info(this.getClass().getName() + ".BoardReg end!");

        return "/board/BoardReg";
    }

    /**
     * 게시판 글 등록
     */
    @GetMapping(value = "board/BoardInsert")
    public String BoardInsert(HttpSession session, HttpServletRequest request, ModelMap model) {

        log.info(this.getClass().getName() + ".BoardInsert start!");

        String msg = "";
        String url = "";
        String icon = "";
        String contents = "";

        try {
            /*
             * 게시판 글 등록되기 위해 사용되는 form객체의 하위 input 객체 등을 받아오기 위해 사용함
             */
            String user_id = CmmUtil.nvl((String) session.getAttribute("SS_USER_ID"));
            String reg_id = CmmUtil.nvl(request.getParameter("reg_id"));
            String title = CmmUtil.nvl(request.getParameter("title")); // 제목
            String board_yn = CmmUtil.nvl(request.getParameter("board_yn")); // 공지글 여부
            String board_contents = CmmUtil.nvl(request.getParameter("board_contents")); // 내용

            /*
             * ####################################################################################
             * 반드시, 값을 받았으면, 꼭 로그를 찍어서 값이 제대로 들어오는지 파악해야함 반드시 작성할 것
             * ####################################################################################
             */
            log.info("user_id : " + user_id);
            log.info("reg_id : " + reg_id);
            log.info("title : " + title);
            log.info("board_yn : " + board_yn);
            log.info("contents : " + board_contents);


            BoardDTO pDTO = new BoardDTO();

            if(reg_id.equals("admin")){

                log.info("admin_yn 값이 : 1");
                pDTO.setAdmin_yn("1");
            }else{
                log.info("admin_yn 값이 : 0");
                pDTO.setAdmin_yn("0");
            }

            pDTO.setUser_id(user_id);
            pDTO.setTitle(title);
            pDTO.setBoard_yn(board_yn);
            pDTO.setBoard_contents(board_contents);
            pDTO.setReg_id(reg_id);


//            /*
//             * 게시글 등록하기위한 비즈니스 로직을 호출
//             */
            int res = boardService.InsertBoardInfo(pDTO);
            log.info("reg_id : " + reg_id);

            // 저장이 완료되면 사용자에게 보여줄 메시지
            if(res == 1) {
                msg = "저장되었습니다..";
                icon = "success";
                contents = "공지사항으로 이동";
            } else {
                msg = "저장에 실패하였습니다...";
                icon = "fail";
                contents = "공지사항으로 이동";
            }
            url = "/board/BoardList";
        } catch (Exception e) {
            // 저장이 실패되면 사용자에게 보여줄 메시지
            msg = "실패하였습니다. : " + e.getMessage();
            log.info(e.toString());
            e.printStackTrace();

        } finally {
            log.info(this.getClass().getName() + ".BoardInsert end!");
            // 결과 메시지 전달하기
            model.addAttribute("msg", msg);
            model.addAttribute("url", url);
            model.addAttribute("icon", icon);
            model.addAttribute("contents", contents);
        }

        return "/alert";
    }

    /**
     * 게시판 상세보기
     */
    /**
     * 게시판 상세보기
     */
    @GetMapping(value = "board/BoardInfo")
    public String BoardInfo(HttpSession session,HttpServletRequest request, HttpServletResponse response, ModelMap model)
            throws Exception {

        log.info(this.getClass().getName() + ".BoardInfo start!");

        /*
         * 게시판 글 등록되기 위해 사용되는 form객체의 하위 input 객체 등을 받아오기 위해 사용함
         */

        String nSeq = CmmUtil.nvl(request.getParameter("nSeq")); // 공지글번호(PK)

        /*
         * ####################################################### 반드시, 값을 받았으면, 꼭 로그를
         * 찍어서 값이 제대로 들어오는지 파악해야함 반드시 작성할 것
         * #######################################################
         */
        log.info("nSeq : " + nSeq);

        /*
         * 값 전달은 반드시 DTO 객체를 이용해서 처리함 전달 받은 값을 DTO 객체에 넣는다.
         */
        List<BoardDTO> rList = boardService.getBoardList();
        BoardDTO pDTO = new BoardDTO();

        pDTO.setBoard_seq(nSeq);

        log.info("read_cnt update success!!!");

        // 공지사항 상세정보 가져오기
        BoardDTO rDTO = boardService.getBoardInfo(pDTO);
        session.setAttribute("reg_id", rDTO.getReg_id());


        if (rDTO == null) {
            log.info("rDTO가 널임");
            rDTO = new BoardDTO();

        }
        log.info("reg_id : " + rDTO.getReg_id());

        log.info("getBoardInfo success!!!");

        // 조회된 리스트 결과값 넣어주기
        model.addAttribute("rDTO", rDTO);
        model.addAttribute("reg_id",rDTO.getReg_id());
        model.addAttribute("rList", rList);


        // 변수 초기화(메모리 효율화 시키기 위해 사용함)
        rDTO = null;
        pDTO = null;

        log.info(this.getClass().getName() + ".BoardInfo end!");

        return "board/BoardInfo";
    }

    /**
     * 게시판 수정 보기
     */
    @GetMapping(value = "board/BoardEditInfo")
    public String BoardEditInfo(HttpServletRequest request, ModelMap model) {

        log.info(this.getClass().getName() + ".BoardEditInfo start!");

        String msg = "";

        try {

            String nSeq = CmmUtil.nvl(request.getParameter("nSeq")); // 공지글번호(PK)

            log.info("nSeq : " + nSeq);

            BoardDTO pDTO = new BoardDTO();

            pDTO.setBoard_seq(nSeq);

            /*
             * ####################################################### 공지사항 수정정보 가져오기(상세보기
             * 쿼리와 동일하여, 같은 서비스 쿼리 사용함)
             * #######################################################
             */
            BoardDTO rDTO = boardService.getBoardInfo(pDTO);

            if (rDTO == null) {
                rDTO = new BoardDTO();

            }

            // 조회된 리스트 결과값 넣어주기
            model.addAttribute("rDTO", rDTO);

        } catch (Exception e) {
            msg = "실패하였습니다. : " + e.getMessage();
            log.info(e.toString());
            e.printStackTrace();

        } finally {
            log.info(this.getClass().getName() + ".BoardUpdate end!");

            // 결과 메시지 전달하기
            model.addAttribute("msg", msg);

        }

        log.info(this.getClass().getName() + ".BoardEditInfo end!");

        return "/board/BoardEditlnfo";
    }

    /**
     * 게시판 글 수정
     */
    @PostMapping(value = "board/BoardUpdate")
    public String BoardUpdate(HttpSession session, HttpServletRequest request, ModelMap model) {

        log.info(this.getClass().getName() + ".BoardUpdate start!");

        String msg = "";
        String icon = "";
        String contents = "";
        String url = "";

        try {

            String nSeq = CmmUtil.nvl(request.getParameter("nSeq")); // 글번호(PK)
            String title = CmmUtil.nvl(request.getParameter("title")); // 제목
            String boardYn = CmmUtil.nvl(request.getParameter("boardYn")); // 공지글 여부
            String board_contents = CmmUtil.nvl(request.getParameter("board_contents")); // 내용
            String chg_id = CmmUtil.nvl( request.getParameter("chg_id")); // 아이디

            log.info("chg_id : " + chg_id);
            log.info("nSeq : " + nSeq);
            log.info("title : " + title);
            log.info("boardYn : " + boardYn);
            log.info("contents : " + board_contents);

            BoardDTO pDTO = new BoardDTO();

            pDTO.setChg_id(chg_id);
            pDTO.setBoard_seq(nSeq);
            pDTO.setTitle(title);
            pDTO.setBoard_yn(boardYn);
            pDTO.setBoard_contents(board_contents);

            // 게시글 수정하기 DB
            boardService.updateBoardInfo(pDTO);
            if (pDTO != null) {
                msg = "수정되었습니다.";
                icon = "success";
                contents = "게시판으로 이동";
                url = "/board/BoardList";
            }
        } catch (Exception e) {
            msg = "수정 실패 하였습니다.";
            icon = "fail";
            contents = "게시판으로 이동";
            log.info(e.toString());
            e.printStackTrace();

        } finally {
            log.info(this.getClass().getName() + ".BoardUpdate end!");

            // 결과 메시지 전달하기
            model.addAttribute("msg", msg);
            log.info(url);
            model.addAttribute("url", url);
            model.addAttribute("icon", icon);
            model.addAttribute("contents",contents);
        }

        return "/alert";
    }

    /**
     * 게시판 글 삭제
     */
    @GetMapping(value = "board/BoardDelete")
    public String BoardeDelete(HttpServletRequest request, ModelMap model) {

        log.info(this.getClass().getName() + ".BoardDelete start!");

        String msg = "";
        String url = "";
        String icon = "";
        String contents = "";

        try {

            String nSeq = CmmUtil.nvl(request.getParameter("nSeq")); // 글번호(PK)

            log.info("nSeq : " + nSeq);

            BoardDTO pDTO = new BoardDTO();

            pDTO.setBoard_seq(nSeq);

            if(nSeq != null) {
                // 게시글 삭제하기 DB
                boardService.deleteBoardInfo(pDTO);

                msg = "삭제되었습니다.";
                icon = "success";
                contents = "게시판으로 이동";
                url = url = "/board/BoardList";
            }
        } catch (Exception e) {
            msg = "실패하였습니다. : " + e.getMessage();
            icon = "fail";
            contents = "삭제되지 않았습니다.";
            log.info(e.toString());
            e.printStackTrace();

        } finally {
            log.info(this.getClass().getName() + ".BoardDelete end!");

            // 결과 메시지 전달하기
            model.addAttribute("msg", msg);
            model.addAttribute("icon", icon);
            model.addAttribute("contents", contents);
            model.addAttribute("url", url);

        }

        return "/alert";
    }

}
