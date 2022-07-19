package three.people.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import three.people.dao.MainDAO;
import three.people.vo.FaqVO;
import three.people.vo.NoticeVO;
import three.people.vo.SearchVO;

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
	public List<NoticeVO> noticeAll(SearchVO sv) {
		
		return mainDao.noticeAll(sv);
	}

	@Override
	public NoticeVO noticeOne(int nidx) {
		
		return mainDao.noticeOne(nidx);
	}

	@Override
	public int hitPlus(int hit) {
		
		return mainDao.hitPlus(hit);
	}

	@Override
	public int noticeDelete(int nidx) {
		
		return mainDao.noticeDelete(nidx);
	}

	@Override
	public NoticeVO prevNextTitle(int nidx) {
		
		return mainDao.prevNextTitle(nidx);
	}
	
	@Override
	public NoticeVO prevNextNidx(int nidx) {
		
		return mainDao.prevNextNidx(nidx);
	}

	@Override
	public int noticeModify(NoticeVO vo) {
		int result = mainDao.noticeModify(vo);	
		return result;
	}

	@Override
	public int noticeTotal(SearchVO sv) {
		return mainDao.noticeTotal(sv);
	}

	@Override
	public int insertFaq(FaqVO vo) {
		int result = mainDao.insertFaq(vo);
		return result;
	}

	@Override
	public List<FaqVO> faqAll(FaqVO vo) {
		return mainDao.faqAll(vo);
	}

	@Override
	public FaqVO faqOne(int fidx) {
		
		return mainDao.faqOne(fidx);
	}

	@Override
	public int faqModify(FaqVO vo) {
		int result = mainDao.faqModify(vo);
		
		return result;
	}

}
