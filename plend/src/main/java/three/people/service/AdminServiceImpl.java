package three.people.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import three.people.dao.AdminDAO;
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

}
