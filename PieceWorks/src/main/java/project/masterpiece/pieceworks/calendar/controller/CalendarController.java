package project.masterpiece.pieceworks.calendar.controller;


import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;

import project.masterpiece.pieceworks.calendar.model.service.CalendarService;
import project.masterpiece.pieceworks.calendar.model.vo.Calendar;
import project.masterpiece.pieceworks.member.model.vo.Member;

@Controller
public class CalendarController {
	
	@Autowired
	private CalendarService caService;

	@RequestMapping("fullCal.ca")
	public String fullCalView() {
		return "fullCalendar";
	}
	
	@RequestMapping("proCal.ca")
	public String proCalView() {
		return "calendar_p";
	}
	
	@RequestMapping(value="addEvent.ca", produces="application/json; charset=UTF-8")
	@ResponseBody
	public int addEvent(@RequestParam("eventData") String eventData, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		JSONParser parser = new JSONParser();
		JSONObject jObj = (JSONObject)parser.parse(eventData);
		String title = (String)jObj.get("title");
		String start = (String)jObj.get("start");
		String end = (String)jObj.get("end");
		String description = (String)jObj.get("description");
		String type = (String)jObj.get("type");
		String bgColor = (String)jObj.get("backgroundColor");
		Boolean allDayCheck = (Boolean)jObj.get("allDay");
		String allDay = "";
		
		Calendar c = new Calendar();
		c.setcCreator(loginUser.getEmail());
		c.setCalTitle(title);
		c.setcStartDate(start);
		c.setcEndDate(end);
		c.setCategory(type);
		c.setCalContent(description);
		c.setBgColor(bgColor);

		
		if(allDayCheck == true) {
			allDay = "Y";
		} else {
			allDay = "N";
		}
		
		c.setAllDay(allDay);
		
		System.out.println(c);
		
		return caService.addEvent(c);
	}
	
	@RequestMapping("eventList.ca")
	public void getEventList(@RequestParam("startDate") String startDate,
							   @RequestParam("endDate") String endDate,
							   HttpServletResponse response) {
		
		Calendar c = new Calendar();
		
		c.setcStartDate(startDate);
		c.setcEndDate(endDate);
		
		System.out.println(startDate);
		System.out.println(endDate);
		
		ArrayList<Calendar> list = caService.getEventList(c);
		
		response.setContentType("application/json; charset=UTF-8");
		
		Gson gson = new Gson();
		try {
			gson.toJson(list, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
}
