package poly.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import poly.dto.NoticeDTO;
import poly.service.INoticeService;
import poly.util.CmmUtil;

/*
 * Controller �꽑�뼵�빐�빞留� Spring �봽�젅�엫�썙�겕�뿉�꽌 Controller�씤吏� �씤�떇 媛��뒫
 * �옄諛� �꽌釉붾┸ �뿭�븷 �닔�뻾
 * */
@Controller
public class NoticeController {
	private Logger log = Logger.getLogger(this.getClass());
	
	/*
	 * 鍮꾩쫰�땲�뒪 濡쒖쭅(以묒슂 濡쒖쭅�쓣 �닔�뻾�븯湲� �쐞�빐 �궗�슜�릺�뒗 �꽌鍮꾩뒪瑜� 硫붾え由ъ뿉 �쟻�옱(�떛湲��넠�뙣�꽩 �쟻�슜�맖)
	 * */
	@Resource(name = "NoticeService")
	private INoticeService noticeService;
	
	/*
	 * �븿�닔紐� �쐞�쓽 value="notice/NoticeList" => /notice/NoticeList.do濡� �샇異쒕릺�뒗 url�� 臾댁“嫄� �씠 �븿�닔媛� �떎�뻾�맂�떎.
	 * method=RequestMethod.GET => �뤌 �쟾�넚諛⑸쾿�쓣 吏��젙�븯�뒗 寃껋쑝濡� get諛⑹떇�� GET, post諛⑹떇�� POST�씠�떎.
	 * method => 湲곗엯�븞�븯硫� GET, POST 紐⑤몢 媛��뒫�븯�굹, 媛�湲됱쟻 �쟻�뼱二쇰뒗 寃껋씠 醫뗫떎.
	 * */
	
	@RequestMapping(value="index")
	public String Index() {
		log.info(this.getClass());
		
		return "/index";
	}
	
	/**
	 * 寃뚯떆�뙋 由ъ뒪�듃 蹂댁뿬二쇨린
	 * */
	@RequestMapping(value="notice/NoticeList", method=RequestMethod.GET)
	public String NoticeList(HttpServletRequest request, HttpServletResponse response, 
			ModelMap model) throws Exception {
		
		//濡쒓렇 李띻린(異뷀썑 李띿� 濡쒓렇瑜� �넻�빐 �씠 �븿�닔�뿉 �젒洹쇳뻽�뒗吏� �뙆�븙�븯湲� �슜�씠�븯�떎.)
		log.info(this.getClass().getName() + ".NoticeList start!");
		
		//怨듭��궗�빆 由ъ뒪�듃 媛��졇�삤湲�
		List<NoticeDTO> rList = noticeService.getNoticeList();
		
		if (rList==null){
			rList = new ArrayList<NoticeDTO>();
			
		}
		
		//議고쉶�맂 由ъ뒪�듃 寃곌낵媛� �꽔�뼱二쇨린
		model.addAttribute("rList", rList);
		
		//蹂��닔 珥덇린�솕(硫붾え由� �슚�쑉�솕 �떆�궎湲� �쐞�빐 �궗�슜�븿)
		rList = null;
		
		//濡쒓렇 李띻린(異뷀썑 李띿� 濡쒓렇瑜� �넻�빐 �씠 �븿�닔 �샇異쒖씠 �걹�궗�뒗吏� �뙆�븙�븯湲� �슜�씠�븯�떎.)
		log.info(this.getClass().getName() + ".NoticeList end!");
		
		//�븿�닔 泥섎━媛� �걹�굹怨� 蹂댁뿬以� JSP �뙆�씪紐�(/WEB-INF/view/notice/NoticeList.jsp) 
		return "/notice/NoticeList";
	}
	
