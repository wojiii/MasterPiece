package project.masterpiece.pieceworks.chatting.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import project.masterpiece.pieceworks.chatting.model.vo.ChattingList;
import project.masterpiece.pieceworks.chatting.model.vo.ChattingMessage;

public interface ChattingService {



	ArrayList<ChattingMessage> selectChattingMessageList(ChattingMessage c);

	ArrayList<ChattingList> selectChattingList(String email);

}
