package com.aw.anyware.schedule.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.aw.anyware.common.model.vo.PageInfo;
import com.aw.anyware.schedule.model.vo.Calendar;
import com.aw.anyware.schedule.model.vo.Schedule;

public interface ScheduleService {
	
	// 새 일정 추가
	int addScheduleModal(Schedule s);

	// 내 캘린더 추가
	int addCalendarModal(Calendar c);
	
	// 내 캘린더 목록 조회
	ArrayList<Calendar> calendarList(int memberNo);
	
	// 내 캘린더 수정 화면
	Calendar calendarModifyModal(Calendar c);
	
	// 내 캘린더 수정
	int updateCalendar(Calendar c);
	
	// 내 캘린더 삭제
	int deleteCalendar(Calendar c);
	
	// 캘린더 삭제시 해당 일정 삭제
	int deleteCalendarSchedule(Schedule s);
	
	// 스케줄 목록 조회
	ArrayList<Schedule> scheduleList(int memberNo);
	
	// 스케줄 상세 조회
	ArrayList<Schedule> detailScheduleList(Schedule s);
	
	// 스케줄 상세 조회 수정
	int updateScheduleModal(Schedule s);
	
	// 스케줄 삭제
	int deleteSchedule(Schedule s);
	
	// 키워드 검색 페이징 - 게시글 수
	int selectListCount(HashMap<String, Object> map);
	
	// 키워드 검색
	ArrayList<Schedule> searchKeyword(HashMap<String, Object> map, PageInfo pi);
	
	
	
	
}
