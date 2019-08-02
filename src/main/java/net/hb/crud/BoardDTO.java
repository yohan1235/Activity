package net.hb.crud;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;


@Data // lombok
public class BoardDTO { //테이블 필드이름과 동일하게 

	//memb테이블
	int mNum, phone; //회원번호, 전화번호
	String email, pwd, nick; //이메일(아이디), 비밀번호, 닉네임
	
	//cate테이블
	int cNum; //카테고리코드
	String cName;//카테고리이름
	
	//rep테이블
	int rNum; //댓글번호
	String rText; //댓글내용
	Date rDate; //댓글작성날짜
	
	//boa테이블
	int bNum, person, viewCnt; //게시글번호, 모집인원, 조회수
	String  bTitle, startTime, endTime, preText, mainText, img, place, detailPlace; //제목, 시작-끝 날짜 및 시간, 간단내용, 상세내용, 이미지이름, 장소;
	Date startDate, endDate;
	String startD, endD; //날짜변환
	MultipartFile img_f; //이미지파일
	
	
	
	

	
}//class END
