package data.comment;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import data.member.MemberMapper;

@Controller
public class CommentController {
	@Autowired
	CommentService commentService;
	
	@ResponseBody
	@PostMapping("/comment/insert")
	public void insert(CommentDTO commentDTO) {
		System.out.println("댓글등록" + commentDTO.getContent());
		System.out.println("프로젝트넘버" + commentDTO.getPnum());
		commentDTO.setGrp(commentService.select_maxNum()+1);
		commentService.insert_comment(commentDTO);
	}
	
	@ResponseBody
	@PostMapping("/comment/reply")
	public void reply(CommentDTO commentDTO) {
		commentService.change_hierarchy(commentDTO.getGrp(), commentDTO.getGrph());
		commentDTO.setGrph(commentDTO.getGrph()+1);
		commentDTO.setGrps(commentDTO.getGrps()+1);
		commentService.insert_comment(commentDTO);
		int num = commentService.select_maxNum();
		commentService.update_parent(commentDTO.getParent(), String.valueOf(num));
	}
	
	@ResponseBody
	@GetMapping("/comment/list")
	public List<CommentDTO> list2(String num) {
		List<CommentDTO> list = commentService.get_comment_list(num);
		return list;
	}
	@ResponseBody
	@PostMapping("/comment/delete")
	public void delete(String num, String grp, String grph) {
		if(Integer.parseInt(grph) != 0) {
			commentService.delete_comment(num);
		}else {
			commentService.delete_branch_comment(grp);
		}
	}
	@ResponseBody
	@PostMapping("/comment/update")
	public void delete(String num, String comment) {
		commentService.update_comment(comment, num);
	}
	
	@ResponseBody
	@PostMapping("/comment/fix")
	public void fix(String num) {
		commentService.rest_fix();
		commentService.fix_comment(num);
	}
	@ResponseBody
	@PostMapping("/comment/cancelFix")
	public void cancelFix(String num) {
		commentService.cancel_fix(num);
	}
	
	//프로필완성시
//	@Autowired
//	MemberMapper memberMapper;
	
//	@ResponseBody
//	@PostMapping("/comment/insert")
//	public void insert2(CommentDTO commentDTO, HttpSession session) {
//		commentDTO.setProfile(memberMapper.getProfile(session.getAttribute("id")));
//		commentDTO.setGrp(commentService.select_maxNum()+1);
//		commentService.insert_comment(commentDTO);
//	}
//	
//	@ResponseBody
//	@PostMapping("/comment/reply")
//	public void reply2(CommentDTO commentDTO, HttpSession session) {
//		commentService.change_hierarchy(commentDTO.getGrp(), commentDTO.getGrph());
//		commentDTO.setGrph(commentDTO.getGrph()+1);
//		commentDTO.setGrps(commentDTO.getGrps()+1);
//		commentDTO.setProfile(memberMapper.getProfile(session.getAttribute("id")));
//		commentService.insert_comment(commentDTO);
//		int num = commentService.select_maxNum();
//		commentService.update_parent(commentDTO.getParent(), String.valueOf(num));
//	}
}