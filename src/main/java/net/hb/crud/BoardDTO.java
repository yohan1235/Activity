package net.hb.crud;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;


@Data // lombok
public class BoardDTO { //���̺� �ʵ��̸��� �����ϰ� 

	//memb���̺�
	int mNum, phone; //ȸ����ȣ, ��ȭ��ȣ
	String email, pwd, nick; //�̸���(���̵�), ��й�ȣ, �г���
	
	//cate���̺�
	int cNum; //ī�װ��ڵ�
	String cName;//ī�װ��̸�
	
	//rep���̺�
	int rNum; //��۹�ȣ
	String rText; //��۳���
	Date rDate; //����ۼ���¥
	
	//boa���̺�
	int bNum, person, viewCnt; //�Խñ۹�ȣ, �����ο�, ��ȸ��
	String  bTitle, startTime, endTime, preText, mainText, img, place, detailPlace; //����, ����-�� ��¥ �� �ð�, ���ܳ���, �󼼳���, �̹����̸�, ���;
	Date startDate, endDate;
	String startD, endD; //��¥��ȯ
	MultipartFile img_f; //�̹�������
	
	
	
	

	
}//class END
