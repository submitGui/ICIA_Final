package com.dFrag.weddingHub.service.auction;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;

import com.dFrag.weddingHub.model.auction.dto.AuctionDTO;

public interface AuctionService {
	
	public ModelAndView insertAuction(AuctionDTO auction,HttpServletResponse response)throws IOException;
	public AuctionDTO view(int product_id);

}
