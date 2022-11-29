package DBPKG;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import VO.MoneyVO;
import VO.UserVO;
import oracle.net.aso.p;

public class DAO {
	Connection conn =null;
	PreparedStatement pstmt =null;
	
	//sql문 ;(세미콜론) 없는지 확인 !!!
	
	//연결 시 필요한 코드(문제지)
	public static Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","oracle");
		return con;
	}
	
	//신규회원번호
	public String selectNewCustno() throws Exception {
		String custno = "";
		try {
			conn = getConnection();
			String sql = "SELECT MAX(CUSTNO)+1 AS CUSTNO, sysdate FROM member_tbl_02";
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			rs.next(); //next는 하나의 결과물
			custno = rs.getString("CUSTNO");
			conn.close();
			pstmt.close();
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return custno;
	}
	
	//회원목록조회
	public List selectAllUser() throws Exception{
		List userList = new ArrayList();
		try {
			conn = getConnection();
			String sql = "SELECT * FROM member_tbl_02";
			pstmt=conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				UserVO userVO = new UserVO();
				userVO.setCustno(rs.getInt("CUSTNO"));
				userVO.setCustname(rs.getString("CUSTNAME"));
				userVO.setPhone(rs.getString("PHONE"));
				userVO.setAddress(rs.getString("ADDRESS"));
				userVO.setJoindate(rs.getDate("JOINDATE"));
				userVO.setGrade(rs.getString("GRADE"));
				userVO.setCity(rs.getString("CITY"));
				
				userList.add(userVO);
			}
			conn.close();
			pstmt.close();
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userList;
	}
	
	//매출목록조회
	public List selectAllCost() throws Exception{
		List userList = new ArrayList();
		try {
			conn = getConnection();
			String sql = "SELECT M.custno, U.custname, U.grade, SUM(price) price"
						+" FROM  money_tbl_02 M, member_tbl_02 U WHERE M.custno = U.custno(+)"
						+" GROUP BY M.custno, U.custname, U.grade "
						+" ORDER BY price DESC";
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				MoneyVO moneyVO = new MoneyVO();
				moneyVO.setCustno(rs.getInt("CUSTNO"));
				moneyVO.setCustname(rs.getString("CUSTNAME"));
				moneyVO.setGrade(rs.getString("GRADE"));
				moneyVO.setPrice(rs.getInt("PRICE"));
				
				userList.add(moneyVO);
			}
			conn.close();
			pstmt.close();
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userList;
	}
	
	//회원등록
	public int insertUser(UserVO userVO) throws Exception{
		int result = 0;
		try {
			conn = getConnection();
			String sql = "INSERT INTO member_tbl_02 VALUES(?,?,?,?,sysdate,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userVO.getCustno());
			pstmt.setString(2, userVO.getCustname());
			pstmt.setString(3, userVO.getPhone());
			pstmt.setString(4, userVO.getAddress());
			pstmt.setString(5, userVO.getGrade());
			pstmt.setString(6, userVO.getCity());
			result = pstmt.executeUpdate();
			
			conn.close();
			pstmt.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//회원번호로 회원1명조회
	public UserVO selectUserBycustNo(int custno) throws Exception{
		UserVO userVO = new UserVO();
		try {
			conn = getConnection();
			String sql = "SELECT * FROM member_tbl_02 WHERE custno = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,custno);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			
			userVO.setCustno(custno);
			userVO.setCustname(rs.getString("CUSTNAME"));
			userVO.setPhone(rs.getString("PHONE"));
			userVO.setAddress(rs.getString("ADDRESS"));
			userVO.setJoindate(rs.getDate("JOINDATE"));
			userVO.setGrade(rs.getString("GRADE"));
			userVO.setCity(rs.getString("CITY"));
			
			conn.close();
			pstmt.close();
			rs.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userVO;
	}
	
	//회원수정
	public int updateUser(UserVO userVO) throws Exception{
		int result = 0;
		try {
			conn = getConnection();
			String sql = "UPDATE member_tbl_02 SET CUSTNAME= ?, PHONE= ?, ADDRESS= ?, GRADE= ?, CITY= ? WHERE CUSTNO= ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userVO.getCustname());
			pstmt.setString(2, userVO.getPhone());
			pstmt.setString(3, userVO.getAddress());
			pstmt.setString(4, userVO.getGrade());
			pstmt.setString(5, userVO.getCity());
			pstmt.setInt(6, userVO.getCustno());
			result = pstmt.executeUpdate();
			
			conn.close();
			pstmt.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
		
}
