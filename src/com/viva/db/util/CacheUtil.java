package com.viva.db.util;

import java.util.HashMap;
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

	public static Map<Integer, Project> allProjectsMap = new HashMap<Integer, Project>();
	public static Map<Integer, Epic> allEpicsMap = new HashMap<Integer, Epic>();
	public static Map<Integer, Sprint> allSprintsMap = new HashMap<Integer, Sprint>();
	public static Map<Integer, BusinessValue> allBVMap = new HashMap<Integer, BusinessValue>();
	public static Map<Integer, UserStory> allUserStoriesMap = new HashMap<Integer, UserStory>();

	static {
		System.out.println(
				"#######################################################################################################");
		for (Project project : projectDao.getProjects()) {
			allProjectsMap.put(project.getId(), project);
		}

		for (Epic epic : epicDao.getEpics()) {
			allEpicsMap.put(epic.getId(), epic);
		}

		for (UserStory userStory : userStoryDao.getAllUserStories()) {
			allUserStoriesMap.put(userStory.getId(), userStory);
		}

		for(Sprint sprint : sprintDao.getAllSprints()) {
			allSprintsMap.put(sprint.getSprintId(), sprint);
		}
		System.out.println(
				"#######################################################################################################");
	}

}
