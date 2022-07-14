package three.people.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import three.people.dao.AdminDAO;
import three.people.vo.UserVO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	AdminDAO adminDAO;
	
	@Override
	public List<UserVO> userList() {
		return adminDAO.userList();
	}

}
