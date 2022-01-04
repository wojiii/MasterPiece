package project.masterpiece.pieceworks.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.masterpiece.pieceworks.member.model.dao.MemberDAO;
import project.masterpiece.pieceworks.member.model.vo.Member;

@Service("mService")
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDAO mDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertMember(Member m) {
		return mDAO.insertMember(sqlSession, m);
	}

	@Override
	public Member memberLogin(Member m) {
		return mDAO.memberLogin(sqlSession, m);
	}

	/*
	 * @Override public int duplicateEmail(String email) { return
	 * mDAO.duplicateEmail(sqlSession, email); }
	 * 
	 * @Override public Member findEmail(Member m) { return
	 * mDAO.findEmail(sqlSession, m); }
	 */

	@Override
	public int updateMember(Member m) {
		return mDAO.updateMember(sqlSession, m);
	}

	
}
