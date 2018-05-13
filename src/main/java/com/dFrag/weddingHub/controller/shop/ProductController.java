package com.dFrag.weddingHub.controller.shop;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.dFrag.weddingHub.model.auction.dto.AuctionDTO;
import com.dFrag.weddingHub.model.member.dto.MemberDTO;
import com.dFrag.weddingHub.model.shop.dto.ProductDTO;
import com.dFrag.weddingHub.service.auction.AuctionService;
import com.dFrag.weddingHub.service.board.Pager;
import com.dFrag.weddingHub.service.member.MemberService;
import com.dFrag.weddingHub.service.shop.ProductService;

@Controller // 현재 클래스를 스프링에서 관리하는 컨트롤러빈으로
@SessionAttributes("userid")
@RequestMapping("shop/product/*") // 공통적인 url pattern
public class ProductController {

	@Inject // 의존관계 주입
	ProductService productService;
	@Inject
	AuctionService auctionService;
	@Inject
	MemberService memberService;
	// /edit/32 => 상품코드가 PathVariable에 저장됨
	/*@InitBinder
	public void InitBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		binder.registerCustomEditor(String.class,"product_Start",new BirthDatePropertyEditor());
		binder.registerCustomEditor(String.class,"product_end",new BirthDatePropertyEditor());
	}*/

	@RequestMapping("delete.do")
	public String delete(@RequestParam int product_id) {
		// 첨부파일 삭제
		String filename = productService.fileInfo(product_id);
		System.out.println("첨부파일 이름:" + filename);
		if (filename != null && !filename.equals("-")) {
			String path = "D:\\Spring_Workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\180508_WeddingHub_Function\\WEB-INF\\views\\images\\"; // 상품이미지 디렉토리
			File f = new File(path + filename);
			System.out.println("파일존재여부:" + f.exists());
			if (f.exists()) { // 파일이 존재하면
				f.delete(); // 파일 삭제
				System.out.println("삭제되었습니다.");
			}
		}
		// 레코드 삭제
		productService.deleteProduct(product_id);
		// 화면 이동
		return "redirect:/shop/product/list.do";
	}

	// 상품정보 수정
	@RequestMapping("update.do")
	public String update(ProductDTO dto) {
		String filename = "-";
		// 새로운 첨부 파일이 있으면
		if (!dto.getFile1().isEmpty()) {
			// 첨부 파일의 이름
			filename = dto.getFile1().getOriginalFilename();
			try {
				String path = "D:\\Spring_Workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\180508_WeddingHub_Function\\WEB-INF\\views\\images\\";
				// 디렉토리가 존재하지 않으면 생성
				new File(path).mkdir();
				// 임시 디렉토리에 저장된 첨부파일을 이동
				dto.getFile1().transferTo(new File(path + filename));
			} catch (Exception e) {
				e.printStackTrace();
			}
			dto.setPicture_url(filename);
		} else { // 새로운 첨부 파일이 없을 때
			// 기존에 첨부한 파일 정보를 가져옴
			ProductDTO dto2 = productService.detailProduct(dto.getProduct_id());
			dto.setPicture_url(dto2.getPicture_url());
		}
		// 상품정보 수정
		productService.updateProduct(dto);
		return "redirect:/shop/product/list.do";
	}

	@RequestMapping("edit/{product_id}")
	public ModelAndView edit(@PathVariable("product_id") int product_id, ModelAndView mav) {
		// 이동할 뷰의 이름
		mav.setViewName("shop/product_edit");
		// 뷰에 전달할 데이터 저장
		mav.addObject("dto", productService.detailProduct(product_id));
		return mav;
	}
	
	@RequestMapping("insert.do")
	public String insert(@ModelAttribute ProductDTO dto, BindingResult result) {
		System.out.println(dto.getProduct_Start());
		System.out.println(dto.getProduct_end());
		String filename = "-";
		// 첨부 파일이 있으면
		if (!dto.getFile1().isEmpty()) {
			// 첨부 파일의 이름
			filename = dto.getFile1().getOriginalFilename();
			try {
				// 개발 디렉토리
				// String path=
				// "D:\\work\\spring02\\src\\main\\webapp\\WEB-INF\\views\\images\\"; //업로드할
				// 디렉토리
				// 배포 디렉토리
				String path = "D:\\Spring_Workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\180508_WeddingHub_Function\\WEB-INF\\views\\images\\";
				// 디렉토리가 존재하지 않으면 생성
				new File(path).mkdir();
				// 임시 디렉토리에 저장된 첨부파일을 이동
				dto.getFile1().transferTo(new File(path + filename));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		dto.setPicture_url(filename);
		productService.insertProduct(dto);
		return "redirect:/shop/product/list.do";
	}

	@RequestMapping("write.do")
	public String write() {
		// views/shop/product_write.jsp로 이동
		return "shop/product_write";
	}

	@RequestMapping("list.do") // 세부적인 url pattern
	public ModelAndView list(
			@RequestParam(defaultValue="product_name") String search_option,
			@RequestParam(defaultValue="") String keyword,
			@RequestParam(defaultValue="1") int curPage) {
		//레코드 갯수 계산
		int count = productService.countArticle(search_option,keyword);
		//페이지 관련 설정
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end= pager.getPageEnd();
		// 포워딩할 뷰의 경로
		// 전달할 데이터
		List<ProductDTO> list = 
		productService.listProduct(search_option,keyword,start,end);
		ModelAndView mav = new ModelAndView();
		HashMap<String,Object> map= new HashMap<>();
		map.put("list", list);
		map.put("pager", pager);
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		map.put("count", count);
		mav.setViewName("/shop/product_list");
		mav.addObject("map", map);
		return mav;
	}

	// http://localhost/spring02/shop/product/detail/5
	// 상품코드가 {producd_id}에 전달됨
	@RequestMapping("detail/{product_id}")
	public ModelAndView detail(@PathVariable("product_id") int product_id, 
			ModelAndView mav) {
		// 포워딩할 뷰의 이름
		mav.setViewName("/shop/product_detail");
		// 뷰에 전달할 데이터
		mav.addObject("dto", productService.detailProduct(product_id));
		mav.addObject("auction", auctionService.view(product_id));
		return mav;
	}
	
	/* 이하 경매 관련 */
	//경매입찰 팝업 호출시 기업게시판 상세 페이지에서 값 전달
	@RequestMapping(value="Auction.do" , method = RequestMethod.GET)
	public String Auction(@RequestParam("userid")String userid,
			@RequestParam("product_id")int product_id,
			@RequestParam("price")int price, 
			@RequestParam("member_point")int member_point, 
			@RequestParam("mypoint")int mypoint ) {
		ProductDTO dto = new ProductDTO();
		AuctionDTO auction = new AuctionDTO();
		MemberDTO member = new MemberDTO();
		
		dto.setProduct_id(product_id);
		dto.setPrice(price);
		auction.setMember_point(member_point);
		member.setMember_point(mypoint);
		
		return "shop/Auction";
	}
	
	//경매입찰 팝업에서 데이터 전송시 사용
	@RequestMapping(value="insertAuction.do", method = RequestMethod.POST)
	public ModelAndView insertAuction(ModelAndView mav,			
			@RequestParam("product_id")int product_id,
			@RequestParam("userid")String userid,
			@RequestParam("member_point")int member_point,
			HttpServletResponse response) throws IOException {
	AuctionDTO auction = new AuctionDTO();
	auction.setProduct_id(product_id);
	auction.setMember_point(member_point);
	auction.setUserid(userid);
	 mav = auctionService.insertAuction(auction, response);
	return mav;
	}
}

