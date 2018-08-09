package com.spring.mvc.email;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface IDaoEmail {
	
	//�������� ������ �α��� ���̵�=mail_rcvmember�� ���� ������ List�� ��������
	public List<DtoEmail> listRcvMail(String key,@Param("pagenum") int pagenum,@Param("contentnum") int contentnum);
	
	//������ ������ �α��� ���̵�=mail_rcvmember and rcv=0 ,=member_id and send=0
	public List<DtoEmail> listTrashMail(String key,@Param("pagenum") int pagenum,@Param("contentnum") int contentnum);
	
	//������� ������ �α��� ���̵�=mail_rcvmember and rcv=2 ,=member_id and send=2
	public List<DtoEmail> listSaveMail(String key,@Param("pagenum") int pagenum,@Param("contentnum") int contentnum);
		
	//�������� ������ �α��� ���̵�=member_id�� ���� ������ List�ΰ�������
	public List<DtoEmail> listSendMail(String key,@Param("pagenum") int pagenum, @Param("contentnum")int contentnum);
	
	//���Ͼ��� ��ȣ(id=�Ŀ��ڵ��Է�),�������,�������,�����ð�,����,����
	public void insertMail(String mail_title,String mail_content,String member_id,String mail_rcvmember);
	
	//���ϻ��� ��ȣ �Է½� ���ϻ���
	public void deleteMail(String key);
	
	//�������� Ŭ���� �����б�
	public DtoEmail listMail(String key);
	
	//�������� ������ ���������� ������
	public void moveTrashRcv(String key);
	
	//�������� ������ ���������� ������
	public void moveTrashSend(String key);
	
	//�������� ������ �������������� ������
	public void moveSendMail(String key);
	
	//�������� ������ �������������� ������
	public void moveRcvMail(String key);
	
	//�������� ����� ������������� ������
	public void moveSaveRcv(String key);
	
	//�������� ����� ������������� ������
	public void moveSaveSend(String key);
	
	//�� �������� ���� ���ϱ�
	public int rcvcount(String key);
	
	//�� �������� ���� ���ϱ�
	public int sendcount(String key);
	
	//�� ������ ���� ���� ���ϱ�
	public int trashcount(String key);
	
	//�� ������� ���� ���ϱ�
	public int savecount(String key);
	
	//�������� ���� �� �����ð� �Է��ϱ�
	public void rcvtime(String key);
	
	//��¥ �ð������� �׽�Ʈ
	public String testdate(String key);
	
	//������ �������� ������ rcv -1
	public void makeMinusRcv(String key);
	
	//������ �������� ������ send -1
	public void makeMinusSend(String key);
	
	//Ȩ������ ���ο� �ֽŸ��� 5�� ����
	public List<DtoEmail> listRecentMail(String key);
	
	//���Ͼ��� �� member���̺� ��ϵǾ��ִ� id�� �޺��ڽ�������
	public List<MemberDTO> mailWriteMember();
	
	//������ �ִ��� ���ϱ�
	public int receivercnt(String key);
	
}
