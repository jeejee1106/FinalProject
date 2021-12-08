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
		for(CommentDTO dto: list)
		{
			System.out.println(dto.getTempdel()+"temp");
			System.out.println(dto.getFix() +"f");
		}
		return list;
	}
	public void updateParentComment(String parent, String num) {
		commentMapper.updateParentComment(parent, num);
	}
	public void updateComment(String content, String num) {
		commentMapper.updateComment(content, num);
	}
	//글삭제
	public void deleteComment(String num) {
		commentMapper.deleteComment(num);
	}
	public void deleteBranchComment(String idx) {
		commentMapper.deleteBranchComment(idx);
	}
	public void deleteTemp(String num) {
		commentMapper.deleteTemp(num);
	}
	public int countGrp(String grp) {
		return commentMapper.countGrp(grp);
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
