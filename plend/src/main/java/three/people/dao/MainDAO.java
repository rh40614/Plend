package three.people.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import three.people.vo.FaqVO;
import three.people.vo.NoticeVO;
import three.people.vo.SearchVO;

@Repository
public class MainDAO {

	@Autowired
	SqlSession sqlSession;
	
	public int insertNotice(NoticeVO vo) {
		
		int result = sqlSession.insert("three.people.mapper.mainMapper.insertNotice", vo);
		
		return result;
	}
	
	public List<NoticeVO> noticeAll(SearchVO sv){
		
		return sqlSession.selectList("three.people.mapper.mainMapper.noticeAll", sv);
	}
	
	public NoticeVO noticeOne(int nidx) {
		
		return sqlSession.selectOne("three.people.mapper.mainMapper.noticeOne", nidx);
	}
	
	public int hitPlus(int nidx) {
		return sqlSession.update("three.people.mapper.mainMapper.hitPlus", nidx);
	}
	
	public int noticeDelete(Integer nidx) {
		return sqlSession.update("three.people.mapper.mainMapper.noticeDelete", nidx);
	}
	
	public NoticeVO prevNextTitle(int nidx){
		return sqlSession.selectOne("three.people.mapper.mainMapper.prevNextTitle", nidx);
	}
	
	public NoticeVO prevNextNidx(int nidx){
		return sqlSession.selectOne("three.people.mapper.mainMapper.prevNextNidx", nidx);
	}
	
	public int noticeModify(NoticeVO vo) {
		int result = sqlSession.update("three.people.mapper.mainMapper.noticeModify", vo);
		
		return result;
	}
	
	public int noticeTotal(SearchVO sv) {
		
		return sqlSession.selectOne("three.people.mapper.mainMapper.noticeTotal", sv);
	}
	
	public int insertFaq(FaqVO vo) {
			
		int result = sqlSession.insert("three.people.mapper.mainMapper.insertFaq", vo);
		return result;
	}
	
	public List<FaqVO> faqAll(FaqVO vo){
		return sqlSession.selectList("three.people.mapper.mainMapper.faqAll", vo);
	}
	
	public FaqVO faqOne (int fidx) {
		return sqlSession.selectOne("three.people.mapper.mainMapper.faqOne", fidx);
	}
	
	public int faqModify(FaqVO vo) {
		int result = sqlSession.update("three.people.mapper.mainMapper.faqModify", vo);
		return result;
	}
}

