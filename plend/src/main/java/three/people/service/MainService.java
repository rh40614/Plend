package three.people.service;

import java.util.HashMap;
import java.util.List;

import three.people.vo.FaqVO;
import three.people.vo.NoticeVO;
import three.people.vo.SearchVO;

public interface MainService {

	public int insertNotice(NoticeVO vo);
	public List<NoticeVO> noticeAll(SearchVO sv);
	public NoticeVO noticeOne(int nidx);
	public int hitPlus(int nidx);
	public int noticeDelete(int nidx);
	public NoticeVO prevNextTitle(int nidx);
	public NoticeVO prevNextNidx(int nidx);
	public int noticeModify(NoticeVO vo);
	public int noticeTotal(SearchVO sv);
	public int insertFaq(FaqVO vo);
	public List<FaqVO> faqAll(HashMap<String, String> param);
	public FaqVO faqOne(int fidx);
	public int faqModify(FaqVO vo);
}
