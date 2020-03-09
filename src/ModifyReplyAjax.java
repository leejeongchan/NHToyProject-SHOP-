

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import shop.service.ReplyService;

/*
 * 댓글 수정 Ajax 처리
 */
@WebServlet("/ModifyReplyAjax")
public class ModifyReplyAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	ReplyService replyService = ReplyService.getInstance();
	
    
    public ModifyReplyAjax() {
        super();
    }

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String dbUserId = null;
		HttpSession session = request.getSession(true);
		String sessionUserId = (String)session.getAttribute("userId");
		//넘어온 repNum, repContent
		int repNum = Integer.parseInt(request.getParameter("repNum"));
		String repContent = request.getParameter("repContent");
		
		//댓글 수정과 자신의 댓글인지 판단
		try {
			dbUserId = replyService.deleteIdChk(repNum);
			//자신의 댓글이면 수정하고 뷰단에 1을 넘김
			if(sessionUserId.equals(dbUserId)) {
				replyService.modifyReply(repNum, repContent);
				response.getWriter().write(1+"");
			}else { //자신의 댓글이 아니면
				response.getWriter().write(0+"");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
