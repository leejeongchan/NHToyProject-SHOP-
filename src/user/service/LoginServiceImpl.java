package user.service;


import user.dao.LoginDao;
import user.model.UserVO;

import java.util.List;

import encrypt.SHA256;
/*
 * 로그인 서비스 Dao와 연관
 */
public class LoginServiceImpl{
	
	private static LoginServiceImpl loginService = new LoginServiceImpl();
	public static LoginServiceImpl getInstance() {
		return loginService;
	}
	//회원가입 시 중복체크
	public int IdChk(String userId) throws Exception{
		// TODO Auto-generated method stub
		return LoginDao.getInstance().IdChk(userId);
	}
	
	//회원가입 서비스
	public void register(UserVO user) throws Exception {
		LoginDao.getInstance().register(user);
	}
	
	//로그인
	public UserVO login(String userId,String userPwd) throws Exception{
		System.out.println("loginService userPwd: "+userPwd);
		UserVO user = null;
		//DB에 해당 아이디로 정보 조회해서 가져오기
		user = LoginDao.getInstance().login(userId);
		//user에는 현재 아이디 정보를 가져온다.
		if(user==null) {
			return null;
		}
		//받은 평문 비밀번호를 DB에 저장된 암호화 비번과 같은지 비교
		String encPwd = SHA256.getSHA256(userPwd);
		System.out.println("encPwd: "+encPwd+" userDBPwd: "+user.getUserPwd());
		if(!encPwd.equals(user.getUserPwd())) {
			return null;
		}
		return user;
	}
	
	//회원 정보 리스트 
	public List<UserVO> userList() throws Exception{
		return LoginDao.getInstance().userList();
	}
	
	//회원 삭제
	public void deleteMember(String userId) throws Exception{
		LoginDao.getInstance().deleteMember(userId);
	}
	
	//회원 승급
	public void AdminMember(String userId) throws Exception{
		LoginDao.getInstance().adminMember(userId);
	}
}
