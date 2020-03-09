

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import shop.model.GoodsReplyVO;
import shop.service.ReplyService;

/*
 * 댓글 등록 Ajax 처리
 */
@WebServlet("/RegisterReplyAjax")
public class RegisterReplyAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
    ReplyService replyService = ReplyService.getInstance();
    

    public RegisterReplyAjax() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		GoodsReplyVO reply = new GoodsReplyVO();
		HttpSession session = request.getSession(true);
		String userId = (String)session.getAttribute("userId");
		int gdsNum = Integer.parseInt(request.getParameter("gdsNum"));
		String repContent = request.getParameter("repContent");
		reply.setGdsNum(gdsNum);
		reply.setRepContent(repContent);
		reply.setUserId(userId);
		try {
			replyService.reply(reply);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.getWriter().write("1"+"");
	}

}
