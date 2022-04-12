package poly.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.DocReviewDTO;
import poly.dto.SearchDTO;
import poly.persistance.mapper.DocReviewMapper;
import poly.service.IDocReviewService;

@Service("DocReviewService")
public class DocReviewService implements IDocReviewService {
	
	@Resource(name="DocReviewMapper")
	private DocReviewMapper docreviewmapper;
	
	
	//라뷰 등록
	@Override
	public int insertReviewInfo(DocReviewDTO pDTO) throws Exception {
		
		return docreviewmapper.insertReviewInfo(pDTO);
	}

	
	
	//리뷰 리스트
	@Override
	public List<DocReviewDTO> getReviewList(DocReviewDTO pDTO) throws Exception {
		
		return docreviewmapper.getReviewList(pDTO);
	}


	//리뷰 상세
	@Override
	public DocReviewDTO getReviewDetail(String review_no) throws Exception {
		
		return docreviewmapper.getReviewDetail(review_no);
	}


	//리뷰 수정
	@Override
	public int updateReview(DocReviewDTO pDTO) throws Exception {
		
		return docreviewmapper.updateReview(pDTO);
	}


	//리뷰 삭제
	@Override
	public int deleteReview(DocReviewDTO pDTO) throws Exception {
		
		return docreviewmapper.deleteReview(pDTO);
	}


	//리뷰 조회수
	@Override
	public int updateREviewCount(String review_no) throws Exception{
		// TODO Auto-generated method stub
		return docreviewmapper.deleteReviewCount(review_no);
	}


	//리뷰 리스트 개수
	@Override
	public int AllReviewData() throws Exception {

		return docreviewmapper.AllReviewData();
	}


	//리뷰 리스트 검색
	@Override
	public List<DocReviewDTO> getReviewListSearch(DocReviewDTO pDTO) throws Exception {

		return docreviewmapper.getReviewListSearch(pDTO);
	}


	//리뷰 리스트 개수 검색
	@Override
	public int AllReviewDataSearch(SearchDTO sDTO) throws Exception {

		return docreviewmapper.AllReviewDataSearch(sDTO);
	}




	

}
