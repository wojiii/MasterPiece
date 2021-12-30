package project.masterpiece.pieceworks.calendar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CalendarController {

	@RequestMapping("fullCal.ca")
	public String fullCal() {
		return "fullCalendar";
	}
	
	@RequestMapping("proCal.ca")
	public String proCalView() {
		return "calendar_p";
	}
	
	@RequestMapping("calendarTest.ca")
	public String testCal() {
		return "testCal";
	}
	
}
