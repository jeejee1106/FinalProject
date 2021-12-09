package data.comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentService {
	@Autowired
	CommentMapper commentMapper;
	
	public void insertComment(CommentDTO commentDTO) {
		commentMapper.insertComment(commentDTO);
	}
	public int getMaxNum() {
		return commentMapper.getMaxNum();
	};
	public int changeHierarchy(int grp) {
		return commentMapper.changeHierarchy(grp);
	};
	
	public List<CommentDTO> getCommentList(String num){
		List<CommentDTO> list = commentMapper.getCommentList(num);
		return list;
	}
	public void updateParentComment(String parent, String num) {
		commentMapper.updateParentComment(parent, num);
	}
	public void updateComment(String content, String num) {
		commentMapper.updateComment(content, num);
	}
	//글삭제
	public void deleteComment(int num) {
		commentMapper.deleteComment(num);
	}
	public void deleteBranchComment(int idx) {
		commentMapper.deleteBranchComment(idx);
	}
	public void deleteTemp(int num) {
		commentMapper.deleteTemp(num);
	}
	public int countGrp(int grp) {
		return commentMapper.countGrp(grp);
	}
	public int countTempdel(int grp) {
		return commentMapper.countTempdel(grp);
	}
	public void resetFix() {
		commentMapper.resetFix();
	}
	public void fixComment(String grp) {
		commentMapper.fixComment(grp);
	}
	public void cancelFix(String grp) {
		commentMapper.cancelFix(grp);
	}
	public int checkFix(String grp) {
		return commentMapper.checkFix(grp);
	}
}
