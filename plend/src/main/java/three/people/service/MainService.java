package three.people.service;

import java.util.List;

import three.people.vo.NoticeVO;

public interface MainService {

	int insertNotice(NoticeVO vo);
	public List<NoticeVO> noticeAll(NoticeVO vo);
}
