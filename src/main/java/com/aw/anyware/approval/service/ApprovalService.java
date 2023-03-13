package com.aw.anyware.approval.service;

import java.util.ArrayList;

import com.aw.anyware.approval.vo.Approval;
import com.aw.anyware.common.model.vo.PageInfo;

public interface ApprovalService {
	
	public int ingCountAll(int userNo);
	public ArrayList<Approval> ingListAll(int userNo, PageInfo pi);
	
	public int ingCountContinue(int userNo);
	public ArrayList<Approval> ingListContinue(int userNo, PageInfo pi);
	
	public int ingCountWait(int userNo);
	public ArrayList<Approval> ingListWait(int userNo, PageInfo pi);
	
	public int ingCountExpected(int userNo);
	public ArrayList<Approval> ingListExpected(int userNo, PageInfo pi);
	
	public int ingCountRef(int userNo);
	public ArrayList<Integer> ingArrayRef(int userNo);
	public ArrayList<Approval> ingListRef(ArrayList<Integer> ingArrayRef, PageInfo pi);
	
	public int endCountAll(int userNo);
	public ArrayList<Approval> endListAll(int userNo, PageInfo pi);
	
	public int endCountSuggest(int userNo);
	public ArrayList<Approval> endListSuggest(int userNo, PageInfo pi);
	
	public int endCountConfirm(int userNo);
	public ArrayList<Approval> endListConfirm(int userNo, PageInfo pi);
	
	public int endCountOpen(int userNo);
	public ArrayList<Integer> endArrayOpen(int userNo);
	public ArrayList<Approval> endListOpen(ArrayList<Integer> endArrayOpen, PageInfo pi);
	
	public Approval selectAppro(int approNo);
	public ArrayList<String> selectRef(int approNo);
	public ArrayList<String> selectOpen(int approNo);
	

}
