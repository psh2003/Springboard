package com.ga.board.service.impl;
 
import java.util.List;
import java.util.Map;

import com.ga.board.service.BoardVO;
import com.ga.board.service.Criteria;
 
public interface BoardDAO {
 
    /**
     * 게시물 리스트 조회
     * @param boardVO
     * @return
     * @throws Exception   
     */
	
 
    /**
     * 게시물 등록
     * @param boardVO
     * @throws Exception
     */
    void insertBoard(BoardVO boardVO) throws Exception;
 
    /**
     * 게시물 수정
     * @param boardVO
     * @throws Exception
     */
    void updateBoard(BoardVO boardVO) throws Exception;
 
    /**
     * 게시물 삭제
     * @param boardVO
     * @throws Exception
     */
    void deleteBoard(BoardVO boardVO) throws Exception;
 
    /**
     * 게시물 조회
     * @param boardVO
     * @return
     * @throws Exception
     */
    BoardVO selectBoardByCode(BoardVO boardVO) throws Exception;

	int countBoardList();

	List<Map<String, Object>> selectBoardList(Criteria cri);
 
  


    
}