package com.aw.anyware.approval.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.aw.anyware.approval.service.ApprovalService;
import com.aw.anyware.approval.vo.Approval;
import com.aw.anyware.common.model.vo.PageInfo;
import com.aw.anyware.common.template.Pagination;

@Controller
public class ApprovalController {
	
	@Autowired
	private ApprovalService aService;
	
	@Autowired 
	private HttpSession session;
	
	private int userNo = 1;
	
	@RequestMapping("con.appro")
	public String selectList(@RequestParam(value="cpage", defaultValue="1") int currentPage,
							Model model, HttpSession session) {
				
		int listCount = aService.selectListCountCon(userNo);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<Approval> list = aService.selectListCon(userNo, pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("category", "c2");
		
		return "approval/approvalListView";
	}
	
	@RequestMapping("enroll.appro")
	public String enrollAppro() {
		return "approval/approvalEnrollForm";
	}
	

}
