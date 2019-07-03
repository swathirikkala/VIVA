package com.viva.db.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.viva.dao.BusinessValuesDao;
import com.viva.dao.EpicDao;
import com.viva.dao.ProjectDao;
import com.viva.dao.SprintDao;
import com.viva.dao.UserStoryDao;
import com.viva.dto.BusinessValue;
import com.viva.dto.Epic;
import com.viva.dto.Project;
import com.viva.dto.Sprint;
import com.viva.dto.UserStory;

public class CacheUtil {
	private static ProjectDao projectDao = new ProjectDao();
	private static SprintDao sprintDao = new SprintDao();
	private static EpicDao epicDao = new EpicDao();
	private static UserStoryDao userStoryDao = new UserStoryDao();
	private static BusinessValuesDao businessValuesDao = new BusinessValuesDao();

	public static List<Project> allProjects =null;
	public static List<Epic> allEpics =null;
	public static List<Sprint> allSprints =null;
	public static List<UserStory> allUserStories =null;
	public static List<BusinessValue> allBusinessValues =null;

	public static Map<Integer, Project> allProjectsMap = new HashMap<Integer, Project>();
	public static Map<Integer, Epic> allEpicsMap = new HashMap<Integer, Epic>();
	public static Map<Integer, Sprint> allSprintsMap = new HashMap<Integer, Sprint>();
	public static Map<Integer, BusinessValue> allBVMap = new HashMap<Integer, BusinessValue>();
	public static Map<Integer, UserStory> allUserStoriesMap = new HashMap<Integer, UserStory>();

	static {
		System.out.println("##################################################################################");
		updateProjects();
		updateEpics();
		updateSprints();
		updateUserStories();
		updateBusinessValues();
		System.out.println("###################################################################################");
	}

	public static void updateBusinessValues() {
		allBusinessValues = businessValuesDao.getAllBusinessValues();
		for(BusinessValue bv : allBusinessValues) {
			allBVMap.put(bv.getId(),bv);
		}
	}
	public static void updateProjects() {
		allProjects = projectDao.getProjects();
		for (Project project : allProjects) {
			allProjectsMap.put(project.getId(), project);
		}
	}

	public static void updateSprints() {
		allSprints = sprintDao.getAllSprints();
		for (Sprint sprint : allSprints) {
			allSprintsMap.put(sprint.getSprintId(), sprint);
		}
	}

	public static void updateEpics() {
		allEpics = epicDao.getEpics();
		for (Epic epic : allEpics) {
			allEpicsMap.put(epic.getId(), epic);
		}
	}

	public static void updateUserStories() {
		allUserStories = userStoryDao.getAllUserStories();
		for (UserStory userStory : allUserStories) {
			allUserStoriesMap.put(userStory.getId(), userStory);
		}
	}

}
