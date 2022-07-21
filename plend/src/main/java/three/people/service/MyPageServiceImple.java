package three.people.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import three.people.dao.MyPageDAO;
import three.people.vo.UserVO;

@Service
public class MyPageServiceImple implements MyPageService{
	
	@Autowired
	MyPageDAO mypageDao;

	@Override
	public UserVO userInfo(int uidx) {
		
		return mypageDao.userInfo(uidx);
	}

	@Override
	public int userModify(UserVO vo) {
		
		int result = mypageDao.userModify(vo);
		
		return result;
	}

}
