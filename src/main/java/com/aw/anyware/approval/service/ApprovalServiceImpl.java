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
	public int ingCountContinue(int userNo) {
		return aDao.ingCountContinue(sqlSession, userNo);
	}
	
	@Override
	public ArrayList<Approval> ingListContinue(int userNo, PageInfo pi) {
		return aDao.ingListContinue(sqlSession, userNo, pi);
	}

	@Override
	public int ingCountAll(int userNo) {
		return aDao.ingCountAll(sqlSession, userNo);
	}

	@Override
	public ArrayList<Approval> ingListAll(int userNo, PageInfo pi) {
		return aDao.ingListAll(sqlSession, userNo, pi);
	}

	@Override
	public int ingCountWait(int userNo) {
		return aDao.ingCountWait(sqlSession, userNo);
	}

	@Override
	public ArrayList<Approval> ingListWait(int userNo, PageInfo pi) {
		return aDao.ingListWait(sqlSession, userNo, pi);
	}

	@Override
	public int ingCountExpected(int userNo) {
		return aDao.ingCountExpected(sqlSession, userNo);
	}

	@Override
	public ArrayList<Approval> ingListExpected(int userNo, PageInfo pi) {
		return aDao.ingListExpected(sqlSession, userNo, pi);
	}

	@Override
	public int ingCountRef(int userNo) {
		return aDao.ingCountRef(sqlSession, userNo);
	}
	
	@Override
	public ArrayList<Integer> ingArrayRef(int userNo) {
		return aDao.ingArrayRef(sqlSession, userNo);
	}
		
	@Override
	public ArrayList<Approval> ingListRef(ArrayList<Integer> ingArrayRef, PageInfo pi) {
		return aDao.ingListRef(sqlSession, ingArrayRef, pi);
	}

	@Override
	public int endCountAll(int userNo) {
		return 0;
	}

	@Override
	public ArrayList<Approval> endListAll(int userNo, PageInfo pi) {
		return null;
	}

	@Override
	public int endCountSuggest(int userNo) {
		return 0;
	}

	@Override
	public ArrayList<Approval> endListSuggest(int userNo, PageInfo pi) {
		return null;
	}

	@Override
	public int endCountConfirm(int userNo) {
		return 0;
	}

	@Override
	public ArrayList<Approval> endListConfirm(int userNo, PageInfo pi) {
		return null;
	}

	@Override
	public int endCountOpen(int userNo) {
		return 0;
	}

	@Override
	public ArrayList<Approval> endListOpen(int userNo, PageInfo pi) {
		return null;
	}



}
