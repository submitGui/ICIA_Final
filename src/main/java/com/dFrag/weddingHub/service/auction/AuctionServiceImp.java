package com.dFrag.weddingHub.service.auction;

import java.io.IOException;
import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.dFrag.weddingHub.model.auction.dao.AuctionDAO;
import com.dFrag.weddingHub.model.auction.dto.AuctionDTO;

@Service
public class AuctionServiceImp implements AuctionService {

	@Inject
	AuctionDAO auctionDAO;
	
	private ModelAndView mav;
	
	
	@Override
	public ModelAndView insertAuction(AuctionDTO auction,HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		mav = new ModelAndView();
		
		int result = auctionDAO.insertAuction(auction);
		
		if(result == 0) {
			out.println("<script>");
			out.println("alert('경매 입찰에 실패하셨습니다.')");
			out.println("</script>");
		}else {
			// 경매 입찰 정보가 정상적으로 삽입되면 포인트를 차감함
			auctionDAO.minusPoint(auction);
			out.println("<script>");
			out.println("alert('경매 입찰하였습니다.')");
			out.println("</script>");
		mav.addObject(auction);
		mav.setViewName("/shop/product_list");
		}
		return mav;
	}

	@Override
	public AuctionDTO view(int product_id) {
		return auctionDAO.view(product_id);
	}
}