

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import shop.model.CartVO;
import shop.service.GoodsService;
/*
 * 장바구니 담기 버튼을 goodsView.jsp에서 클릭 시 ajax로 서블릿 호출 상품번호와 카트수량이 json으로 넘어옴
 */
@WebServlet("/addCartAjax")
public class addCartAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	//서비스
	GoodsService goodsService = GoodsService.getInstance();

    public addCartAjax() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		CartVO cart = new CartVO();
		HttpSession session = request.getSession(true);
		int result = 0;
		int gdsNum = Integer.parseInt(request.getParameter("gdsNum"));
		int cartStock = Integer.parseInt(request.getParameter("cartStock"));
		String userId =(String) session.getAttribute("userId");
		System.out.println("gdsNum: "+gdsNum+" cartStock: "+cartStock+" userId: "+userId);
		if(userId !=null ) {
			cart.setGdsNum(gdsNum);
			cart.setCartStock(cartStock);
			cart.setUserId(userId);
			try {
				goodsService.addCart(cart);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			result = 1;
		}
		
		response.getWriter().write(result+"");
	}

}
