package net.hb.crud;

import java.io.File;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletContext;

import org.omg.CORBA.Request;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	ServletContext application;

	@Autowired
	@Inject
	MemberDAO dao;
	//BoardService service; // 저장성공 전체출력 서비스주석처리후 dao직접접근

	//회원가입페이지이동
	@RequestMapping(value = "/signUp.do", method = RequestMethod.GET)
	public String board_write() {
		return "WEB-INF/views/signUp.jsp";
	}// end
	
	//회원가입 DB저장
	@RequestMapping("/insertMember.do")
	public String member_insert(BoardDTO dto) {
		dao.membDBInsert(dto); // 서비스 영역대신 직접 다오로 연결
		return "redirect:/list.do";
	}// end
	
	
	@ResponseBody
    @RequestMapping(value="/emailCheck.do", method=RequestMethod.POST)
		public int emailCheck(@RequestParam String email){
			int result = 0;
			result = dao.emailCheck(email);
			return result;
		}	
	

	
//	@RequestMapping("/list.do")
//	public ModelAndView board_select() {
//		System.out.println("list.do 접근^^");
//		ModelAndView mav = new ModelAndView();
//		List<BoardDTO> LG = dao.dbSelect();
//		int tot_data = dao.dbCount();
//		mav.addObject("LG", LG);
//		mav.addObject("tot_data", tot_data);
//		mav.setViewName("WEB-INF/views/boardList.jsp");
//		return mav;
//	}
//	
//	@RequestMapping("/detail.do")
//	public String board_detail(@RequestParam("id") int id, Model model) {
//		System.out.println("detail.do접근");
//		System.out.println(id);
//		BoardDTO dto = dao.dbSelect(id);
//		model.addAttribute("dto", dto);
//		return "WEB-INF/views/boardDetail.jsp";
//	}
//	
//	@RequestMapping("/preDetail.do")
//	public String board_preDetail(@RequestParam("id") int id, Model model) {
//		System.out.println("preDetail.do접근");
//		BoardDTO dto = dao.dbSelect(id);
//		model.addAttribute("dto", dto);
//		return "WEB-INF/views/boardUpdate.jsp";
//	}
//	
//	@RequestMapping("/update.do")
//	public String board_update(BoardDTO dto) {
//		String path = application.getRealPath("/resources/upload");
//		// 넘어온 파일 물리적파일화 File클래스
//		String img = dto.getImg_f().getOriginalFilename();
//		File file = new File(path, img); // 파일화후 인코딩
//		
//		try {
//			dto.getImg_f().transferTo(file);
//		} catch (Exception e) {
//			System.out.println("컨트롤 파일실패:" + e);
//		}
//		dto.setImg(img);
//		
//		dao.dbUpdate(dto);
//		return "redirect:/detail.do?id="+ dto.getMNum();
//	}
//	
//	
//	
//	@RequestMapping("/delete.do")
//	public String board_delete(@RequestParam("id") int id, Model model) {
//		System.out.println("delete.do접근");
//		System.out.println(id);
//		dao.dbDelete(id);
//		return "redirect:/list.do";
//	}
}// BoardController class END
