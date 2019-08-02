package net.hb.crud;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Repository
@Component
public class MemberDAO {
	
	@Autowired
	SqlSessionTemplate temp;
	
	public void membDBInsert(BoardDTO dto){
		temp.insert("member.add", dto);
	}
	
	public int emailCheck(String email) {
		int cnt = 0;
		cnt = temp.selectOne("member.selectEmail", email);
		return cnt;
	}
	
}//class END
