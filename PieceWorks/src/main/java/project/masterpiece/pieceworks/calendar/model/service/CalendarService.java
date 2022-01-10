package project.masterpiece.pieceworks.calendar.model.service;

import java.sql.Date;
import java.util.ArrayList;

import project.masterpiece.pieceworks.calendar.model.vo.Calendar;

public interface CalendarService {

	int addEvent(Calendar c);

	int addEventHour(Calendar c);

	ArrayList<Calendar> getEventList(Calendar c);

}
