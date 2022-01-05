package project.masterpiece.pieceworks.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import project.masterpiece.pieceworks.member.model.vo.Member;

@Repository("mDAO")
public class MemberDAO {

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public Member memberLogin(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.memberLogin", m);
	}

	/*
	 * public int duplicateEmail(SqlSessionTemplate sqlSession, String email) {
	 * return sqlSession.selectOne("memberMapper.duplicateEmail", email); }
	 * 
	 * public Member findEmail(SqlSessionTemplate sqlSession, Member m) { return
	 * sqlSession.selectOne("memberMapper.findEmail", m); }
	 */

	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateMember", m);
	}

	public int deleteMember(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.update("memberMapper.deleteMember", email);
	}

}
