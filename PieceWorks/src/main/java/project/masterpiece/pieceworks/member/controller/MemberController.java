package project.masterpiece.pieceworks.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import project.masterpiece.pieceworks.member.model.exception.MemberException;
import project.masterpiece.pieceworks.member.model.service.MemberService;
import project.masterpiece.pieceworks.member.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class MemberController {

	@Autowired
	private MemberService mService;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	// 회원가입 페이지 이동
	@RequestMapping("signUpView.me")
	public String signUpView() {
		return "memberJoin";
	}
	
	// 회원가입
	@RequestMapping("insert.me")
	public String insertMember(@ModelAttribute Member m) {
		
		// 비밀번호 암호화
		String encPwd = bcrypt.encode(m.getPwd());
		m.setPwd(encPwd);
		
		int result = mService.insertMember(m);
		
		if(result > 0) {
			return "../../../index";
		} else {
			throw new MemberException("회원가입에 실패하였습니다.");
		}
	}
	
	// 로그인
	@RequestMapping(value="login.me", method=RequestMethod.POST)
	public String login(Member m, Model model) {
		
		String encPwd = bcrypt.encode(m.getPwd());
		m.setPwd(encPwd);
		System.out.println(encPwd);
		
		System.out.println(bcrypt.encode(m.getPwd()));
		
		Member loginMember = mService.memberLogin(m); 
		return null;
		
	}
	
}
