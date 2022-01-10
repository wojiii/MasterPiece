package project.masterpiece.pieceworks.calendar.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.masterpiece.pieceworks.calendar.model.dao.CalendarDAO;
import project.masterpiece.pieceworks.calendar.model.vo.Calendar;

@Service("caService")
public class CalendarServiceImpl implements CalendarService {
	
	@Autowired
	private CalendarDAO cDAO;

	@Override
	public int addEvent(Calendar c) {
		
		return cDAO.addEvent(c);
	}

	@Override
	public int addEventHour(Calendar c) {

		return cDAO.addEventHour(c);
	}

	@Override
	public ArrayList<Calendar> getEventList(Calendar c) {
		
		return cDAO.getEventList(c);
	}
	

}
