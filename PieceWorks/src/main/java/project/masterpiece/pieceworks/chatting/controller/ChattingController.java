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
	
	@RequestMapping("chattingDetailForm.ch")
	public ModelAndView chattingDetailForm(@ModelAttribute ChattingMessage c,ModelAndView mv) {
	
		ArrayList<ChattingMessage> list = new ArrayList<ChattingMessage>();
		list = cService.selectChattingMessageList(c);

		if(list != null) {
			mv.addObject("list",list);
			mv.setViewName("chattingDetailForm");
		}else {
			throw new ChattingException("게시글 전체 조회에 실패하였습니다.");
		}
		return mv;
	}
	
	
}
