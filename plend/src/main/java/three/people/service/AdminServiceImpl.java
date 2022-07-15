package three.people.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import three.people.dao.AdminDAO;
import three.people.vo.PlaceVO;
import three.people.vo.SearchVO;
import three.people.vo.UserVO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	AdminDAO adminDAO;
	
//	07.14 김영민: 유저리스트, 페이징, 검색 로직
	@Override
	public List<UserVO> userList(SearchVO searchvo) {
		return adminDAO.userList(searchvo);
	}

	@Override
	public UserVO userOne(UserVO uservo) {
		return adminDAO.userOne(uservo);
	}

	@Override
	public int userInfo(UserVO uservo) {
		return adminDAO.userInfo(uservo);
	}

	@Override
	public int deleteEnter(UserVO uservo) {
		return adminDAO.deleteEnter(uservo);
	}

	@Override
	public List<PlaceVO> enterPlace(UserVO uservo) {
		return adminDAO.enterPlace(uservo);
	}

	@Override
	public List<PlaceVO> apPlace(SearchVO searchvo) {
		return adminDAO.apPlace(searchvo);
	}

}