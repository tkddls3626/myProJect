package kopo.poly.service.impl;

import kopo.poly.dto.FriendDTO;
import kopo.poly.dto.UserInfoDTO;
import kopo.poly.persistance.mapper.IUserInfoMapper;
import kopo.poly.service.IMailService;
import kopo.poly.service.IUserInfoService;
import kopo.poly.util.CmmUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Slf4j
@Service("UserInfoService")
public class UserInfoService implements IUserInfoService {
    @Resource(name="IUserInfoMapper")
    private IUserInfoMapper iUserInfoMapper;
    @Resource(name="IMailService")
    private IMailService iMailService;

    @Override
    public int insertUserInfo(UserInfoDTO pDTO)throws Exception {
        //회원 가입 성공:1, 아이디 중복으로 인한 가입 취소:2, 기타 에러발생 : 0
        int res =0;

        //controller에서 값이 정상적으로 못넘어 오는 경우를 대비하기 위해 사용함
        if(pDTO == null) {
           log.info(this.getClass().getName() + " . pDTO is Null");
           pDTO = new UserInfoDTO();
        }
        //회원가입 중복 방지를 위해 DB에서 데이터 조회
        log.info("pDTO.getUserEmail : " +  pDTO.getUser_email());
        UserInfoDTO rDTO = iUserInfoMapper.getUserExists(pDTO);


        //Mapper에서 값이 정상적으로 넘어오지 못하는 경우를 대비하기 위해 사용
        if(rDTO == null) {
           log.info(this.getClass().getName() + " . rDTO is Null");
            rDTO = new UserInfoDTO();
        }
        //중복된 회원정보가 있는 경우, 결과를 2로 변경하고, 더이상 작업을 진행하지 않음
        if(CmmUtil.nvl(rDTO.getExists_yn()).equals("Y")) {
           log.info(this.getClass().getName() + " . rDTO.getExists_yn() is Y");
            res =2;
        }else {
            //회원가입
           log.info(this.getClass().getName() + " . else !!");
            int success = iUserInfoMapper.insertUserInfo(pDTO);

            //db에 데이터가 등록되었다면,
            if(success > 0) {
                res = 1;
            }else{
                res =0;
            }
        }
        return res;
    }
    @Override
    public UserInfoDTO getUserLoginCheck(UserInfoDTO pDTO)throws Exception{

        if(pDTO == null) {
            pDTO = new UserInfoDTO();
        }
        //로그인을 위해 아이디와 비밀번호가 일치하는지 확인하기 위한 mapper호출
        UserInfoDTO rDTO = iUserInfoMapper.getUserLoginCheck(pDTO);

        if(rDTO == null) {
            rDTO = new UserInfoDTO();
        }
        return rDTO;
    }
    //아이디 찾기
    @Override
    public UserInfoDTO findUserId(UserInfoDTO pDTO) {
        log.info(this.getClass().getName() + ".findUserId start");

        if(pDTO ==null) {
            pDTO = new UserInfoDTO();
            log.info("DTO가 널값으로 넘어옴");
        }else {
            log.info("잘 넘어감");
        }

        UserInfoDTO rDTO= iUserInfoMapper.findUserId(pDTO);

        log.info(this.getClass().getName() + ".findUserId end");

        return rDTO;
    }
    //비밀번호 변경
    @Override
    public int updateUserPw(UserInfoDTO pDTO) throws Exception {

        log.info(this.getClass().getName() + ".updateUserPw start");

        if(pDTO ==null) {
            pDTO = new UserInfoDTO();
            log.info("DTO가 널값으로 넘어옴");
        }

        int res = iUserInfoMapper.updateUserPw(pDTO);

        log.info("res : " + res);

        log.info(this.getClass().getName() + ".updateUserPw end");

        return res;
    }
    // 유저 정보 업데이트
    @Override
    public int UpdateUserPage(UserInfoDTO pDTO) {
        log.info(this.getClass().getName() + ".UpdateUserPage start");

        int res = iUserInfoMapper.UpdateUserPage(pDTO);

        log.info("res : " + res);

        log.info(this.getClass().getName() + ".UpdateUserPage end");

        return res;
    }
    @Override
    public UserInfoDTO getUserInfo(UserInfoDTO pDTO) {

        log.info(this.getClass().getName() + ".getUserInfo start");

        UserInfoDTO rDTO = iUserInfoMapper.getUserInfo(pDTO);
        if(rDTO == null) {
            log.info("rDTO 서비스에서도 널임");
        }
        log.info(this.getClass().getName() + ".getUserInfo end");

        return rDTO;
    }
    //회원탈퇴
    @Override
    public int deleteUser(UserInfoDTO pDTO) throws Exception {

        log.info(this.getClass().getName() + ".deleteUser start");

        int res = iUserInfoMapper.deleteUserInfo(pDTO);
        log.info("res 값은? : " + res);

        log.info(this.getClass().getName() + ".deleteUser end");

        return res;
    }

    @Override
    public void addFriend(FriendDTO fDTO) throws Exception {
        iUserInfoMapper.addFriend(fDTO);
    }

    @Override
    public List<UserInfoDTO> getFriendList(FriendDTO fDTO) throws Exception {
        return iUserInfoMapper.getFriendList(fDTO);
    }

    @Override
    public void friendCheck(FriendDTO fDTO) throws Exception {
        log.info(this.getClass().getName() + ".friendCheck Start !!");
        log.info(this.getClass().getName() + ".friendCheck End !!");
        iUserInfoMapper.friendCheck(fDTO);
    }

    @Override
    public List<UserInfoDTO> getFriendList2(FriendDTO fDTO) throws Exception {
        return iUserInfoMapper.getFriendList2(fDTO);
    }


}
