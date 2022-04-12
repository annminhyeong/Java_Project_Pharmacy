package poly.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import poly.dto.DocNoticeDTO;
import poly.dto.DocReviewDTO;
import poly.dto.PagingDTO;
import poly.dto.SearchDTO;
import poly.service.IDocReviewService;

@Controller
public class DocReviewController {
	private Logger log = Logger.getLogger(this.getClass()); 
	
	@Resource(name="DocReviewService")
	private IDocReviewService docreviewservice;
	
	
	// 검색 기능
	@RequestMapping(value = "project/reviewTest")
	public String reviewTest(HttpServletRequest request, HttpServletResponse response, ModelMap model,
			@RequestParam(defaultValue = "1") int curPage) throws Exception {

		log.info(this.getClass().getName() + "reviewTest start");

		String searchType = request.getParameter("searchType");
		String keyword = request.getParameter("keyword");

		log.info("sDTOsearchType:  " + searchType);
		log.info("sDTOkeyword:  " + keyword);

		SearchDTO sDTO = new SearchDTO();
		sDTO.setSearchType(searchType);
		sDTO.setKeyword(keyword);

		int listCnt = docreviewservice.AllReviewDataSearch(sDTO);

		log.info("listCnt:  " + listCnt);
		log.info("curPage:  " + curPage);

		PagingDTO pagination = new PagingDTO(listCnt, curPage);

		int startIndex = pagination.getStartIndex();
		int endIndex = pagination.getEndIndex();

		log.info("startIndex:  " + startIndex);
		log.info("endIndex:  " + endIndex);

		log.info("bDTOsearchType:  " + searchType);
		log.info("bDTOkeyword:  " + keyword);

		DocReviewDTO pDTO = new DocReviewDTO();
		pDTO.setStartIndex(startIndex);
		pDTO.setEndIndex(endIndex);
		pDTO.setSearchType(searchType);
		pDTO.setKeyword(keyword);

		List<DocReviewDTO> rList = docreviewservice.getReviewListSearch(pDTO);

		if (rList == null) {
			rList = new ArrayList<DocReviewDTO>();
		}else {
	         for(int i=0; i<rList.size();i++) {
		            BoardFilter(rList.get(i));
		         }
		}
		
		// 죄회된 결과값 넣어줌
		model.addAttribute("rList", rList);
		model.addAttribute("listCnt", listCnt);
		model.addAttribute("pagination", pagination);

		// 변수 초기화
		rList = null;

		log.info(this.getClass().getName() + ".reviewTest end!");

		return "/project/review/ReviewList";

	}
	
	
	
	
	
	
	//글등록
	@RequestMapping(value="project/review/ReviewReg")
	public String ReviewReg() {
		log.info("ReviewReg start");
		return "/project/review/ReviewReg";
	}
	
