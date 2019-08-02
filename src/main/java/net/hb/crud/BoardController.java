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
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	@Autowired
	ServletContext application;

	@Autowired
	@Inject
	BoardDAO dao;
	//BoardService service; // ���强�� ��ü��� �����ּ�ó���� dao��������
	
	//Ȩ������ �̵�
	@RequestMapping("/home.do")
	public String home() {
		return "WEB-INF/views/home.jsp";
	}// end

	//���Ӱ��� �������̵�
	@RequestMapping("/boardWrite.do")
	public String signUp() {
		return "WEB-INF/views/boardWrite.jsp";
	}// end
	

	
	
	//���Ӱ��� ó��
	@RequestMapping("/insertBoard.do")
	public String board_insert(BoardDTO dto) {
		
		String path = application.getRealPath("/resources/upload");
		System.out.println(path);
		// �Ѿ�� ���� ����������ȭ FileŬ����
		String img = dto.getImg_f().getOriginalFilename();
		File file = new File(path, img); // ����ȭ�� ���ڵ�
		
		try {
			dto.getImg_f().transferTo(file);
		} catch (Exception e) {
			System.out.println("��Ʈ�� ���Ͻ���:" + e);
		}
		DateFormat fmt = DateFormat.getDateInstance(DateFormat.SHORT);
		dto.setImg(img);	
		dto.setStartD(fmt.format(dto.startDate));
		dto.setEndD(fmt.format(dto.endDate));
		//service.service_Insert(dto);
		
		dao.boaDBInsert(dto); // ���� ������� ���� �ٿ��� ����
		return "WEB-INF/views/boardWrite.jsp";
	}// end
	
//	@RequestMapping("/boardList.do")
//	public ModelAndView board_select() {
//		System.out.println("list.do ����^^");
//		ModelAndView mav = new ModelAndView();
//		int pageNum = 0, pageCount = 0; //��������ȣ, ����������
//		int start = 0, end = 0; //����Ʈ����,��
//		int startPage = 0, endPage = 0; //����,�� ������
//		int temp = 0;
//		int gTotal = 0, sTotal = 0; //��ü, ��ȸ
//		
//		List<BoardDTO> LG = dao.dbSelect();
//		int tot_data = dao.dbCount();
//		mav.addObject("LG", LG);
//		mav.addObject("tot_data", tot_data);
//		mav.setViewName("WEB-INF/views/home.jsp");
//		return mav;
//	}
//	
//	@RequestMapping("/detail.do")
//	public String board_detail(@RequestParam("id") int id, Model model) {
//		System.out.println("detail.do����");
//		System.out.println(id);
//		BoardDTO dto = dao.dbSelect(id);
//		model.addAttribute("dto", dto);
//		return "WEB-INF/views/boardDetail.jsp";
//	}
//	
//	@RequestMapping("/preDetail.do")
//	public String board_preDetail(@RequestParam("id") int id, Model model) {
//		System.out.println("preDetail.do����");
//		BoardDTO dto = dao.dbSelect(id);
//		model.addAttribute("dto", dto);
//		return "WEB-INF/views/boardUpdate.jsp";
//	}
//	
//	@RequestMapping("/update.do")
//	public String board_update(BoardDTO dto) {
//		String path = application.getRealPath("/resources/upload");
//		// �Ѿ�� ���� ����������ȭ FileŬ����
//		String img = dto.getImg_f().getOriginalFilename();
//		File file = new File(path, img); // ����ȭ�� ���ڵ�
//		
//		try {
//			dto.getImg_f().transferTo(file);
//		} catch (Exception e) {
//			System.out.println("��Ʈ�� ���Ͻ���:" + e);
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
//		System.out.println("delete.do����");
//		System.out.println(id);
//		dao.dbDelete(id);
//		return "redirect:/list.do";
//	}
}// BoardController class END
