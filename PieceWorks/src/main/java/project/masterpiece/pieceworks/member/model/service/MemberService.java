package project.masterpiece.pieceworks.member.model.service;

import java.util.HashMap;

import project.masterpiece.pieceworks.member.model.vo.Member;

public interface MemberService {

	int insertMember(Member m);

	Member memberLogin(Member m);

	/*
	 * int duplicateEmail(String email);
	 * 
	 * Member findEmail(Member m);
	 */
	int updateMember(Member m);

	int deleteMember(String email);


}