	//글등록 기능
	@RequestMapping(value="project/review/ReviewRegProc")
	public String ReviewRegProc(HttpServletRequest request, Model model, HttpSession session)throws Exception {
		log.info("ReviewRegProc start");
		
		try {
			
		int res =0;
		//결과값
		String review_title = request.getParameter("review_title");
		String review_content = request.getParameter("review_content");
		String review_writer = (String) session.getAttribute("SS_ID");
		String verify = (String) session.getAttribute("SS_VERIFY");
		
		log.info("review_title: "+ review_title);
		log.info("review_content: "+ review_content);
		log.info("review_writer: "+ review_writer);
		log.info("verify: "+ verify);
		
		DocReviewDTO pDTO = new DocReviewDTO();
		pDTO.setReview_title(review_title);
		pDTO.setReview_content(review_content);
		pDTO.setReview_writer(review_writer);
		pDTO.setVerify(verify);
		
		res = docreviewservice.insertReviewInfo(pDTO);
		
		if(res>0) {
			model.addAttribute("url","/project/review/ReviewList.do");
			model.addAttribute("msg","등록 되었습니다.");
		}else {
			model.addAttribute("url","/project/review/ReviewList.do");
			model.addAttribute("msg","등록 실패했습니다.");
		}
		
		
		
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			
		}
		return "/project/notice/redirect";
	}
	
	
	//리뷰 리스트
	@RequestMapping(value="project/review/ReviewList")
	public String ReviewList(Model model,@RequestParam(defaultValue="1")int curPage) throws Exception {
		log.info("ReviewList start");
		
		try {
			
			int listCnt = docreviewservice.AllReviewData();
			log.info("listCnt:  " + listCnt);
			log.info("curPage:  " + curPage);
			
			PagingDTO pagination = new PagingDTO(listCnt, curPage);
			
			int startIndex = pagination.getStartIndex();
			int endIndex = pagination.getEndIndex();
			
			DocReviewDTO pDTO = new DocReviewDTO();
			pDTO.setStartIndex(startIndex);
			pDTO.setEndIndex(endIndex);
			
			
			log.info("startIndex:  " + startIndex);
			log.info("endIndex:  " + endIndex);

			
			
			List<DocReviewDTO> rList = docreviewservice.getReviewList(pDTO);
			
			if(rList ==null) {
				rList = new ArrayList<DocReviewDTO>();
			}else {
		         for(int i=0; i<rList.size();i++) {
			            BoardFilter(rList.get(i));
			         }
			}
			
			model.addAttribute("listCnt", listCnt);
			model.addAttribute("pagination", pagination);
			model.addAttribute("rList",rList);
			rList = null;
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			log.info("성공");
		}
		
		
		
		return "/project/review/ReviewList";
	}
	
	
	//글상세
	@RequestMapping(value="project/review/ReviewDetail")
	public String ReviewDetail(ServletRequest request, Model model, HttpSession session) throws Exception {
		log.info("ReviewDetail start");
		
		String review_no = request.getParameter("review_no");
		log.info("review_no: "+review_no);
		
		DocReviewDTO pDTO = new DocReviewDTO();
		
		
		
		pDTO = docreviewservice.getReviewDetail(review_no);
		
		String SS_VERIFY = (String) session.getAttribute("SS_VERIFY");
		String SS_ID = (String) session.getAttribute("SS_ID");
		String review_writer = (String) pDTO.getReview_writer();
		
		log.info("SS_VERIFY: "+SS_VERIFY);
		log.info("SS_ID: "+SS_ID);
		log.info("review_writer: "+review_writer);
		
		if(SS_VERIFY.equals("1")) {
			model.addAttribute("res","1");
			log.info("관리자 리뷰");
		}else if(SS_ID.equals(review_writer)) {
			model.addAttribute("res","2");
			log.info("작성자만 리뷰");
		}else {
			model.addAttribute("res","3");
			log.info("작성자 아님");
		}
		
		
		BoardFilter(pDTO);
		
		
		
		if(pDTO != null) {
			model.addAttribute("pDTO",pDTO);
		}
		
		int result = docreviewservice.updateREviewCount(review_no);
		
		if(result >0) {
			log.info("조회수 증가 성공");
			
		}else {
			log.info("조회수 증가 실패");
		}
		
		pDTO = null;
		
		
		
		return "/project/review/ReviewDetail";
	}
	
	//리뷰 수정
	@RequestMapping(value="project/review/ReviewUpdate")
	public String ReviewUpdate(ServletRequest request,Model model)throws Exception {
		log.info("ReviewUpdate start");
		
		String review_no = request.getParameter("review_no");
		
		DocReviewDTO pDTO = docreviewservice.getReviewDetail(review_no);
		
		if(pDTO == null) {
			pDTO = new DocReviewDTO();
		}else {
			BoardFilter(pDTO);
		}
		model.addAttribute("pDTO",pDTO);
		
		pDTO = null;
		
		
		return "/project/review/ReviewUpdate";
	}

