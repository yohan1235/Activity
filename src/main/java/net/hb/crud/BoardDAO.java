package net.hb.crud;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Repository
@Component
public class BoardDAO {
	
	@Autowired
	SqlSessionTemplate temp;
		
	public void boaDBInsert(BoardDTO dto) {
		System.out.println("DAO");
		System.out.println(dto.bNum);
		System.out.println(dto.cNum);
		System.out.println(dto.mNum);
		System.out.println(dto.bTitle);
		System.out.println(dto.startDate);
		System.out.println(dto.endDate);
		System.out.println(dto.startTime);
		System.out.println(dto.endTime);
		System.out.println(dto.person);
		System.out.println(dto.preText);
		System.out.println(dto.mainText);
		System.out.println(dto.img);
		temp.insert("board.add", dto);
	}
	
}//class END
