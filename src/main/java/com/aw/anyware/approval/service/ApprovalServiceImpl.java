package com.aw.anyware.approval.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aw.anyware.approval.dao.ApprovalDao;
import com.aw.anyware.approval.vo.Approval;
import com.aw.anyware.common.model.vo.PageInfo;

@Service
public class ApprovalServiceImpl implements ApprovalService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ApprovalDao aDao;
	
	@Override
	public int selectListCountCon(int userNo) {
		return aDao.selectListCountCon(sqlSession, userNo);
	}
	
	@Override
	public ArrayList<Approval> selectListCon(int userNo, PageInfo pi) {
		return aDao.selectListCon(sqlSession, userNo, pi);
	}


}
