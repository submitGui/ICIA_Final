package com.dFrag.weddingHub.model.auction.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dFrag.weddingHub.model.auction.dto.AuctionDTO;


@Repository
public class AuctionDAOImp implements AuctionDAO {

	@Inject
	SqlSession sqlSession;
	
	/*경매 입찰시 입찰자 정보 기록*/
	@Override
	public int insertAuction(AuctionDTO auction) {
		return sqlSession.insert("Auction.insertAuction", auction);
	}

	/*입찰 정보 조회*/
	@Override
	public AuctionDTO view(int product_id) {
		return sqlSession.selectOne("Auction.auctionview", product_id);
	}
	
	/*경매 입찰시 포인트 차감*/
	@Override
	public void minusPoint(AuctionDTO auction) {
		sqlSession.update("Auction.minusPoint", auction);
	}

}
