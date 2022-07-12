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

	@Override
	public UserVO searchID(UserVO vo) {
		
		return commonDao.searchId(vo);
	}

	@Override
	public int idCheck(String id) {
		
		int result = commonDao.idCheck(id);
		
		return result;
	}

	@Override
	public int nickNameCheck(String nickName) {
		int result = commonDao.nickNameCheck(nickName);
		return result;
	}

}
