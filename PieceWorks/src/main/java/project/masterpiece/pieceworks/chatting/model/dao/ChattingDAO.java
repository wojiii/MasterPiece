package project.masterpiece.pieceworks.chatting.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import project.masterpiece.pieceworks.chatting.model.vo.ChattingMessage;

@Repository("cDAO")
public class ChattingDAO {

	

	public ArrayList<ChattingMessage> selectChattingMessageList(SqlSessionTemplate sqlSession,
			ChattingMessage c) {
		
				
		return (ArrayList)sqlSession.selectList("chattingMapper.selectChattingMessageList",c);
	}

	public int insertChatting(SqlSessionTemplate sqlSession, ChattingMessage chatMessage) {
		return sqlSession.insert("chattingMapper.insertChatting",chatMessage);
	}

}
