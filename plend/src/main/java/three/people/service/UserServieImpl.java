package three.people.service;

import org.springframework.beans.factory.annotation.Autowired;


import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import three.people.dao.CommonDAO;
import three.people.vo.UserVO;
@Service
public class UserServieImpl implements UserService {

	@Autowired
	CommonDAO commonDao;
	
	@Override
	public int insertUser(UserVO vo) {
	
		int result = commonDao.insertUser(vo);
		return result;
	}

	@Override
	public UserVO login(UserVO vo) {
		
		return commonDao.login(vo);
	}

}
