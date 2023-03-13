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
	
	@RequestMapping("list.appro")
	public String selectList(@RequestParam(value="cpage", defaultValue="1") int currentPage,
							String cat, Model model, HttpSession session) {
				
		int listCount = 0;
		ArrayList<Approval> list = new ArrayList<>();
		PageInfo pi = null;
		
		int pageCount = 5;
		int approCount = 8;
		
		switch(cat) {
			case "ingListAll" : 
				listCount = aService.ingCountAll(userNo);
				pi = Pagination.getPageInfo(listCount, currentPage, pageCount, approCount);
				list = aService.ingListAll(userNo, pi);
				break;
			case "ingListContinue" :
				listCount = aService.ingCountContinue(userNo);
				pi = Pagination.getPageInfo(listCount, currentPage, pageCount, approCount);
				list = aService.ingListContinue(userNo, pi);
				break;
			case "ingListWait" :
				listCount = aService.ingCountWait(userNo);
				pi = Pagination.getPageInfo(listCount, currentPage, pageCount, approCount);
				list = aService.ingListWait(userNo, pi);
				break;
			case "ingListExpected" :
				listCount = aService.ingCountExpected(userNo);
				pi = Pagination.getPageInfo(listCount, currentPage, pageCount, approCount);
				list = aService.ingListExpected(userNo, pi);
				break;
			case "ingListRef" :
				listCount = aService.ingCountRef(userNo);
				ArrayList<Integer> ingArrayRef= aService.ingArrayRef(userNo);
				pi = Pagination.getPageInfo(listCount, currentPage, pageCount, approCount);
				list = aService.ingListRef(ingArrayRef, pi);
				break;
			case "endListAll" :
				listCount = aService.endCountAll(userNo);
				pi = Pagination.getPageInfo(listCount, currentPage, pageCount, approCount);
				list = aService.endListAll(userNo, pi);
				break;
			case "endListSuggest" :
				listCount = aService.endCountSuggest(userNo);
				pi = Pagination.getPageInfo(listCount, currentPage, pageCount, approCount);
				list = aService.endListSuggest(userNo, pi);
				break;
			case "endListConfirm" :
				listCount = aService.endCountConfirm(userNo);
				pi = Pagination.getPageInfo(listCount, currentPage, pageCount, approCount);
				list = aService.endListConfirm(userNo, pi);
				break;
			case "endListOpen" :
				listCount = aService.endCountOpen(userNo);
				pi = Pagination.getPageInfo(listCount, currentPage, pageCount, approCount);
				list = aService.endListOpen(userNo, pi);
				break;
		}
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("cat", cat);
		
		return "approval/approvalListView";
	}
	
	@RequestMapping("enroll.appro")
	public String enrollAppro() {
		return "approval/approvalEnrollForm";
	}
	

}
