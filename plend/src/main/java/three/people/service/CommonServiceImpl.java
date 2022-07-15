package three.people.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import three.people.dao.CommonDAO;
import three.people.vo.SearchVO;

@Service
public class CommonServiceImpl implements CommonService {

	@Autowired
	CommonDAO commonDAO;
	
	@Override
	public int totalCountUser(SearchVO searchvo) {
		return commonDAO.totalCountUser(searchvo);
	}

}
