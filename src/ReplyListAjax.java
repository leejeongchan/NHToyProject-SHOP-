
import java.io.IOException;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import shop.model.GoodsReplyVO;
import shop.service.ReplyService;
/*
 * 댓글 목록 Ajax 처리 goodsView.jsp에서 replyList() 자바스크립트 함수 내 이 서블릿으로 호출한다.
 * Json형태로 goodsView.jsp로 보내주고 json으로 목록을 보여준다.
 */
@WebServlet("/ReplyListAjax")
public class ReplyListAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ReplyService replyService = ReplyService.getInstance();
	List<GoodsReplyVO> list;
	int gdsNum;

	public ReplyListAjax() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		System.out.println("ReplyListAjax 들어옴...");
		gdsNum = Integer.parseInt(request.getParameter("gdsNum"));
		
		response.getWriter().write(getJSON());

	}

	public String getJSON() {

		// [1] 먼저 list를 DB에서 뽑아온다
		try {
			list = replyService.replyList(gdsNum);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (list.isEmpty())
			return null;
		// [2] 그리고 json 을 담을 객체를 만들어준다.
		JSONObject jsonObject = new JSONObject();
		// [3] 객체 내부에 들어갈 json 배열을 만들어준다.
		JSONArray jsonArray = new JSONArray();
		// [4] json 객체를 매핑시키기 위한 VO 객체
		GoodsReplyVO vo = null;
		// [5] 루프를 돌려 list에 담긴 데이터를 VO에 담는다
		for (int i = 0; i < list.size(); i++) {
			vo = (GoodsReplyVO) list.get(i);

			// [1] JSON 내부에 담길 JSON 객체
			JSONObject innerJsonObject = new JSONObject();
			innerJsonObject.put("repNum", vo.getRepNum());
			innerJsonObject.put("gdsNum", vo.getGdsNum());
			innerJsonObject.put("userId",vo.getUserId());
			innerJsonObject.put("repContent",vo.getRepContent());
			innerJsonObject.put("repReg",vo.getRepReg());


			jsonArray.add(innerJsonObject);

		}

		jsonObject.put("vo", jsonArray);

		System.out.println(jsonObject);

		return jsonObject.toJSONString();

		
	}

}
