package data.comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import data.member.MemberService;


@Controller
public class CommentController {
	@Autowired
	CommentService commentService;
	@Autowired
	MemberService memberService;
	
	@PostMapping("/comment/profile")
	public String moveToProfile(Model model, String id) {
		
		model.addAttribute("id",id);
		return "/profile/introduction";
	}
	
	
	
	@ResponseBody
	@PostMapping("/comment/insert")
	public void insert(CommentDTO commentDTO) {
//		System.out.println("댓글등록" + commentDTO.getContent());
//		System.out.println("프로젝트넘버" + commentDTO.getPnum());
//		System.out.println("태스트"+commentDTO.getWriter());
//		System.out.println("태스트"+memberService.getAll(commentDTO.getWriter()).getPhoto());
		commentDTO.setProfile(memberService.getAll(commentDTO.getWriter()).getPhoto()); 
		commentDTO.setGrp(commentService.getMaxNum()+1);
		commentService.insertComment(commentDTO);
		 
	}
	
	@ResponseBody
	@PostMapping("/comment/reply")
	public void reply(CommentDTO commentDTO) {
		commentService.changeHierarchy(commentDTO.getGrp(), commentDTO.getGrph());
		commentDTO.setGrph(commentDTO.getGrph()+1);
		commentDTO.setGrps(commentDTO.getGrps()+1);
		commentDTO.setProfile(memberService.getAll(commentDTO.getWriter()).getPhoto());
		commentService.insertComment(commentDTO);
		int num = commentService.getMaxNum();
		commentService.updateParentComment(commentDTO.getParent(), String.valueOf(num));
	}
	
	@ResponseBody
	@GetMapping("/comment/list")
	public List<CommentDTO> list2(String num) {
		List<CommentDTO> list = commentService.getCommentList(num);
		return list;
	}
	@ResponseBody
	@PostMapping("/comment/delete")
	public void delete(String num, String grp, String grph) {
		if(Integer.parseInt(grph) != 0) {
			commentService.deleteComment(num);
		}else {
			commentService.deleteBranchComment(grp);
		}
	}
	@ResponseBody
	@PostMapping("/comment/update")
	public void delete(String num, String comment) {
		commentService.updateComment(comment, num);
	}
	
	@ResponseBody
	@PostMapping("/comment/fix")
	public void fix(String num) {
		commentService.resetFix();
		commentService.fixComment(num);
	}
	@ResponseBody
	@PostMapping("/comment/cancelFix")
	public void cancelFix(String num) {
		commentService.cancelFix(num);
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
