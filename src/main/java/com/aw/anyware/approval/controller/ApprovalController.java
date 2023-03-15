package com.aw.anyware.approval.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aw.anyware.approval.service.ApprovalService;
import com.aw.anyware.approval.vo.ApproTpl;
import com.aw.anyware.approval.vo.Approval;
import com.aw.anyware.common.model.vo.PageInfo;
import com.aw.anyware.common.template.Pagination;
import com.aw.anyware.member.model.vo.Member;

@Controller
public class ApprovalController {
	
	@Autowired
	private ApprovalService aService;
	
	private int userNo = 0;
	private int listCount = 0;
	private ArrayList<Approval> list = new ArrayList<>();
	private PageInfo pi = null;
	
	private int pageCount = 5;
	private int approCount = 8;
	

	
	@RequestMapping("ingListAll.appro")
	public String ingListAll(@RequestParam(value="cpage", defaultValue="1") int currentPage,
							String cat, Model model, HttpSession session) {
		
		userNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		listCount = aService.ingCountAll(userNo);
		pi = Pagination.getPageInfo(listCount, currentPage, pageCount, approCount);
		list = aService.ingListAll(userNo, pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("cat", cat);
		
		return "approval/approBaseView";
	}
	
	@RequestMapping("ingListContinue.appro")
	public String ingListContinue(@RequestParam(value="cpage", defaultValue="1") int currentPage,
			String cat, Model model, HttpSession session) {
		
		userNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
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
		
		userNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
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
		
		userNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		listCount = aService.ingCountExpected(userNo);
		pi = Pagination.getPageInfo(listCount, currentPage, pageCount, approCount);
		list = aService.ingListExpected(userNo, pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("cat", cat);
		
		return "approval/approBaseView";
	}
	
	@RequestMapping("ingListRef.appro")
	public String ingListRef(@RequestParam(value="cpage", defaultValue="1") int currentPage,
			String cat, Model model, HttpSession session) {
		
		userNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		listCount = aService.ingCountRef(userNo);
		ArrayList<Integer> ingArrayRef= aService.ingArrayRef(userNo);
		pi = Pagination.getPageInfo(listCount, currentPage, pageCount, approCount);
		list = aService.ingListRef(ingArrayRef, pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("cat", cat);
		
		return "approval/approBaseView";
	}
	
	@RequestMapping("endListAll.appro")
	public String endListAll(@RequestParam(value="cpage", defaultValue="1") int currentPage,
			String cat, Model model, HttpSession session) {
		
		userNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		listCount = aService.endCountAll(userNo);
		pi = Pagination.getPageInfo(listCount, currentPage, pageCount, approCount);
		list = aService.endListAll(userNo, pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("cat", cat);
		
		return "approval/approBaseView";
	}
	
	@RequestMapping("endListSuggest.appro")
	public String endListSuggest(@RequestParam(value="cpage", defaultValue="1") int currentPage,
			String cat, Model model, HttpSession session) {
		
		userNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		listCount = aService.endCountSuggest(userNo);
		pi = Pagination.getPageInfo(listCount, currentPage, pageCount, approCount);
		list = aService.endListSuggest(userNo, pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("cat", cat);
		
		return "approval/approBaseView";
	}
	
	@RequestMapping("endListConfirm.appro")
	public String endListConfirm(@RequestParam(value="cpage", defaultValue="1") int currentPage,
			String cat, Model model, HttpSession session) {
		
		userNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		listCount = aService.endCountConfirm(userNo);
		pi = Pagination.getPageInfo(listCount, currentPage, pageCount, approCount);
		list = aService.endListConfirm(userNo, pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("cat", cat);
		
		return "approval/approBaseView";
	}
	
	@RequestMapping("endListOpen.appro")
	public String endListOpen(@RequestParam(value="cpage", defaultValue="1") int currentPage,
			String cat, Model model, HttpSession session) {
		
		userNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		listCount = aService.endCountOpen(userNo);
		ArrayList<Integer> endArrayOpen= aService.endArrayOpen(userNo);
		pi = Pagination.getPageInfo(listCount, currentPage, pageCount, approCount);
		list = aService.endListOpen(endArrayOpen, pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("cat", cat);
		
		return "approval/approBaseView";
	}
			
	
	@RequestMapping("enroll.appro")
	public String enrollAppro(Model model) {
		
		ArrayList<ApproTpl> tplList = aService.listTpl();
		
		model.addAttribute("tplList", tplList);
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
	
	@RequestMapping("check.appro")
	public String checkAppro(int approNo, Model model) {
		
		Approval appro = aService.selectAppro(approNo);
		ArrayList<String> ref = aService.selectRef(approNo);
		ArrayList<String> open = aService.selectOpen(approNo);
		
		model.addAttribute("appro", appro);
		model.addAttribute("ref", ref);
		model.addAttribute("open", open);
		
		return "approval/approCheckView"; 
	}
	
	@RequestMapping("confirm.appro")
	public String confirmAppro(Approval appro, Model model, HttpSession session) {
		
		int result =  aService.confirmAppro(appro);
		
		if(result > 0) { // 성공 ==> session에 loginUser지움, alert문구 담기 -> 메인 url 재요청
			session.setAttribute("alertMsg", "결재 성공");
			return "redirect:endListConfirm.appro?cat=endListConfirm";
		} else {
			model.addAttribute("errorMsg", "결재 실패");
			return "common/errorPage";
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value = "selectTpl.appro", produces="text/html; charset=UTF-8")
	public String selectTpl(String tplTitle) {
		
		String result = aService.selectTpl(tplTitle);
		
		return result;
	}
	
	
	
}
