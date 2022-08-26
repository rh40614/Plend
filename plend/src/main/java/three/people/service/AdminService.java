package three.people.service;

import java.util.HashMap;
import java.util.List;

import three.people.vo.BlockVO;
import three.people.vo.EventVO;
import three.people.vo.ImageVO;
import three.people.vo.PlaceVO;
import three.people.vo.ReportVO;
import three.people.vo.ReviewVO;
import three.people.vo.SearchVO;
import three.people.vo.UserVO;

public interface AdminService {

	List<UserVO> userList(SearchVO searchvo);
	UserVO userOne(UserVO uservo);
	int userInfo(UserVO uservo);
	int deleteEnter(UserVO uservo);
	List<PlaceVO> enterPlace(UserVO uservo);
	List<PlaceVO> apPlace(SearchVO searchvo);
	int totalPlace(SearchVO searchvo);
	int approvalYN(PlaceVO placevo);
	int insertEvent(EventVO eventvo);
	int eventImg(ImageVO imagevo);
	List<EventVO> eventList(SearchVO searchvo);
	int totalEvent();
	EventVO eventOne(EventVO eventvo);
	int updateEvent(EventVO eventvo);
	int updateImg(ImageVO imagevo);
	int deleteEvent(EventVO eventvo);
	int placeEventUpdate(EventVO eventvo);
	int placeEventDone(EventVO eventvo);
	List<ReportVO> reportList(SearchVO searchVO);
	int countReport(SearchVO searchVO);
	int reviewBlind(ReportVO reportVO);
	List<BlockVO> blockUser(HashMap<String, Object> hashMap);
	int countBlockUser(BlockVO blockVO);
	int blockDelete(BlockVO blockVO);
	int deleteEventImg(ImageVO imageVO);
	List<PlaceVO> Option(SearchVO sv);
	int totalOption();
	int checkEventStartDate();
}
