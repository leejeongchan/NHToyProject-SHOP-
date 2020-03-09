

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.service.LoginServiceImpl;

/*
 * 맴버 삭제 Ajax
 */
@WebServlet("/DeleteMemberAjax")
public class DeleteMemberAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;

	LoginServiceImpl loginService = LoginServiceImpl.getInstance();
	
    public DeleteMemberAjax() {
        super();
    }

	
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String userId = request.getParameter("userID");
		System.out.println("userId: "+userId);
		try {
			loginService.deleteMember(userId);
			response.getWriter().write(1+"");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
