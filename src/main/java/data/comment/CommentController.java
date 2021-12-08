package data.comment;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	
	
	
	
	@ResponseBody
	@PostMapping("/comment/insert")
	public void insert(CommentDTO commentDTO) {
//		System.out.println("댓글등록" + commentDTO.getContent());
//		System.out.println("프로젝트넘버" + commentDTO.getPnum());
//		System.out.println("태스트"+commentDTO.getWriter());
//		System.out.println("태스트"+memberService.getAll(commentDTO.getWriter()).getPhoto());
		commentDTO.setGrp(commentService.getMaxNum()+1);
		commentService.insertComment(commentDTO);
		 
	}
	
	@ResponseBody
	@PostMapping("/comment/reply")
	public void reply(CommentDTO commentDTO) {
		int fixCheck = commentService.checkFix(String.valueOf(commentDTO.getGrp()));
		System.out.println("fixchekc"+fixCheck);
		commentService.changeHierarchy(commentDTO.getGrp(), commentDTO.getGrph());
		commentDTO.setGrph(commentDTO.getGrph()+1);
		commentDTO.setGrps(commentDTO.getGrps()+1);
		if (fixCheck > 0) {
			commentDTO.setFix(1);
		}
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
	public void delete(String num, String grp, String grph, String tempdel, HttpSession session) {
		System.out.println("num"+num+"grp"+grp+"grph"+grph+"tempDel"+tempdel);
		int grpCount = commentService.countGrp(grp);
		if(Integer.parseInt(grph) == 0) {
			if(grpCount == 1){
				commentService.deleteBranchComment(grp);
			}
			if(Integer.parseInt(tempdel) == 0) {
				commentService.deleteTemp(num);
			}
		}else {
			commentService.deleteComment(num);
			grpCount = commentService.countGrp(grp);
			if(grpCount == 1){
				commentService.deleteBranchComment(grp);
			}
		}
	}
	@ResponseBody
	@PostMapping("/comment/update")
	public void delete(String num, String comment) {
		commentService.updateComment(comment, num);
	}
	
	@ResponseBody
	@PostMapping("/comment/fix")
	public void fix(String grp) {
		commentService.resetFix();
		commentService.fixComment(grp);
	}
	@ResponseBody
	@PostMapping("/comment/cancelFix")
	public void cancelFix(String grp) {
		commentService.cancelFix(grp);
	}
	
}
