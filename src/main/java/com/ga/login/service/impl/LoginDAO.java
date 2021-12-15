package com.ga.login.service.impl;



import javax.servlet.http.HttpSession;

import com.ga.common.LoginVO;

 
public interface LoginDAO {
    // 01_01. 회원 로그인 체크
    public boolean loginCheck(LoginVO vo);
    // 01_02. 회원 로그인 정보
    public LoginVO viewMember(LoginVO vo);
    // 02. 회원 로그아웃
    public void logout(HttpSession session);
}
