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

}
