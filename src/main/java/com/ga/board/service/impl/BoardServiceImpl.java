package com.ga.board.service.impl;
 
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
 
import com.ga.board.service.BoardVO;
import com.ga.board.service.Criteria;
 
@Service("boardServiceImpl")
public class BoardServiceImpl implements BoardService{
    
    @Autowired
    private BoardDAO boardDAOService;
    
  //BoardServiceImpl
    @Override
    public List<Map<String, Object>> selectBoardList(Criteria cri) {
        return boardDAOService.selectBoardList(cri);
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
 
  //ServiceImpl
    @Override
    public int countBoardListTotal() {
        return boardDAOService.countBoardList();
    }

	@Override
	public List<BoardVO> selectBoardList(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


    


}
 