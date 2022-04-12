package poly.persistance.mapper;

import java.util.List;

import config.Mapper;
import poly.dto.DocReviewDTO;
import poly.dto.SearchDTO;

@Mapper("DocReviewMapper")
public interface DocReviewMapper {
	
	

	
	//리뷰 리스트
	List<DocReviewDTO> getReviewList(DocReviewDTO pDTO) throws Exception;
	
	//리뷰 글 등록
	int insertReviewInfo(DocReviewDTO pDTO) throws Exception;
	
	//리뷰 상세
	DocReviewDTO getReviewDetail(String review_no) throws Exception;
	
	//리뷰 수정
	int updateReview(DocReviewDTO pDTO) throws Exception;
	
	//리뷰 삭제
	int deleteReview(DocReviewDTO pDTO) throws Exception;
	
	//리뷰 조회수
	int deleteReviewCount(String review_no) throws Exception;
	
	//리뷰 리스트 개수
	int AllReviewData() throws Exception;
	
	//리뷰 리스트 검색
	List<DocReviewDTO> getReviewListSearch(DocReviewDTO pDTO) throws Exception;
	
	//리뷰 리스트 개수 검색
	int AllReviewDataSearch(SearchDTO sDTO) throws Exception;

}
