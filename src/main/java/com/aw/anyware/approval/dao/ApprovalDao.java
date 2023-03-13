package com.aw.anyware.approval.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.aw.anyware.approval.vo.Approval;
import com.aw.anyware.common.model.vo.PageInfo;

@Repository
public class ApprovalDao {
	
	public int ingCountAll(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("approvalMapper.ingCountAll", userNo);
	}
	
	public int ingCountContinue(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("approvalMapper.ingCountContinue", userNo);
	}
	
	public int ingCountWait(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("approvalMapper.ingCountWait", userNo);
	}
	
	public int ingCountExpected(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("approvalMapper.ingCountExpected", userNo);
	}
	
	public int ingCountRef(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("approvalMapper.ingCountRef", userNo);
	}
	
	public ArrayList<Integer>ingArrayRef(SqlSessionTemplate sqlSession, int userNo) {
		System.out.println(userNo);
		System.out.println((ArrayList)sqlSession.selectList("approvalMapper.ingArrayRef", userNo));
		return (ArrayList)sqlSession.selectList("approvalMapper.ingArrayRef", userNo);
	}
	
	public int endCountAll(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("approvalMapper.endCountAll", userNo);
	}
	
	public int endCountSuggest(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("approvalMapper.endCountSuggest", userNo);
	}
	
	public int endCountConfirm(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("approvalMapper.endCountConfirm", userNo);
	}
	
	public int endCountOpen(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("approvalMapper.endCountOpen", userNo);
	}
	
	/*  =============================================================  */
	
	public ArrayList<Approval> ingListAll(SqlSessionTemplate sqlSession, int userNo, PageInfo pi) {
		return (ArrayList)sqlSession.selectList("approvalMapper.ingListAll", userNo, pi.getRowBounds());
	}
	
	public ArrayList<Approval> ingListContinue(SqlSessionTemplate sqlSession, int userNo, PageInfo pi) {
		return (ArrayList)sqlSession.selectList("approvalMapper.ingListContinue", userNo, pi.getRowBounds());
	}
	
	public ArrayList<Approval> ingListWait(SqlSessionTemplate sqlSession, int userNo, PageInfo pi) {
		return (ArrayList)sqlSession.selectList("approvalMapper.ingListWait", userNo, pi.getRowBounds());
	}
	
	public ArrayList<Approval> ingListExpected(SqlSessionTemplate sqlSession, int userNo, PageInfo pi) {
		return (ArrayList)sqlSession.selectList("approvalMapper.ingListExpected", userNo, pi.getRowBounds());
	}
	
	public ArrayList<Approval> ingListRef(SqlSessionTemplate sqlSession, ArrayList<Integer> ingArrayRef, PageInfo pi) {
		return (ArrayList)sqlSession.selectList("approvalMapper.ingListRef", ingArrayRef, pi.getRowBounds());
	}
	
	public ArrayList<Approval> endListSuggest(SqlSessionTemplate sqlSession, int userNo, PageInfo pi) {
		return (ArrayList)sqlSession.selectList("approvalMapper.endListSuggest", userNo, pi.getRowBounds());
	}
	
	public ArrayList<Approval> endListConfirm(SqlSessionTemplate sqlSession, int userNo, PageInfo pi) {
		return (ArrayList)sqlSession.selectList("approvalMapper.endListConfirm", userNo, pi.getRowBounds());
	}
	
	public ArrayList<Approval> endListOpen(SqlSessionTemplate sqlSession, int userNo, PageInfo pi) {
		return (ArrayList)sqlSession.selectList("approvalMapper.endListOpen", userNo, pi.getRowBounds());
	}
	
	
}
