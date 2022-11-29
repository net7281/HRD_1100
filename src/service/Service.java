package service;

import java.util.List;

import VO.UserVO;
import DBPKG.DAO;

public class Service {
	DAO dao;
	
	public Service(){
		dao = new DAO();
	}
	
	//신규회원번호
	public String newCustno() throws Exception {
		String custno = dao.selectNewCustno();
		return custno;
	}
	
	//회원목록조회
	public List UserList() throws Exception {
		List userList = dao.selectAllUser();
		return userList;
	}
	
	//매출목록조회
	public List MoneyList() throws Exception {
		List moneyList = dao.selectAllCost();
		return moneyList;
	}
	
	//회원등록
	public int addUser(UserVO userVO) throws Exception {
		int result = dao.insertUser(userVO);
		return result;
	}
	
	//회원1명조회
	public UserVO userBycustNo(int custno) throws Exception{
		UserVO userVO = dao.selectUserBycustNo(custno);
		return userVO;
	}
	
	//회원수정
	public int modUser(UserVO userVO) throws Exception {
		int result = dao.updateUser(userVO);
		return result;
	}
	
}
