package com.dFrag.weddingHub.model.auction.dao;

import com.dFrag.weddingHub.model.auction.dto.AuctionDTO;

public interface AuctionDAO {

	public int insertAuction(AuctionDTO auction);
	public AuctionDTO view(int product_id);
	public void minusPoint(AuctionDTO auction);
}