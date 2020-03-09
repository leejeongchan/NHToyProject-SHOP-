

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import shop.service.GoodsService;

/*
 * 상품 추천 Ajax 처리
 */
@WebServlet("/RecommandAjax")
public class RecommandAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
    GoodsService goodsService = GoodsService.getInstance();
    int count;
  
    public RecommandAjax() {
        super();
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		System.out.println("recommandAjax 들어옴...");
		int gdsNum = Integer.parseInt(request.getParameter("gdsNum"));
		HttpSession session = request.getSession(true);
		String userId = (String)session.getAttribute("userId");
		if(userId==null) {
			response.getWriter().write(-1+"");
			return;
		}
		try {
			count = goodsService.recommand(gdsNum);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.getWriter().write(count+"");
	}

}
