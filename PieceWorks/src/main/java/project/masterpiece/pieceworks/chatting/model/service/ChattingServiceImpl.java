package project.masterpiece.pieceworks.chatting.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



import project.masterpiece.pieceworks.chatting.model.dao.ChattingDAO;
import project.masterpiece.pieceworks.chatting.model.vo.ChattingMessage;

@Service("cService")
public class ChattingServiceImpl implements ChattingService{

	@Autowired
	private ChattingDAO cDAO;
		
	@Autowired
	private SqlSessionTemplate sqlSession;
	


	@Override
	public ArrayList<ChattingMessage> selectChattingMessageList(ChattingMessage c) {
		return cDAO.selectChattingMessageList(sqlSession,c);
	}

	@Override
	public int insertChatting(ChattingMessage chatMessage) {
		return cDAO.insertChatting(sqlSession,chatMessage);
	}
}
