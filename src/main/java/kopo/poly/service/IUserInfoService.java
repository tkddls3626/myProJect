package kopo.poly.service;

import kopo.poly.dto.FriendDTO;
import kopo.poly.dto.UserInfoDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IUserInfoService {
    //회원 가입 하기(회원 정보 등록하기)
    int insertUserInfo(UserInfoDTO pDTO)throws Exception;

    //로그인을 위해 아이디와 비밀번호가 일치하는지 확인하기
    UserInfoDTO getUserLoginCheck(UserInfoDTO pDTO)throws Exception;

    //유저 아이디찾기
    UserInfoDTO findUserId(UserInfoDTO pDTO);

    // 유저 비밀번호 변경
    int updateUserPw(UserInfoDTO pDTO) throws Exception;

    //사용자 정보 업데이트
    int UpdateUserPage(UserInfoDTO pDTO);

    // 유저 정보 가져오기
    UserInfoDTO getUserInfo(UserInfoDTO pDTO);

    // 유저 삭제
    int deleteUser(UserInfoDTO pDTO) throws Exception;

    //친구 신청
    void addFriend (FriendDTO fDTO) throws Exception;

    List<UserInfoDTO> getFriendList(FriendDTO fDTO) throws Exception;

    void friendCheck(FriendDTO fDTO) throws Exception;

    List<UserInfoDTO> getFriendList2(FriendDTO fDTO) throws Exception;
}
