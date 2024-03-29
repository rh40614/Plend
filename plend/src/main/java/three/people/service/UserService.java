package three.people.service;

import three.people.vo.UserVO;

public interface UserService {

	int insertUser(UserVO vo);
	UserVO login(UserVO vo);
	UserVO searchID(UserVO vo);
	int idCheck(String id);
	int nickNameCheck(String nickName);
	UserVO selectID(UserVO vo);
	public int tempPwd(UserVO vo);
	public int selectPwd(UserVO vo);
}
