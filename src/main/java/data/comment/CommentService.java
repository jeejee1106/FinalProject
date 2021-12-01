package data.comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentService {
	@Autowired
	CommentMapper commentMapper;
	
	public void insertComment(CommentDTO commentDTO) {
		System.out.println(commentDTO.getWriter());
		System.out.println(commentDTO.getContent());
		System.out.println(commentDTO.getPnum());
		commentMapper.insertComment(commentDTO);
	}
	public int getMaxNum() {
		return commentMapper.getMaxNum();
	};
	public void changeHierarchy(int grp, int grph) {
		commentMapper.changeHierarchy(grp, grph);
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
	public void deleteComment(String num) {
		commentMapper.deleteComment(num);
	}
	public void deleteBranchComment(String idx) {
		commentMapper.deleteBranchComment(idx);
	}
	public void deleteChildComment(String grp, String grph) {
		commentMapper.deleteChildComment(grp, grph);
	}
	public void resetFix() {
		commentMapper.resetFix();
	}
	public void fixComment(String num) {
		commentMapper.fixComment(num);
	}
	public void cancelFix(String num) {
		commentMapper.cancelFix(num);
	}
	
}
