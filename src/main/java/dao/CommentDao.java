package dao;

import java.util.List;

import util.DaoHelper;
import vo.Comment;
import vo.Customer;

public class CommentDao {
	
	public void insertComment(Comment comment) {
		DaoHelper.update("commentDao.insertComment", 
				comment.getContent(), 
				comment.getCustomer().getId(), 
				comment.getBoard().getNo());
	}
	
	public List<Comment> getCommentByBoardNo(int boardNo) {
		return DaoHelper.selectList("commentDao.getCommentByBoardNo", rs -> {
			Comment comment = new Comment();
			comment.setNo(rs.getInt("comment_no"));
			comment.setContent(rs.getString("comment_content"));
			comment.setCreateDate(rs.getDate("comment_create_date"));
			Customer customer = new Customer();
			customer.setName(rs.getString("cust_name"));
			customer.setId(rs.getString("cust_id"));
			comment.setCustomer(customer);
			
			return comment;
		}, boardNo);
	}
	
	public void updateComment(Comment comment) {
		DaoHelper.update("commentDao.updateCommentByNo", comment.getContent(), comment.getNo());
	}
	
	public void deleteComment(int commentNo) {
		DaoHelper.update("commentDao.deleteCommentByNo", commentNo);
	}
}
