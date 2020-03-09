

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.service.OrderService;


@WebServlet("/orderConfirmAjax")
public class orderConfirmAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	OrderService orderService = OrderService.getInstance();
	
    public orderConfirmAjax() {
        super();
    }



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String orderId = request.getParameter("orderId");
		try {
			orderService.orderConfirm(orderId);
			response.getWriter().write(1+"");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
