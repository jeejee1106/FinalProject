package data.comment;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CommentMapper {
	public void insert_comment(CommentDTO CMDTO);
	public int select_maxNum();
	public List<CommentDTO> get_comment_list(String num);
	public void change_hierarchy(int grp, int grph);
	public void update_parent(String parent, String num);
	public void update_comment(String content, String num);
	public void delete_comment(String num);
	public void delete_branch_comment(String idx);
	public void rest_fix();
	public void fix_comment(String num);
	public void cancel_fix(String num);
}
