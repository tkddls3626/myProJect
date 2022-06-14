package kopo.poly.service.impl;

import kopo.poly.dto.NoticeDTO;
import kopo.poly.persistance.mapper.INoticeMapper;
import kopo.poly.service.INoticeService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Slf4j
@Service("NoticeService")
public class NoticeService implements INoticeService {

    @Resource(name = "INoticeMapper")
    private INoticeMapper noticeMapper;

    @Autowired
    public NoticeService(INoticeMapper noticeMapper) {
        this.noticeMapper = noticeMapper;
    }

    // 게시판 리스트
    @Override
    public List<NoticeDTO> getNoticeList() throws Exception {

        log.info(this.getClass().getName() + ".getNoticeList start!");

        return noticeMapper.getNoticeList();

    }
    // 게시판 게시글 등록
    @Transactional
    @Override
    public int InsertNoticeInfo(NoticeDTO pDTO) throws Exception {

        log.info(this.getClass().getName() + ".InsertNoticeInfo start!");

        int res = noticeMapper.InsertNoticeInfo(pDTO);

        return res;
    }
    // 게시판 상세보기
    @Transactional
    @Override
    public NoticeDTO getNoticeInfo(NoticeDTO pDTO) throws Exception {

        log.info(this.getClass().getName() + ".getNoticeInfo start!");
        NoticeDTO rDTO = new NoticeDTO();
        // 상세보기 할때마다, 조회수 증가하기
        log.info("Update ReadCNT");
        noticeMapper.updateNoticeReadCnt(pDTO);

        rDTO = noticeMapper.getNoticeInfo(pDTO);

        return rDTO;

    }
    // 게시판 게시 글 수정
    @Transactional
    @Override
    public void updateNoticeInfo(NoticeDTO pDTO) throws Exception {

        log.info(this.getClass().getName() + ".updateNoticeInfo start!");

        noticeMapper.updateNoticeInfo(pDTO);

    }

    //게시판 글 삭제
    @Transactional
    @Override
    public void deleteNoticeInfo(NoticeDTO pDTO) throws Exception {

        log.info(this.getClass().getName() + ".deleteNoticeInfo start!");

        noticeMapper.deleteNoticeInfo(pDTO);

    }
}
