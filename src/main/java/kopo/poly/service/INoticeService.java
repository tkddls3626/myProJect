package kopo.poly.service;

import kopo.poly.dto.NoticeDTO;
import java.util.List;


public interface INoticeService {

	//게시판 리스트
	List<NoticeDTO> getNoticeList() throws Exception;

	//게시판 게시글 등록
	int InsertNoticeInfo(NoticeDTO pDTO) throws Exception;

	//게시판 상세보기
	NoticeDTO getNoticeInfo(NoticeDTO pDTO) throws Exception;

	//게시판 게시 글 수정
	void updateNoticeInfo(NoticeDTO pDTO) throws Exception;

	//게시판 글 삭제
	void deleteNoticeInfo(NoticeDTO pDTO) throws Exception;
	
}

