package com.aw.anyware.approval.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.aw.anyware.approval.vo.Approval;
import com.aw.anyware.common.model.vo.PageInfo;

@Repository
public class ApprovalDao {
	
	public int selectListCountCon(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("approvalMapper.selectListCountCon", userNo);
	}
	
	public ArrayList<Approval> selectListCon(SqlSessionTemplate sqlSession, int userNo, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("approvalMapper.selectListCon", userNo, rowBounds);
	}

}
