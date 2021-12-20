package com.ga.board.service.impl;
 
import java.util.List;
 
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
 
import com.ga.board.service.BoardVO;
import com.ga.board.service.mapper.BoardMapper;
 
@Service("boardDAOService")
public class BoardDAOService implements BoardDAO{
    
    @Autowired
    private SqlSession sqlSession;
    
    public List<BoardVO> selectBoardList(BoardVO boardVO) throws Exception {
        BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
        return mapper.selectBoardList(boardVO);
    }
 
    public void insertBoard(BoardVO boardVO) throws Exception {
        BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
        mapper.insertBoard(boardVO);
    }
    
    
    public void updateBoard(BoardVO boardVO) throws Exception {
        BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
        mapper.updateBoard(boardVO);
    }
 
    public void deleteBoard(BoardVO boardVO) throws Exception {
        BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
        mapper.deleteBoard(boardVO);
    }
 
    @Override
    public BoardVO selectBoardByCode(BoardVO boardVO) throws Exception {
        BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
        return mapper.selectBoardByCode(boardVO);
    }
}