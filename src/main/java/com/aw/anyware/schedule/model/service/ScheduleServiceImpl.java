package com.aw.anyware.schedule.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aw.anyware.common.model.vo.PageInfo;
import com.aw.anyware.schedule.model.dao.ScheduleDao;
import com.aw.anyware.schedule.model.vo.Calendar;
import com.aw.anyware.schedule.model.vo.Schedule;

@Service
public class ScheduleServiceImpl implements ScheduleService {

	@Autowired(required = true)
	private SqlSessionTemplate sqlSession;

	@Autowired(required = true)
	private ScheduleDao scDao;

	/**
	 * 새 일정 추가
	 */
	@Override
	public int addScheduleModal(Schedule s) {
		return scDao.addScheduleModal(sqlSession, s);
	}

	/**
	 * 내 캘린더 추가
	 */
	@Override
	public int addCalendarModal(Calendar c) {
		return scDao.addCalendarModal(sqlSession, c);
	}

	/**
	 * 내 캘린더 목록
	 */
	@Override 
	public ArrayList<Calendar> calendarList(int memberNo) {
		return scDao.calendarList(sqlSession, memberNo); 
	}
	 
	/**
	 * 내 캘린더 수정 화면
	 */
	@Override
	public Calendar calendarModifyModal(Calendar c) {
		return scDao.calendarModifyModal(sqlSession, c);
	}

	/**
	 * 내 캘린더 수정
	 */
	@Override
	public int updateCalendar(Calendar c) {
		return scDao.updateCalendar(sqlSession, c);
	}

	/**
	 * 내 캘린더 삭제
	 */
	@Override
	public int deleteCalendar(Calendar c) {
		return scDao.deleteCalendar(sqlSession, c);
	}
	
	/**
	 * 캘린더 삭제시 해당 일정 삭제
	 */
	@Override
	public int deleteCalendarSchedule(Schedule s) {
		return scDao.deleteCalendarSchedule(sqlSession, s);
	}
	
	/**
	 * 스케줄 목록 조회
	 */
	@Override
	public ArrayList<Schedule> scheduleList(int memberNo) {
		return scDao.scheduleList(sqlSession, memberNo);
	}

	/**
	 * 스케줄 상세 조회
	 */
	@Override
	public ArrayList<Schedule> detailScheduleList(Schedule s) {
		return scDao.detailScheduleList(sqlSession, s);
	}
	
	/**
	 * 스케줄 상세 조회 수정
	 */
	@Override
	public int updateScheduleModal(Schedule s) {
		return scDao.updateScheduleModal(sqlSession, s);
	}
	
	/**
	 * 스케줄 삭제
	 */
	@Override
	public int deleteSchedule(Schedule s) {
		return scDao.deleteSchedule(sqlSession, s);
	}
	
	/**
	 * 키워드 검색
	 */
	@Override
	public ArrayList<Schedule> searchKeyword(HashMap<String, Object> map, PageInfo pi) {
		return scDao.searchKeyword(sqlSession, map, pi);
	}

	/**
	 * 키워드 검색 페이징
	 */
	@Override
	public int selectListCount(HashMap<String, Object> map) {
		return scDao.selectListCount(sqlSession, map);
	}



	

	
	

	
	
	

	
	
	
	
	
	
	
	
	
	
	

}