	/**
	 * 寃뚯떆�뙋 �옉�꽦 �럹�씠吏� �씠�룞
	 * 
	 * �씠 �븿�닔�뒗 寃뚯떆�뙋 �옉�꽦 �럹�씠吏�濡� �젒洹쇳븯湲� �쐞�빐 留뚮벉.
	 * WEB-INF 諛묒뿉 議댁옱�븯�뒗 JSP�뒗 吏곸젒 �샇異쒗븷 �닔 �뾾�쓬 
	 * �뵲�씪�꽌 WEB-INF 諛묒뿉 議댁옱�븯�뒗 JSP瑜� �샇異쒗븯湲� �쐞�빐�꽌�뒗 諛섎뱶�떆 Controller �벑濡앺빐�빞�븿
	 * */
	@RequestMapping(value="notice/NoticeReg", method=RequestMethod.GET)
	public String NoticeReg(HttpServletRequest request, HttpServletResponse response, 
			ModelMap model) throws Exception {
		
		log.info(this.getClass().getName() + ".NoticeReg start!");
		
		log.info(this.getClass().getName() + ".NoticeReg end!");
		
		return "/notice/NoticeReg";
	}
	
	
	/**
	 * 寃뚯떆�뙋 湲� �벑濡�
	 * */
	@RequestMapping(value="notice/NoticeInsert", method=RequestMethod.POST)
	public String NoticeInsert(HttpSession session, HttpServletRequest request, HttpServletResponse response, 
			ModelMap model) throws Exception {
		
		log.info(this.getClass().getName() + ".NoticeInsert start!");
		
		String msg = "";
		
		try{
			/*
			 * 寃뚯떆�뙋 湲� �벑濡앸릺湲� �쐞�빐 �궗�슜�릺�뒗 form媛앹껜�쓽 �븯�쐞 input 媛앹껜 �벑�쓣 諛쏆븘�삤湲� �쐞�빐 �궗�슜�븿
			 * */
			String user_id = CmmUtil.nvl((String)session.getAttribute("SESSION_USER_ID")); //�븘�씠�뵒
			String title = CmmUtil.nvl(request.getParameter("title")); //�젣紐�
			String noticeYn = CmmUtil.nvl(request.getParameter("noticeYn")); //怨듭�湲� �뿬遺�
			String contents = CmmUtil.nvl(request.getParameter("contents")); //�궡�슜
	
			/*
			 * #######################################################
			 * 	 諛섎뱶�떆, 媛믪쓣 諛쏆븯�쑝硫�, 瑗� 濡쒓렇瑜� 李띿뼱�꽌 媛믪씠 �젣��濡� �뱾�뼱�삤�뒗吏� �뙆�븙�빐�빞�븿
			 * 						諛섎뱶�떆 �옉�꽦�븷 寃�
			 * #######################################################
			 * */
			log.info("user_id : "+ user_id);
			log.info("title : "+ title);
			log.info("noticeYn : "+ noticeYn);
			log.info("contents : "+ contents);		
			
			NoticeDTO pDTO = new NoticeDTO();
			
			pDTO.setUser_id(user_id);
			pDTO.setTitle(title);
			pDTO.setNotice_yn(noticeYn);;
			pDTO.setContents(contents);
	
			
			/*
			 * 寃뚯떆湲� �벑濡앺븯湲곗쐞�븳 鍮꾩쫰�땲�뒪 濡쒖쭅�쓣 �샇異�
			 * */
			noticeService.InsertNoticeInfo(pDTO);

			
			//���옣�씠 �셿猷뚮릺硫� �궗�슜�옄�뿉寃� 蹂댁뿬以� 硫붿떆吏�
			msg = "�벑濡앸릺�뿀�뒿�땲�떎.";
			
			
			//蹂��닔 珥덇린�솕(硫붾え由� �슚�쑉�솕 �떆�궎湲� �쐞�빐 �궗�슜�븿)
			pDTO = null;
			
		}catch(Exception e){
			
			//���옣�씠 �떎�뙣�릺硫� �궗�슜�옄�뿉寃� 蹂댁뿬以� 硫붿떆吏�			
			msg = "�떎�뙣�븯���뒿�땲�떎. : "+ e.toString();
			log.info(e.toString());
			e.printStackTrace();
			
		}finally{
			log.info(this.getClass().getName() + ".NoticeInsert end!");
			
			//寃곌낵 硫붿떆吏� �쟾�떖�븯湲�
			model.addAttribute("msg", msg);
			
		}
		
		return "/notice/MsgToList";
	}	
	
	
	/**
	 * 寃뚯떆�뙋 �긽�꽭蹂닿린
	 * */
	@RequestMapping(value="notice/NoticeInfo", method=RequestMethod.GET)
	public String NoticeInfo(HttpServletRequest request, HttpServletResponse response, 
			ModelMap model) throws Exception {
		
		log.info(this.getClass().getName() + ".NoticeInfo start!");
		

		/*
		 * 寃뚯떆�뙋 湲� �벑濡앸릺湲� �쐞�빐 �궗�슜�릺�뒗 form媛앹껜�쓽 �븯�쐞 input 媛앹껜 �벑�쓣 諛쏆븘�삤湲� �쐞�빐 �궗�슜�븿
		 * */
		String nSeq = CmmUtil.nvl(request.getParameter("nSeq")); //怨듭�湲�踰덊샇(PK)

		/*
		 * #######################################################
		 * 	 諛섎뱶�떆, 媛믪쓣 諛쏆븯�쑝硫�, 瑗� 濡쒓렇瑜� 李띿뼱�꽌 媛믪씠 �젣��濡� �뱾�뼱�삤�뒗吏� �뙆�븙�빐�빞�븿
		 * 						諛섎뱶�떆 �옉�꽦�븷 寃�
		 * #######################################################
		 * */
		log.info("nSeq : "+ nSeq);
		
		
		/*
		 * 媛� �쟾�떖�� 諛섎뱶�떆 DTO 媛앹껜瑜� �씠�슜�빐�꽌 泥섎━�븿
		 * �쟾�떖 諛쏆� 媛믪쓣 DTO 媛앹껜�뿉 �꽔�뒗�떎.
		 * */		
		NoticeDTO pDTO = new NoticeDTO();

		
		pDTO.setNotice_seq(nSeq);;		
		
		//怨듭��궗�빆 湲� 議고쉶�닔 利앷�
		noticeService.updateNoticeReadCnt(pDTO);
		
		log.info("read_cnt update success!!!");
		
		//怨듭��궗�빆 �긽�꽭�젙蹂� 媛��졇�삤湲�
		NoticeDTO rDTO = noticeService.getNoticeInfo(pDTO);
		
		if (rDTO==null){
			rDTO = new NoticeDTO();
			
		}
		
		log.info("getNoticeInfo success!!!");
		
		//議고쉶�맂 由ъ뒪�듃 寃곌낵媛� �꽔�뼱二쇨린
		model.addAttribute("rDTO", rDTO);
		
		//蹂��닔 珥덇린�솕(硫붾え由� �슚�쑉�솕 �떆�궎湲� �쐞�빐 �궗�슜�븿)
		rDTO = null;
		pDTO = null;
		
		log.info(this.getClass().getName() + ".NoticeInfo end!");
		
		return "/notice/NoticeInfo";
	}
	
	
	/**
	 * 寃뚯떆�뙋 �닔�젙 蹂닿린
	 * */
	@RequestMapping(value="notice/NoticeEditInfo", method=RequestMethod.GET)
	public String NoticeEditInfo(HttpServletRequest request, HttpServletResponse response, 
			ModelMap model) throws Exception {
		
		log.info(this.getClass().getName() + ".NoticeEditInfo start!");
		
		
		String nSeq = CmmUtil.nvl(request.getParameter("nSeq")); //怨듭�湲�踰덊샇(PK)
		
		log.info("nSeq : "+ nSeq);
		
		
		NoticeDTO pDTO = new NoticeDTO();
		
		pDTO.setNotice_seq(nSeq);;		
		
		/*
		 * #######################################################
		 * 	怨듭��궗�빆 �닔�젙�젙蹂� 媛��졇�삤湲�(�긽�꽭蹂닿린 荑쇰━�� �룞�씪�븯�뿬, 媛숈� �꽌鍮꾩뒪 荑쇰━ �궗�슜�븿)
		 * #######################################################
		 */
		NoticeDTO rDTO = noticeService.getNoticeInfo(pDTO);
		
		if (rDTO==null){
			rDTO = new NoticeDTO();
			
		}
		
		//議고쉶�맂 由ъ뒪�듃 寃곌낵媛� �꽔�뼱二쇨린
		model.addAttribute("rDTO", rDTO);
		
		
		//蹂��닔 珥덇린�솕(硫붾え由� �슚�쑉�솕 �떆�궎湲� �쐞�빐 �궗�슜�븿)
		rDTO = null;
		pDTO = null;
		
		log.info(this.getClass().getName() + ".NoticeEditInfo end!");
		
		return "/notice/NoticeEditInfo";
	}
	
	
	/**
	 * 寃뚯떆�뙋 湲� �닔�젙
	 * */
	@RequestMapping(value="notice/NoticeUpdate", method=RequestMethod.POST)
	public String NoticeUpdate(HttpSession session, HttpServletRequest request, HttpServletResponse response, 
			ModelMap model) throws Exception {
		
		log.info(this.getClass().getName() + ".NoticeUpdate start!");
		
		String msg = "";
		
		try{
			
			String user_id = CmmUtil.nvl((String)session.getAttribute("SESSION_USER_ID")); //�븘�씠�뵒
			String nSeq = CmmUtil.nvl(request.getParameter("nSeq")); //湲�踰덊샇(PK)
			String title = CmmUtil.nvl(request.getParameter("title")); //�젣紐�
			String noticeYn = CmmUtil.nvl(request.getParameter("noticeYn")); //怨듭�湲� �뿬遺�
			String contents = CmmUtil.nvl(request.getParameter("contents")); //�궡�슜
	
			log.info("user_id : "+ user_id);
			log.info("nSeq : "+ nSeq);
			log.info("title : "+ title);
			log.info("noticeYn : "+ noticeYn);
			log.info("contents : "+ contents);		
			
			NoticeDTO pDTO = new NoticeDTO();
			
			pDTO.setUser_id(user_id);
			pDTO.setNotice_seq(nSeq);;
			pDTO.setTitle(title);
			pDTO.setNotice_yn(noticeYn);;
			pDTO.setContents(contents);
	
			//寃뚯떆湲� �닔�젙�븯湲� DB
			noticeService.updateNoticeInfo(pDTO);
			
			msg = "�닔�젙�릺�뿀�뒿�땲�떎.";
			
			//蹂��닔 珥덇린�솕(硫붾え由� �슚�쑉�솕 �떆�궎湲� �쐞�빐 �궗�슜�븿)
			pDTO = null;
			
		}catch(Exception e){
			msg = "�떎�뙣�븯���뒿�땲�떎. : "+ e.toString();
			log.info(e.toString());
			e.printStackTrace();
			
		}finally{
			log.info(this.getClass().getName() + ".NoticeUpdate end!");
			
			//寃곌낵 硫붿떆吏� �쟾�떖�븯湲�
			model.addAttribute("msg", msg);
			
		}
		
		return "/notice/MsgToList";
	}	
	
	
	/**
	 * 寃뚯떆�뙋 湲� �궘�젣
	 * */
	@RequestMapping(value="notice/NoticeDelete", method=RequestMethod.POST)
	public String NoticeDelete(HttpSession session, HttpServletRequest request, HttpServletResponse response, 
			ModelMap model) throws Exception {
		
		log.info(this.getClass().getName() + ".NoticeDelete start!");
		
		String msg = "";
		
		try{
			
			String nSeq = CmmUtil.nvl(request.getParameter("nSeq")); //湲�踰덊샇(PK)
			
			log.info("nSeq : "+ nSeq);
			
			NoticeDTO pDTO = new NoticeDTO();
			
			pDTO.setNotice_seq(nSeq);;
			
			//寃뚯떆湲� �궘�젣�븯湲� DB
			noticeService.deleteNoticeInfo(pDTO);;
			
			msg = "�궘�젣�릺�뿀�뒿�땲�떎.";
			
			//蹂��닔 珥덇린�솕(硫붾え由� �슚�쑉�솕 �떆�궎湲� �쐞�빐 �궗�슜�븿)
			pDTO = null;
			
		}catch(Exception e){
			msg = "�떎�뙣�븯���뒿�땲�떎. : "+ e.toString();
			log.info(e.toString());
			e.printStackTrace();
			
		}finally{
			log.info(this.getClass().getName() + ".NoticeDelete end!");
			
			//寃곌낵 硫붿떆吏� �쟾�떖�븯湲�
			model.addAttribute("msg", msg);
			
		}
		
		return "/notice/MsgToList";
	}	
			
}
