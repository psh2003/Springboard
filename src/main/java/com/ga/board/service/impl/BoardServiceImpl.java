package com.ga.board.service.impl;
 
import java.util.List;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
 
import com.ga.board.service.BoardVO;
 
@Service("boardServiceImpl")
public class BoardServiceImpl implements BoardService{
    
    @Autowired
    private BoardDAO boardDAOService;
    
    @Override
    public List<BoardVO> selectBoardList(BoardVO boardVO) throws Exception {
        List<BoardVO> list = null;
        list = boardDAOService.selectBoardList(boardVO);
        return list;
    }
 
    @Override
    public void insertBoard(BoardVO boardVO) throws Exception {
        boardDAOService.insertBoard(boardVO);
    }
 
    @Override
    public void updateBoard(BoardVO boardVO) throws Exception {
        boardDAOService.updateBoard(boardVO);
    }
 
    @Override
    public void deleteBoard(BoardVO boardVO) throws Exception {
        boardDAOService.deleteBoard(boardVO);
    }

    @Override
    public BoardVO selectBoardByCode(BoardVO boardVO) throws Exception {
        BoardVO resultVO = boardDAOService.selectBoardByCode(boardVO);
        
        return resultVO; 
    }
 
}
 