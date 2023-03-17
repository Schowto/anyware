package com.aw.anyware.approval.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.aw.anyware.approval.vo.ApproTpl;
import com.aw.anyware.approval.vo.Approval;
import com.aw.anyware.common.model.vo.PageInfo;
import com.aw.anyware.member.model.vo.Member;

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
	
	public ArrayList<Integer>endArrayOpen(SqlSessionTemplate sqlSession, int userNo) {
		return (ArrayList)sqlSession.selectList("approvalMapper.endArrayOpen", userNo);
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
	
	public ArrayList<Approval> endListAll(SqlSessionTemplate sqlSession, int userNo, PageInfo pi) {
		return (ArrayList)sqlSession.selectList("approvalMapper.endListAll", userNo, pi.getRowBounds());
	}
	
	public ArrayList<Approval> endListSuggest(SqlSessionTemplate sqlSession, int userNo, PageInfo pi) {
		return (ArrayList)sqlSession.selectList("approvalMapper.endListSuggest", userNo, pi.getRowBounds());
	}
	
	public ArrayList<Approval> endListConfirm(SqlSessionTemplate sqlSession, int userNo, PageInfo pi) {
		return (ArrayList)sqlSession.selectList("approvalMapper.endListConfirm", userNo, pi.getRowBounds());
	}
	
	public ArrayList<Approval> endListOpen(SqlSessionTemplate sqlSession, ArrayList<Integer> endArrayOpen, PageInfo pi) {
		return (ArrayList)sqlSession.selectList("approvalMapper.endListOpen", endArrayOpen, pi.getRowBounds());
	}
	
	//
	
	public Approval selectAppro(SqlSessionTemplate sqlSession, int approNo) {
		return (Approval)sqlSession.selectOne("approvalMapper.selectAppro", approNo);
	}
	
	public ArrayList<String> selectRef(SqlSessionTemplate sqlSession, int approNo){
		return (ArrayList) sqlSession.selectList("approvalMapper.selectRef", approNo);
	}
	
	public ArrayList<String> selectOpen(SqlSessionTemplate sqlSession, int approNo){
		return (ArrayList) sqlSession.selectList("approvalMapper.selectOpen", approNo);
	}
	
	public int confirmAppro(SqlSessionTemplate sqlSession, Approval appro) {
		return sqlSession.update("approvalMapper.confirmAppro", appro);
	}
	
	//============================================================================================
	
	public ArrayList<ApproTpl> listTpl(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("approvalMapper.listTpl");
	}
	
	public ApproTpl selectTpl(SqlSessionTemplate sqlSession, String tplTitle) {
		return sqlSession.selectOne("approvalMapper.selectTpl", tplTitle); 
	}
	
	public ArrayList<Member> memList(SqlSessionTemplate sqlSession, HashMap<String, String> searchBox){
		return (ArrayList)sqlSession.selectList("approvalMapper.memList", searchBox);
	}
	
	public int insertAppro(SqlSession notAutoSession, Approval appro) {
		return notAutoSession.insert("approvalMapper.insertAppro", appro);
	}
	
	public int insertRef(SqlSession notAutoSession, String[] refNo) {
		int result = 1;
		
		for ( String ref : refNo) {
			result *= notAutoSession.insert("approvalMapper.insertRef", ref);
		}
		
		return result;
	}
	
	public int insertOpen(SqlSession notAutoSession, String[] openNo) {
		int result = 1;
		
		for ( String open : openNo) {
			result *= notAutoSession.insert("approvalMapper.insertOpen", open);
		}
		
		return result;
	}
	
	
}
