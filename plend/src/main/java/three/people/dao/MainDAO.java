package three.people.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import three.people.vo.NoticeVO;

@Repository
public class MainDAO {

	@Autowired
	SqlSession sqlSession;
	
	public int insertNotice(NoticeVO vo) {
		
		int result = sqlSession.insert("three.people.mapper.mainMapper.insertNotice", vo);
		
		return result;
	}
	
	public List<NoticeVO> noticeAll(NoticeVO vo){
		
		return sqlSession.selectList("three.people.mapper.mainMapper.noticeAll", vo);
	}
}
