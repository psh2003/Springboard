package com.ga.member.service.impl;
 
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
 

import com.ga.member.service.MemberVO;
 
@Service
public class MemberServiceImpl implements MemberService {
    
    // MemberDAOImpl 객체를 스프링에서 생성하여 주입시킴
    @Inject
    MemberDAOImpl memberDao;
    
    // 01. 회원 목록
    @Override
    public List<MemberVO> memberList() {
        return memberDao.memberList();
    }
    
    // 02. 회원 등록
    @Override
    public void insertMember(MemberVO vo) {
        memberDao.insertMember(vo);
    }
 
    @Override
    public MemberVO viewMember() {
        return null;
    }
 
    @Override
    public void deleteMember(String userId) {
        
    }
 
    @Override
    public void updateMember(MemberVO vo) {
        
    }
 
}