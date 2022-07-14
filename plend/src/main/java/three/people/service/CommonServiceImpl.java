package three.people.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import three.people.dao.CommonDAO;

@Service
public class CommonServiceImpl implements CommonService {

	@Autowired
	CommonDAO commonDAO;
	
	@Override
	public int totalCountUser(int role) {
		return commonDAO.totalCountUser(role);
	}

}
