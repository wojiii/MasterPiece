package project.masterpiece.pieceworks.calendar.model.vo;

import java.sql.Date;

public class Calendar {
	private int calendarNo;
	private Date cStartDate;
	private Date cEndDate;
	private Date modifyDate;
	private String calStatus;
	private String calContent;
	private String projectNo;
	
	public Calendar() {}

	public Calendar(int calendarNo, Date cStartDate, Date cEndDate, Date modifyDate, String calStatus,
			String calContent, String projectNo) {
		super();
		this.calendarNo = calendarNo;
		this.cStartDate = cStartDate;
		this.cEndDate = cEndDate;
		this.modifyDate = modifyDate;
		this.calStatus = calStatus;
		this.calContent = calContent;
		this.projectNo = projectNo;
	}

	public int getCalendarNo() {
		return calendarNo;
	}

	public void setCalendarNo(int calendarNo) {
		this.calendarNo = calendarNo;
	}

	public Date getcStartDate() {
		return cStartDate;
	}

	public void setcStartDate(Date cStartDate) {
		this.cStartDate = cStartDate;
	}

	public Date getcEndDate() {
		return cEndDate;
	}

	public void setcEndDate(Date cEndDate) {
		this.cEndDate = cEndDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getCalStatus() {
		return calStatus;
	}

	public void setCalStatus(String calStatus) {
		this.calStatus = calStatus;
	}

	public String getCalContent() {
		return calContent;
	}

	public void setCalContent(String calContent) {
		this.calContent = calContent;
	}

	public String getProjectNo() {
		return projectNo;
	}

	public void setProjectNo(String projectNo) {
		this.projectNo = projectNo;
	}

	@Override
	public String toString() {
		return "Calendar [calendarNo=" + calendarNo + ", cStartDate=" + cStartDate + ", cEndDate=" + cEndDate
				+ ", modifyDate=" + modifyDate + ", calStatus=" + calStatus + ", calContent=" + calContent
				+ ", projectNo=" + projectNo + "]";
	}
	
}
