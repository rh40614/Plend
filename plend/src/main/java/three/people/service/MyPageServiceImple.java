package three.people.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import three.people.dao.MyPageDAO;

@Service
public class MyPageServiceImple implements MyPageService{
	
	@Autowired
	MyPageDAO mypageDao;

}
