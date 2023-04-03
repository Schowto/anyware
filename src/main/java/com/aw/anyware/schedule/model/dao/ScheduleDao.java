package com.aw.anyware.schedule.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.aw.anyware.common.model.vo.PageInfo;
import com.aw.anyware.schedule.model.vo.Calendar;
import com.aw.anyware.schedule.model.vo.Schedule;

@Repository
public class ScheduleDao {
	
	/** 새 일정 추가
	 * @param sqlSession
	 * @param s
	 * @return
	 */
	public int addScheduleModal(SqlSessionTemplate sqlSession, Schedule s) {
		return sqlSession.insert("scheduleMapper.addScheduleModal", s);
	}
	
	/** 내 캘린더 추가
	 * @param sqlSession
	 * @param c
	 * @return
	 */
	public int addCalendarModal(SqlSessionTemplate sqlSession, Calendar c) {
		return sqlSession.insert("scheduleMapper.addCalendarModal", c);
	}
	
	/** 내 캘린더 목록
	 * @param sqlSession
	 * @param memberNo
	 * @return
	 */
	public ArrayList<Calendar> calendarList(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("scheduleMapper.calendarList", memberNo);
	}
	
	/** 내 캘린더 수정 화면
	 * @param sqlSession
	 * @param calendar
	 * @return
	 */
	public Calendar calendarModifyModal(SqlSessionTemplate sqlSession, Calendar c) {
		return sqlSession.selectOne("scheduleMapper.calendarModifyModal", c);
	}
	
	/** 내 캘린더 수정
	 * @param sqlSession
	 * @param calendarVo
	 * @return
	 */
	public int updateCalendar(SqlSessionTemplate sqlSession, Calendar c) {
		return sqlSession.update("scheduleMapper.updateCalendar", c);
	}
	
	/** 내 캘린더 삭제
	 * @param sqlSession
	 * @param c
	 * @return
	 */
	public int deleteCalendar(SqlSessionTemplate sqlSession, Calendar c) {
		return sqlSession.delete("scheduleMapper.deleteCalendar", c);
	}
	
	/** 캘린더 삭제시 해당 일정 삭제
	 * @param sqlSession
	 * @param s
	 * @return
	 */
	public int deleteCalendarSchedule(SqlSessionTemplate sqlSession, Schedule s) {
		return sqlSession.delete("scheduleMapper.deleteCalendarSchedule", s);
	}
	
	/** 스케줄 목록 조회 
	 * @param sqlSession
	 * @param memberNo
	 * @return
	 */
	public ArrayList<Schedule> scheduleList(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("scheduleMapper.scheduleList", memberNo);
	}
	
	/** 스케줄 상세 조회
	 * @param sqlSession
	 * @param s
	 * @return
	 */
	public ArrayList<Schedule> detailScheduleList(SqlSessionTemplate sqlSession, Schedule s) {
		return (ArrayList)sqlSession.selectList("scheduleMapper.detailScheduleList", s);
	}
	
	/** 스케줄 상세 조회 수정
	 * @param sqlSession
	 * @param s
	 * @return
	 */
	public int updateScheduleModal(SqlSessionTemplate sqlSession, Schedule s) {
		return sqlSession.update("scheduleMapper.updateScheduleModal", s);
	}
	
	
	/** 스케줄 삭제
	 * @param sqlSession
	 * @param s
	 * @return
	 */
	public int deleteSchedule(SqlSessionTemplate sqlSession, Schedule s) {
		return sqlSession.delete("scheduleMapper.deleteSchedule", s);
	}
	
	/** 키워드 검색
	 * @param sqlSession
	 * @param keyword
	 * @return
	 */
	public ArrayList<Schedule> searchKeyword(SqlSessionTemplate sqlSession, HashMap<String, Object> map, PageInfo pi) {
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("scheduleMapper.searchKeyword", map, rowBounds);
	}
	
	/** 키워드 검색 페이징
	 * @param sqlSession
	 * @return
	 */
	public int selectListCount(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
//		int cc = sqlSession.selectOne("scheduleMapper.selectListCount");
//		System.out.println(cc);
		return sqlSession.selectOne("scheduleMapper.selectListCount", map);
	}
	
	

	
	
	
	
	
	
	

	
}
