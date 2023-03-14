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
	
	private int listCount = 0;
	private ArrayList<Approval> list = new ArrayList<>();
	private PageInfo pi = null;
	
	private int pageCount = 5;
	private int approCount = 8;
	
	private int userNo = 1;
	
	@RequestMapping("ingListAll.appro")
	public String ingListAll(@RequestParam(value="cpage", defaultValue="1") int currentPage,
							String cat, Model model, HttpSession session) {
				
		listCount = aService.ingCountAll(userNo);
		pi = Pagination.getPageInfo(listCount, currentPage, pageCount, approCount);
		list = aService.ingListAll(userNo, pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("cat", cat);
		
		return "approval/approListView";
	}
	
	@RequestMapping("ingListContinue.appro")
	public String ingListContinue(@RequestParam(value="cpage", defaultValue="1") int currentPage,
			String cat, Model model, HttpSession session) {
		
		listCount = aService.ingCountContinue(userNo);
		pi = Pagination.getPageInfo(listCount, currentPage, pageCount, approCount);
		list = aService.ingListContinue(userNo, pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("cat", cat);
		
		return "approval/approListView";
	}
	
	@RequestMapping("ingListWait.appro")
	public String ingListWait(@RequestParam(value="cpage", defaultValue="1") int currentPage,
			String cat, Model model, HttpSession session) {
		
		listCount = aService.ingCountWait(userNo);
		pi = Pagination.getPageInfo(listCount, currentPage, pageCount, approCount);
		list = aService.ingListWait(userNo, pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("cat", cat);
		
		return "approval/approListView";
	}
	
	@RequestMapping("ingListExpected.appro")
	public String ingListExpected(@RequestParam(value="cpage", defaultValue="1") int currentPage,
			String cat, Model model, HttpSession session) {
		
		listCount = aService.ingCountExpected(userNo);
		pi = Pagination.getPageInfo(listCount, currentPage, pageCount, approCount);
		list = aService.ingListExpected(userNo, pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("cat", cat);
		
		return "approval/approListView";
	}
	
	@RequestMapping("ingListRef.appro")
	public String ingListRef(@RequestParam(value="cpage", defaultValue="1") int currentPage,
			String cat, Model model, HttpSession session) {
		
		listCount = aService.ingCountRef(userNo);
		ArrayList<Integer> ingArrayRef= aService.ingArrayRef(userNo);
		pi = Pagination.getPageInfo(listCount, currentPage, pageCount, approCount);
		list = aService.ingListRef(ingArrayRef, pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("cat", cat);
		
		return "approval/approListView";
	}
	
	@RequestMapping("endListAll.appro")
	public String endListAll(@RequestParam(value="cpage", defaultValue="1") int currentPage,
			String cat, Model model, HttpSession session) {
		
		listCount = aService.endCountAll(userNo);
		pi = Pagination.getPageInfo(listCount, currentPage, pageCount, approCount);
		list = aService.endListAll(userNo, pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("cat", cat);
		
		return "approval/approListView";
	}
	
	@RequestMapping("endListSuggest.appro")
	public String endListSuggest(@RequestParam(value="cpage", defaultValue="1") int currentPage,
			String cat, Model model, HttpSession session) {
		
		listCount = aService.endCountSuggest(userNo);
		pi = Pagination.getPageInfo(listCount, currentPage, pageCount, approCount);
		list = aService.endListSuggest(userNo, pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("cat", cat);
		
		return "approval/approListView";
	}
	
	@RequestMapping("endListConfirm.appro")
	public String endListConfirm(@RequestParam(value="cpage", defaultValue="1") int currentPage,
			String cat, Model model, HttpSession session) {
		
		listCount = aService.endCountConfirm(userNo);
		pi = Pagination.getPageInfo(listCount, currentPage, pageCount, approCount);
		list = aService.endListConfirm(userNo, pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("cat", cat);
		
		return "approval/approListView";
	}
	
	@RequestMapping("endListOpen.appro")
	public String endListOpen(@RequestParam(value="cpage", defaultValue="1") int currentPage,
			String cat, Model model, HttpSession session) {
		
		listCount = aService.endCountOpen(userNo);
		ArrayList<Integer> endArrayOpen= aService.endArrayOpen(userNo);
		pi = Pagination.getPageInfo(listCount, currentPage, pageCount, approCount);
		list = aService.endListOpen(endArrayOpen, pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("cat", cat);
		
		return "approval/approListView";
	}
			
	
	@RequestMapping("enroll.appro")
	public String enrollAppro() {
		return "approval/approEnrollForm";
	}
	
	@RequestMapping("detail.appro")
	public String selectAppro(int approNo, Model model) {
		
		Approval appro = aService.selectAppro(approNo);
		ArrayList<String> ref = aService.selectRef(approNo);
		ArrayList<String> open = aService.selectOpen(approNo);
		
		model.addAttribute("appro", appro);
		model.addAttribute("ref", ref);
		model.addAttribute("open", open);
		
		return "approval/approDetailView"; 
	}
	

}
