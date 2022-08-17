package three.people.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import three.people.dao.CommonDAO;
import three.people.vo.SearchVO;
import three.people.vo.UserVO;

@Service
public class CommonServiceImpl implements CommonService {

	@Autowired
	CommonDAO commonDAO;
	
	@Override
	public int totalCountUser(SearchVO searchvo) {
		return commonDAO.totalCountUser(searchvo);
	}

	@Override
	public UserVO userInfoByUidx(int uidx) {
		return commonDAO.userInfoByUidx(uidx);
	}

	@Override
	public UserVO snsIdCheck(UserVO userVO) {
		return commonDAO.snsIdCheck(userVO);
	}

	@Override
	public int insertSnsUser(UserVO userVO) {
		return commonDAO.insertSnsUser(userVO);
	}

}
