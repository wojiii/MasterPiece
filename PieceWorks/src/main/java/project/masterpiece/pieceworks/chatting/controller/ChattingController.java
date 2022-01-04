package project.masterpiece.pieceworks.chatting.controller;



import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import project.masterpiece.pieceworks.chatting.model.ChattingException;
import project.masterpiece.pieceworks.chatting.model.service.ChattingService;
import project.masterpiece.pieceworks.chatting.model.vo.ChattingMessage;


@Controller
public class ChattingController {

	@Autowired
	private ChattingService cService;
	
	
	@RequestMapping("chattest.ch")
	public String read() {
		return "chattingTest";
	}
	
	@RequestMapping("chatForm.ch")
	public String chatForm() {
		return "chattingForm";
	}

	@RequestMapping("chatList.ch")
	public String chatList() {
		return "chattingList";
	}
	
	@RequestMapping("chattingDetailForm.ch")
	public ModelAndView chattingDetailForm(@ModelAttribute ChattingMessage c,ModelAndView mv) {
	
		/*public ModelAndView chattingDetailForm(@RequestParam("chatWriter") String chatWriter,
		@RequestParam("anotherUserId") String anotherUserId,@RequestParam("chatNo") int chatNo,ModelAndView mv) {*/
	/*채팅 메세지 불러오기
	 채팅방 번호 , 본인 아이디, 클릭 한 채팅 아이디 가져오기*/
	/*
	 * HashMap<Object, Object> map = new HashMap<Object, Object>();
	 * map.put("chatWriter", chatWriter); map.put("anotherUserId", anotherUserId);
	 * map.put("chatNo", chatNo);
	 */
	
	
	ArrayList<ChattingMessage> list = new ArrayList<ChattingMessage>();
	list = cService.selectChattingMessageList(c);

	if(list != null) {
		mv.addObject("chatNo",c.getChatNo());
		mv.addObject("userId",c.getChatWriter());
		mv.addObject("list",list);
		mv.setViewName("chattingDetailForm");
	}else {
		throw new ChattingException("게시글 전체 조회에 실패하였습니다.");
	}
	return mv;
}
	
	
}
