

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import shop.service.ReplyService;

/*
 * 댓글 삭제 Ajax 처리
 */
@WebServlet("/DeleteReplyAjax")
public class DeleteReplyAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	ReplyService replyService = ReplyService.getInstance();
	
    public DeleteReplyAjax() {
        super();
    }

	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String dbUserId = null;
		HttpSession session = request.getSession(true);
		String sessionUserId = (String)session.getAttribute("userId");
		int repNum = Integer.parseInt(request.getParameter("repNum"));
		//댓글 삭제와 자신의 댓글인지 판단
		try {
			dbUserId = replyService.deleteIdChk(repNum);
			//자신의 댓글이면 삭제하고 뷰단에 1을 넘김
			if(sessionUserId.equals(dbUserId)) {
				replyService.deleteReply(repNum);
				response.getWriter().write(1+"");
			}else { //자신의 댓글이 아니면
				response.getWriter().write(0+"");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
