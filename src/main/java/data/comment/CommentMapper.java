package data.comment;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CommentMapper {
	public void insertComment(CommentDTO CMDTO);
	public int getMaxNum();
	public List<CommentDTO> getCommentList(String num);
	public int changeHierarchy(int grp);
	public void updateComment(String content, String num);
	public void updateParentComment(String parent, String num);
	//댓글삭제
	public void deleteComment(int num);
	public void deleteBranchComment(int num);
	public void deleteTemp(int num);
	public int countGrp(int grp);
	public int countTempdel(int grp);
	
	//고정
	public void resetFix();
	public void fixComment(String grp);
	public void cancelFix(String grp);
	public int checkFix(String grp);
}
