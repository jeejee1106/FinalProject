package data.comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentService {
	@Autowired
	CommentMapper commentMapper;
	
	public void insert_comment(CommentDTO commentDTO) {
		System.out.println(commentDTO.getWriter());
		System.out.println(commentDTO.getContent());
		System.out.println(commentDTO.getPnum());
		commentMapper.insert_comment(commentDTO);
	}
	public int select_maxNum() {
		return commentMapper.select_maxNum();
	};
	public void change_hierarchy(int grp, int grph) {
		commentMapper.change_hierarchy(grp, grph);
	};
	
	public List<CommentDTO> get_comment_list(){
		List<CommentDTO> list = commentMapper.get_comment_list();
		return list;
	}
	public void update_parent(String parent, String num) {
		commentMapper.update_parent(parent, num);
	}
	public void update_comment(String content, String num) {
		commentMapper.update_comment(content, num);
	}
	public void delete_comment(String num) {
		commentMapper.delete_comment(num);
	}
	public void delete_branch_comment(String idx) {
		commentMapper.delete_branch_comment(idx);
	}
	public void rest_fix() {
		commentMapper.rest_fix();
	}
	public void fix_comment(String num) {
		commentMapper.fix_comment(num);
	}
	public void cancel_fix(String num) {
		commentMapper.cancel_fix(num);
	}
	
}
