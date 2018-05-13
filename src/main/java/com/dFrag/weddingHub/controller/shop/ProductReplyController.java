package com.dFrag.weddingHub.controller.shop;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.dFrag.weddingHub.model.shop.dto.ProductReplyDTO;
import com.dFrag.weddingHub.service.board.Pager;
import com.dFrag.weddingHub.service.shop.ProductReplyService;

// @ResponseBody를 붙이지 않아도 뷰가 아닌 데이터 리턴 가능
@RestController // spring 4.0부터 사용 가능
@RequestMapping("Productreply/*") // 공통적인 url pattern
public class ProductReplyController {

	
	@Inject
	ProductReplyService replyService;
	@RequestMapping("list.do")
	public ModelAndView list(@RequestParam int product_id,
			@RequestParam(defaultValue="1") int curPage, 
			ModelAndView mav,HttpSession session) {
		//댓글의 갯수 계산
		int count=replyService.count(product_id);
		//페이징 처리 클래스
		Pager pager = new Pager(count, curPage);
		int start= pager.getPageBegin();//시작 레코드 번호
		int end= pager.getPageEnd();//끝 레코드 번호
		List<ProductReplyDTO> list = replyService.list(product_id, start, end, session); // 댓글 목록
		mav.setViewName("shop/productreply_list"); // 뷰의 이름
		mav.addObject("list", list); // 뷰에 전달할 데이터 저장
		mav.addObject("pager", pager);
		return mav; // 뷰로 이동
	}

	// 댓글 목록을 ArrayList로 리턴
	/*@RequestMapping("list_json.do")
	public List<ProductReplyDTO> list_json(int product_id) {
		return replyService.list(product_id);
	}*/

	@RequestMapping("insert.do") // 세부적인 url pattern
	public void insert(@ModelAttribute ProductReplyDTO dto, HttpSession session) {
		// 댓글 작성자 아이디
		String userid = (String) session.getAttribute("userid");
		dto.setReplyer(userid);
		System.out.println("controller"+dto);
		// 댓글이 테이블에 저장됨
		replyService.create(dto);
		// jsp 페이지로 가거나 데이터를 리턴하지 않음
	}
	@RequestMapping("productReplydelete.do")
	public ModelAndView delete (int rno, ModelAndView mav) {
		System.out.println("productReplydelete.do Call");
		//System.out.println("rno="+rno);
		 replyService.delete(rno);
		 mav.setViewName("redirect:/shop/product/list.do");
		return mav;
	}
}
