package com.ga.board.service.mapper;
 
import java.util.List;
 
import com.ga.board.service.BoardVO;
 
public interface BoardMapper {
 
    // 게시물 리스트 조회
    public List<BoardVO> selectBoardList(BoardVO boardVO) throws Exception;
    
    // 게시물 등록
    public void insertBoard(BoardVO boardVO) throws Exception;
    
    // 게시물 수정
    public void updateBoard(BoardVO boardVO) throws Exception;
    
    // 게시물 삭제
    public void deleteBoard(BoardVO boardVO) throws Exception;
 
    // 게시물 조회
    public BoardVO selectBoardByCode(BoardVO boardVO) throws Exception;
    
}