	//리뷰 수정 기능
	@RequestMapping(value="project/review/ReviewUpdateProc")
	public String ReviewUpdateProc(ServletRequest request, Model model, HttpSession session) throws Exception {
		log.info("ReviewUpdateProc start");
		try {
			
		
		int res =0;
		
		String review_no = request.getParameter("review_no");
		String review_title = request.getParameter("review_title");
		String review_content = request.getParameter("review_content");
		String review_writer = (String) session.getAttribute("SS_ID");
		
		log.info("review_no: "+review_no);
		log.info("review_title: "+review_title);
		log.info("review_content: "+review_content);
		log.info("review_writer: "+review_writer);
		
		DocReviewDTO pDTO = new DocReviewDTO();
		
		pDTO.setReview_no(review_no);
		pDTO.setReview_title(review_title);
		pDTO.setReview_content(review_content);
		pDTO.setReview_writer(review_writer);
		
		res = docreviewservice.updateReview(pDTO);
		pDTO= null;
		
		if(res>0) {
			log.info("성공");
			model.addAttribute("pDTO",pDTO);
			model.addAttribute("url","/project/review/ReviewList.do");
			model.addAttribute("msg","수정 되었습니다.");
			
		}
		else {
			model.addAttribute("url","/project/review/ReviewList.do");
			model.addAttribute("msg","수정 실패했습니다.");
		}
		}catch (Exception e) {
			e.printStackTrace();
		
		}finally {
			
		}
		
		
		return "/project/notice/redirect";
	}
	
	//리뷰 삭제
	@RequestMapping(value="project/review/ReviewDelete")
	public String ReviewDelete(ServletRequest request, Model model, HttpSession session) throws Exception {
		
		log.info("ReviewDelete start");
				
		DocReviewDTO pDTO = new DocReviewDTO();
		
		int res=0;
		
		String review_no= request.getParameter("review_no");
		String review_writer = (String) session.getAttribute("SS_ID");
		String verify = (String) session.getAttribute("SS_VERIFY");
		
		log.info("review_no: "+review_no);
		log.info("review_writer: "+review_writer);
		log.info("verify: "+verify);
		
		pDTO.setReview_no(review_no);
		pDTO.setReview_writer(review_writer);
		pDTO.setVerify(verify);
		
		res = docreviewservice.deleteReview(pDTO);
		
		if(res>0) {

			model.addAttribute("url","/project/review/ReviewList.do");
			model.addAttribute("msg","삭제 되었습니다.");
		}else {
			model.addAttribute("url","/project/review/ReviewList.do");
			model.addAttribute("msg","삭제 실패했습니다.");
		}
		
		
		return "/project/notice/redirect";
	}
	
	
	public DocReviewDTO BoardFilter(DocReviewDTO pDTO) {
	      pDTO.setReview_title(pDTO.getReview_title().replaceAll("& lt;","&lt;" ).replaceAll("& gt;", "&gt;"));
	      pDTO.setReview_title(pDTO.getReview_title().replaceAll("& #40;","\\(" ).replaceAll("& #41;", "\\)"));
	      pDTO.setReview_title(pDTO.getReview_title().replaceAll("& #39;","'" ));
	      pDTO.setReview_title(pDTO.getReview_title().replaceAll("& #256;","script" ));
	      if(pDTO.getReview_content()!=null) {
	         pDTO.setReview_content(pDTO.getReview_content().replaceAll("& lt;","<" ).replaceAll("& gt;", ">"));
	         pDTO.setReview_content(pDTO.getReview_content().replaceAll("& #40;","\\(" ).replaceAll("& #41;", "\\)"));
	         pDTO.setReview_content(pDTO.getReview_content().replaceAll("& #39;","'" ));
	         pDTO.setReview_content(pDTO.getReview_content().replaceAll("& #256;","script" ));
	      }
	      return pDTO;
	   }
	

	
	
	
	
}
