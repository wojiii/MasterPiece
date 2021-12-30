package project.masterpiece.pieceworks.member.controller;

import javax.servlet.http.HttpServletRequest;

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
	
	@RequestMapping("login.me")
	public String loginForm() {
		return "login";
	}
	
	// 회원가입
	@RequestMapping("insert.me")
	public String insertMember(@ModelAttribute Member m) {
		
		// 비밀번호 암호화
		String encPwd = bcrypt.encode(m.getPwd());
		m.setPwd(encPwd);
		
		int result = mService.insertMember(m);
		
		System.out.println(bcrypt); // 암호화된 pwd
		
		if(result > 0) {
			return "redirect:login.me";
		} else {
			throw new MemberException("회원가입에 실패하였습니다.");
		}
	}
	
	// 로그인
	@RequestMapping(value="login.me", method=RequestMethod.POST)
	public String login(Member m, Model model) {
		
		System.out.println(bcrypt); // 암호화된 pwd
		
		System.out.println(bcrypt.encode(m.getPwd()));
		
		Member loginMember = mService.memberLogin(m); 
		
		// 암호화 했을 때 로그인 
		if(bcrypt.matches(m.getPwd(), loginMember.getPwd())) {
			model.addAttribute("loginUser", loginMember);
//			return "../../../index";
			return "redirect: common.com";
			//상단바 우측 닉네임 테스트 때문에 임의로 commonForm으로 넘어가게 수정해뒀어요
		} else {
			throw new MemberException("로그인에 실패하였습니다.");
		}
	}
	
	
}
