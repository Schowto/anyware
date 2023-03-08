package com.aw.anyware.approval.service;

import java.util.ArrayList;

import com.aw.anyware.approval.vo.Approval;
import com.aw.anyware.common.model.vo.PageInfo;

public interface ApprovalService {
	
	public int selectListCountCon(int userNo);
	public ArrayList<Approval> selectListCon(int userNo, PageInfo pi);

}
