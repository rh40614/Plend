package three.people.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import three.people.dao.MainDAO;
import three.people.vo.NoticeVO;

@Service
public class MainServiceImpl implements MainService{

	@Autowired
	MainDAO mainDao;

	@Override
	public int insertNotice(NoticeVO vo) {
		int result = mainDao.insertNotice(vo);
		return result;
	}

	@Override
	public List<NoticeVO> noticeAll(NoticeVO vo) {
		
		return mainDao.noticeAll(vo);
	}
}
