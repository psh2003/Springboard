package com.ga.board.service.impl;
 
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
 
import com.ga.board.service.BoardVO;
import com.ga.board.service.Criteria;
import com.ga.board.service.mapper.BoardMapper;
 
@Service("boardDAOService")
public class BoardDAOService implements BoardDAO{
    
    @Autowired
    private SqlSession sqlSession;
    

 
    public void insertBoard(BoardVO boardVO) throws Exception {
        
        sqlSession.insert("board.insertBoard", boardVO);
    }
    
    
    public void updateBoard(BoardVO boardVO) throws Exception {
        
        sqlSession.update("board.updateBoard", boardVO);
    }
 
    public void deleteBoard(BoardVO boardVO) throws Exception {
        
        sqlSession.delete("board.deleteBoard",boardVO);
    }
 
    @Override
    public BoardVO selectBoardByCode(BoardVO boardVO) throws Exception {
        
        return sqlSession.selectOne("board.selectBoardByCode",boardVO);
    }
  //BoardDAO
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectBoardList(Criteria cri) {
        return sqlSession.selectList("board.selectBoardList", cri);
    }
    public int countBoardList(){
        return sqlSession.selectOne("board.countBoardList");
    }


    
}