package com.dFrag.weddingHub.model.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dFrag.weddingHub.model.board.dto.BoardDTO;

@Repository // dao bean
public class BoardDAOImpl implements BoardDAO {

	@Inject //의존관계 주입(Dependency Injection, DI)
	SqlSession sqlSession;
	
//첨부파일 레코드 삭제	
	@Override
	public void deleteFile(String fullName) {
		sqlSession.delete("board.deleteFile", fullName); 
	}
//첨부파일 리스트
	@Override
	public List<String> getAttach(int bno) {
		return sqlSession.selectList("board.getAttach", bno); 
	}

	@Override
	public void addAttach(String fullName) {
		sqlSession.insert("board.addAttach", fullName); 
	}
//첨부파일 정보 수정
	@Override
	public void updateAttach(String fullName, int bno) {
		Map<String,Object> map=new HashMap<>();
		map.put("fullName", fullName); //첨부파일 이름
		map.put("bno", bno); //게시물 번호
		sqlSession.insert("board.updateAttach", map); 
	}

	@Override
	public void create(BoardDTO dto) throws Exception {
		sqlSession.insert("board.insert", dto); 
	}

	@Override
	public void delete(int bno) throws Exception {
		sqlSession.delete("board.delete", bno); 
	}
	
//게시물 목록 리턴
	@Override
	public List<BoardDTO> listAll(
String search_option, String keyword,int start, int end) 
				throws Exception {
		Map<String,Object> map=new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", "%"+keyword+"%");
		map.put("start", start); //맵에 자료 저장
		map.put("end", end);
// mapper에는 2개 이상의 값을 전달할 수 없음(dto 또는 map 사용)		
		return sqlSession.selectList("board.listAll",map); 
	}
//조회수 증가 처리
	@Override
	public void increateViewcnt(int bno) throws Exception {
		sqlSession.update("board.increaseViewcnt", bno);
	}
//레코드 갯수 계산 
	@Override
	public int countArticle(
			String search_option, String keyword) throws Exception {
		Map<String,String> map=new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", "%"+keyword+"%");
		return sqlSession.selectOne("board.countArticle",map);
	}
//게시물 조회
	@Override
	public BoardDTO read(int bno) throws Exception {
		return sqlSession.selectOne("board.read", bno); 
	}
//레코드 수정	
	@Override
	public void update(BoardDTO dto) throws Exception {
		sqlSession.update("board.update", dto); 
	}

}










