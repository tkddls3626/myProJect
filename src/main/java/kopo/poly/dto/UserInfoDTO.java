package kopo.poly.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Data
public class UserInfoDTO {
    private String user_seq; // 회원번호
    private String user_name; // 회원이름
    private String password; // 패스워드
    private String user_email; //회원 이메일
    private String age; //나이
    private String sex; // 성별
    private String manner_index; // 매너지수
    private String REG_DT; // 가입일

    //회원가입 중복 방지
    private String exists_yn;


}
