package com.aw.anyware.schedule.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aw.anyware.common.model.vo.PageInfo;
import com.aw.anyware.common.template.Pagination;
import com.aw.anyware.member.model.vo.Member;
import com.aw.anyware.schedule.model.service.ScheduleService;
import com.aw.anyware.schedule.model.vo.Calendar;
import com.aw.anyware.schedule.model.vo.Schedule;

@Controller
public class ScheduleController {
	
	@Autowired(required=true)
	private ScheduleService scService;
	
	// 일정 메인 페이지
	@RequestMapping("schedule.sc")
	public String scheduleMain(HttpSession session) {
		int memNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		return "schedule/scheduleMain";
	}
	
	// 키워드 검색 페이지
	@RequestMapping("scheduleSearchList.sc")
	public String scheduleSearchList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage, String keyword, HttpSession session, Model model) {
		int memberNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		
		HashMap<String, Object> map = new HashMap<>();
	      map.put("memberNo", memberNo);
	      map.put("keyword", keyword);

		int listCount = scService.selectListCount(map); // 페이징 - 게시글 수
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		
		ArrayList<Schedule> list = scService.searchKeyword(map, pi);
		
		model.addAttribute("count", listCount);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "schedule/scheduleSearchList"; 
	}
	
	// 새 일정 추가
	@ResponseBody
	@RequestMapping("addScheduleModal.sc")
	public String ajaxAddScheduleModal(Schedule s, HttpSession session) {
		s.setMemberNo(((Member)session.getAttribute("loginUser")).getMemberNo());
		int result = scService.addScheduleModal(s);
		return result > 0 ? "success" : "fail";
	}
	
	// 내 캘린더 추가
	@ResponseBody
	@RequestMapping("addCalendarModal.sc")
	public String ajaxAddScheduleModal(Calendar c, HttpSession session) {
		c.setMemberNo(((Member)session.getAttribute("loginUser")).getMemberNo());
		int result = scService.addCalendarModal(c);
		return result > 0 ? "success" : "fail";
	}
	
	// 내 캘린더 목록 조회
	@RequestMapping("calendarList.sc")
	@ResponseBody
	public ArrayList<Calendar> calendarList(HttpSession session) {
		int memberNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		ArrayList<Calendar> list = scService.calendarList(memberNo);
		return list;
	}
	
	// 내 캘린더 수정 화면
	@RequestMapping("selectCalendar.sc")
	@ResponseBody
	public Calendar calendarModifyModal(Calendar c, HttpSession session) {
		c.setMemberNo(((Member)session.getAttribute("loginUser")).getMemberNo());
		Calendar cc = scService.calendarModifyModal(c);
		//System.out.println("cc : " +cc );
		return cc;
	}
	
	// 내 캘린더 수정
	@RequestMapping("updateCalendar.sc")
	@ResponseBody
	public String updateCalendar(Calendar c, HttpSession session) {
		c.setMemberNo(((Member)session.getAttribute("loginUser")).getMemberNo());
		int result = scService.updateCalendar(c);
		return result > 0 ? "success" : "fail";
	}
	
	// 내 캘린더 삭제
	@RequestMapping("deleteCalendar.sc")
	@ResponseBody
	public String deleteCalendar(Calendar c, HttpSession session) {
		c.setMemberNo(((Member)session.getAttribute("loginUser")).getMemberNo());
		//System.out.println("c는" + c);		
		
		// 캘린더 삭제시 해당 일정 삭제
		Schedule q = new Schedule();
		q.setCalendarNo(c.getCalendarNo());
		q.setMemberNo(((Member)session.getAttribute("loginUser")).getMemberNo());
		//System.out.println("qqq : " + q);
		
		int ss = scService.deleteCalendarSchedule(q);
		//System.out.println("ss :"+ss);
		
		int result = scService.deleteCalendar(c);

		return result > 0 ? "success" : "fail";
	}
	
	// 스케줄 리스트 조회
	@RequestMapping("scheduleList.sc")
	@ResponseBody
	public ArrayList<Schedule> scheduleList(HttpSession session, Model m) {
		int memberNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		ArrayList<Schedule> list = scService.scheduleList(memberNo);
		//System.out.println("list내용은 들어왔을까 : " + list);
		m.addAttribute("list", list);
		return list;
		
	}
	
	// 스케줄 상세 조회
	@RequestMapping("detailScheduleModal.sc")
	@ResponseBody
	public ArrayList<Schedule> detailScheduleList(Schedule s, HttpSession session) {
		s.setMemberNo(((Member)session.getAttribute("loginUser")).getMemberNo());
		ArrayList<Schedule> list = scService.detailScheduleList(s);
		return list;
	}
	
	// 스케줄 상세 조회 수정
	@RequestMapping("updateScheduleModal.sc")
	@ResponseBody
	public String updateScheduleModal(Schedule s, HttpSession session) {
		s.setMemberNo(((Member)session.getAttribute("loginUser")).getMemberNo());
		//System.out.println("s를찍어볼게" + s);
		int result = scService.updateScheduleModal(s);
		
		
		//System.out.println("result는" + result);
		
		return result > 0 ? "success" : "fail";
	}
	
	// 스케줄 삭제
	@RequestMapping("deleteSchedule.sc")
	@ResponseBody
	public String deleteSchedule(Schedule s, HttpSession session) {
		s.setMemberNo(((Member)session.getAttribute("loginUser")).getMemberNo());
		//System.out.println("s에 멤버넘버가 들어있을까 : " + s);
		int result = scService.deleteSchedule(s);
		return result > 0 ? "success" : "fail";
	}
	
	
	
	
	
	

	
	
	
	
	
	
	
}
