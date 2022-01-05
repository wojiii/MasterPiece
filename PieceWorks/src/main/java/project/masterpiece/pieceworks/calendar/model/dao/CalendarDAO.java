package project.masterpiece.pieceworks.calendar.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.masterpiece.pieceworks.calendar.model.vo.Calendar;

@Repository
public class CalendarDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession; 

	public int addEvent(Calendar c) {
		
		return sqlSession.insert("calendarMapper.addEvent", c);
	}

	public int addEventHour(Calendar c) {
		
		return sqlSession.insert("calendarMapper.addEventHour", c);
	}

	public ArrayList<Calendar> getEventList(Calendar c) {
		
		return (ArrayList)sqlSession.selectList("calendarMapper.getEventList", c);
	}

}
