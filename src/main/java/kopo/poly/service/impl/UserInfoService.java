package kopo.poly.service.impl;

import kopo.poly.dto.UserInfoDTO;
import kopo.poly.persistance.mapper.IUserInfoMapper;
import kopo.poly.service.IUserInfoService;
import kopo.poly.util.CmmUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
@Slf4j
@Service("UserInfoService")
public class UserInfoService implements IUserInfoService {
    @Resource(name="IUserInfoMapper")
    private IUserInfoMapper iUserInfoMappr;

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
        UserInfoDTO rDTO = iUserInfoMappr.getUserExists(pDTO);


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
            int success = iUserInfoMappr.insertUserInfo(pDTO);

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
    public int getUserLoginCheck(UserInfoDTO pDTO)throws Exception{
        //로그인 성공: 1, 실패 : 0
        int res = 0;

        if(pDTO == null) {
            pDTO = new UserInfoDTO();
        }
        //로그인을 위해 아이디와 비밀번호가 일치하는지 확인하기 위한 mapper호출
        UserInfoDTO rDTO = iUserInfoMappr.getUserLoginCheck(pDTO);

        if(CmmUtil.nvl(rDTO.getUser_email()).length()>0) {
            res = 1;
        }
        return res;
    }
    @Override
    public UserInfoDTO findUserId(UserInfoDTO pDTO) {
        log.info(this.getClass().getName() + ".getUserLoginCheck start");

        UserInfoDTO rDTO= iUserInfoMappr.findUserId(pDTO);

        log.info(this.getClass().getName() + ".getUserLoginCheck end");

        return rDTO;
    }

}
