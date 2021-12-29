package project.masterpiece.pieceworks.member.model.service;

import project.masterpiece.pieceworks.member.model.vo.Member;

public interface MemberService {

	int insertMember(Member m);

	Member memberLogin(Member m);

}
