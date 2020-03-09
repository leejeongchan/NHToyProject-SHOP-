

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import user.service.LoginServiceImpl;

/*
 * 중복 확인 Ajax 처리
 */
@WebServlet("/UserRegisterCheckAjax")
public class UserRegisterCheckAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    
    public UserRegisterCheckAjax() {
        super();
        // TODO Auto-generated constructor stub
    }

    
	//Ajax로 로그인 중복구현시 여기로 넘어와서 해당 userId를 파라미터로 얻어와서 userDao의 idChk메소드로 넘겨준다. idChk에서 중복구현을 실시하고 Ajax호출 지점으로 값을 넘겨준다.
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String userId = request.getParameter("userId");
		System.out.println("Ajax userId: "+userId);
	
		try {
			response.getWriter().write(LoginServiceImpl.getInstance().IdChk(userId)+"");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
