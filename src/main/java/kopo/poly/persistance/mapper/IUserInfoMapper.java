package kopo.poly.persistance.mapper;

import kopo.poly.dto.FriendDTO;
import kopo.poly.dto.UserInfoDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IUserInfoMapper {
    //회원 가입하기(회원정보 등록하기)
    int insertUserInfo(UserInfoDTO pDTO)throws Exception;

    //회원 가입 전 중복 체크하기(DB조회)
    UserInfoDTO getUserExists(UserInfoDTO pDTO) throws Exception;

    //로그인을 위해 아이디와 비밀번호가 일치하는지 확인하기
    UserInfoDTO getUserLoginCheck(UserInfoDTO pDTO)throws Exception;

    //유저 아이디찾기
    UserInfoDTO findUserId(UserInfoDTO pDTO);

    // 유저 비밀번호 변경
    int updateUserPw(UserInfoDTO pDTO) throws Exception;

    //사용자 정보 업데이트
    int UpdateUserPage(UserInfoDTO pDTO);

    //사용자 정보 가져오기
    UserInfoDTO getUserInfo(UserInfoDTO pDTO);

    // 유저 정보 삭제
    int deleteUserInfo(UserInfoDTO pDTO) throws Exception;

    void addFriend (FriendDTO fDTO) throws Exception;

    List<UserInfoDTO> getFriendList(FriendDTO fDTO) throws Exception;

    void friendCheck(FriendDTO fDTO) throws Exception;

    List<UserInfoDTO> getFriendList2(FriendDTO fDTO) throws Exception;

}
