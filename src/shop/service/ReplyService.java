package shop.service;

import java.util.List;

import shop.dao.ReplyDao;
import shop.model.GoodsReplyVO;

public class ReplyService {
	private static ReplyService replyService = new ReplyService();
	
	public static ReplyService getInstance() {
		return replyService;
	}
	//댓글 삽입 서비스
	public void reply(GoodsReplyVO reply) throws Exception{
		ReplyDao.getInstance().reply(reply);
	}
	
	//댓글 리스트
	public List<GoodsReplyVO> replyList(int gdsNum) throws Exception{
		return ReplyDao.getInstance().replyList(gdsNum);
	}
	
	//댓글 삭제
	public void deleteReply(int repNum) throws Exception{
		ReplyDao.getInstance().deleteReply(repNum);
	}
	//댓글 삭제시 자신의 댓글인지 확인
	public String deleteIdChk(int repNum) throws Exception{
		return ReplyDao.getInstance().deleteIdChk(repNum);
	}
	
	//댓글 수정
	public void modifyReply(int repNum,String repContent) throws Exception{
		ReplyDao.getInstance().modifyReply(repNum,repContent);
	}
}
