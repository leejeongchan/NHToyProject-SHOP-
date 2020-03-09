

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.service.CartService;

/*
 * 카트 삭제 버튼 클릭 시 ajax로 카트 번호가 넘어옴
 */
@WebServlet("/CartDeleteAjax")
public class CartDeleteAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
    CartService cartService = CartService.getInstance();
    
    
    public CartDeleteAjax() {
        super();
        // TODO Auto-generated constructor stub
    }





	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int cartNum = Integer.parseInt(request.getParameter("cartNum"));
		try {
			cartService.cartDelete(cartNum);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			
			e.printStackTrace();
		}
		response.getWriter().write(1+"");
	}

}
