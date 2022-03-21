package com.ga.member.service.impl;

import java.util.List;

import com.ga.member.service.MemberVO;

public interface MemberService {

	public List<MemberVO> memberList();
    // 회원 입력
    public void insertMember(MemberVO vo);
    // 회원 정보 상세보기
    public MemberVO viewMember();
    // 회원삭제
    public void deleteMember(String userId);
    // 회원정보 수정
    public void updateMember(MemberVO vo);
	public int checkId(MemberVO vo);
}