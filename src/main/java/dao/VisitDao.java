package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.VisitVo;

public class VisitDao {
	
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<VisitVo> selectList(VisitVo vo) {
		// TODO Auto-generated method stub
		List<VisitVo> list = null;
	
		list = sqlSession.selectList("visit_list_condition",vo);
	
		return list;
	}
	
	public int insert(VisitVo vo) {
		// TODO Auto-generated method stub
		int res = 0;
		
		res = sqlSession.insert("visit_list_condition", vo);
		
		return res;
	}
	
	public VisitVo selectOne(int idx) {
		
		VisitVo vo = null;
	
		vo  = sqlSession.selectOne("visit_one", idx);
		
		return vo;
	}
	
	public int delete(int idx) {
		// TODO Auto-generated method stub
		int res = 0;
	
		res = sqlSession.delete("visit_delete", idx);
		
		return res;
	}
	
	public int update(VisitVo vo) {
		// TODO Auto-generated method stub
		int res = 0;
		res = sqlSession.update("visit_update", vo);
		return res;
	}
	
}
