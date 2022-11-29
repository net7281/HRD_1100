package controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import VO.UserVO;
import service.Service;
import DBPKG.DAO;

/**
 * Servlet implementation class Controller
 */
@WebServlet("/")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public Controller() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    Service service;
    
	public void init(ServletConfig config) throws ServletException {
		//호출 시 dao 호출
		service = new Service();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandel(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandel(request,response);
	}
	
	protected void doHandel(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nextPage = "";
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		//getPathInfo()가 안되서 대안
		String uri = request.getRequestURI();
		String action = uri.substring(uri.lastIndexOf("/"));
		System.out.println(action);
		
		try {
			//시작페이지
			if(action == null || action.equals("/home")){
				nextPage = "index.jsp";
			}
			
			//회원정보등록페이지
			else if(action.equals("/signUser")){
				String custno = service.newCustno();
				request.setAttribute("custno", custno);
				
				//오늘날짜 출력용 >> 등록은 sql에서 sysdate로~
				LocalDate date = LocalDate.now();
				String sysdate = "" + date.getYear() + date.getMonthValue() + date.getDayOfMonth();
				request.setAttribute("today", sysdate);
				
				nextPage="signUser.jsp";
			}
			
			//회원리스트
			else if(action.equals("/userList")){
				List userList = service.UserList();
				request.setAttribute("userList", userList);
				nextPage="userList.jsp";
			}
			
			//회원매출조회
			else if(action.equals("/moneyList")){
				List moneyList = service.MoneyList();
				request.setAttribute("moneyList", moneyList);
				nextPage="moneyList.jsp";
			}
			
			//회원등록
			else if (action.equals("/addUser")) {
				String custno = request.getParameter("custno");
				String custname = request.getParameter("custName");
				String phone = request.getParameter("phone");
				String address = request.getParameter("address");
				String grade = request.getParameter("grade");
				String city = request.getParameter("city");
				
				UserVO userVO = new UserVO(Integer.parseInt(custno), custname, phone, address ,grade, city);
				
				int result = service.addUser(userVO);
				nextPage="/userList";
			}
			
			//회원수정페이지
			else if (action.equals("/modUser")) {
				int custno = Integer.parseInt(request.getParameter("custno"));
				
				UserVO userVO = service.userBycustNo(custno);
				request.setAttribute("user", userVO);
				
				nextPage="modUser.jsp";
			}
			
			//회원수정
			else if (action.equals("/updateUser")) {
				String custno = request.getParameter("custno");
				String custname = request.getParameter("custName");
				String phone = request.getParameter("phone");
				String address = request.getParameter("address");
				String grade = request.getParameter("grade");
				String city = request.getParameter("city");
				
				UserVO userVO = new UserVO(Integer.parseInt(custno), custname, phone, address ,grade, city);
				
				int result = service.modUser(userVO);
				nextPage="/userList";
			}
			
			
			
			RequestDispatcher dispatcher = request.getRequestDispatcher(nextPage);
			dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
