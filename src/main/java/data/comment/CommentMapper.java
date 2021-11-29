package data.comment;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CommentMapper {
	public void insertComment(CommentDTO CMDTO);
	public int getMaxNum();
	public List<CommentDTO> getCommentList(String num);
	public void changeHierarchy(int grp, int grph);
	public void updateComment(String content, String num);
	public void updateParentComment(String parent, String num);
	public void deleteComment(String num);
	public void deleteBranchComment(String idx);
	public void resetFix();
	public void fixComment(String num);
	public void cancelFix(String num);
}
