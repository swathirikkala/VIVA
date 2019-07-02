package com.viva.filter;

import javax.servlet.http.HttpServletRequest;

public class DataClean {

	public static void clean(HttpServletRequest hsr) {
		hsr.getSession().removeAttribute("businessValuesStatusReport");
		hsr.getSession().removeAttribute("businessValuesStatusReportProjectId");
		hsr.getSession().removeAttribute("businessValuesStatusReportSprintId");
		hsr.getSession().removeAttribute("businessValuesStatusReportEpicId");

		hsr.getSession().removeAttribute("sprints");
		hsr.getSession().removeAttribute("projects");
		hsr.getSession().removeAttribute("epics");
		hsr.getSession().removeAttribute("userStories");
	}
}
